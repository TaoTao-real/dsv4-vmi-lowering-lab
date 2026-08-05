#!/usr/bin/env python3

from __future__ import annotations

import importlib.util
import json
from pathlib import Path
from tempfile import TemporaryDirectory
import unittest
from unittest import mock


REPO = Path(__file__).resolve().parents[1]
MODULE_PATH = REPO / "harness/camodel_harness.py"
SPEC = importlib.util.spec_from_file_location("camodel_harness", MODULE_PATH)
assert SPEC and SPEC.loader
HARNESS = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(HARNESS)


class CamodelHarnessTest(unittest.TestCase):
    def test_manifest_inputs_exist(self):
        manifest = json.loads((REPO / "harness/cases.json").read_text())
        self.assertEqual(manifest["schema_version"], 1)
        self.assertEqual(len(manifest["cases"]), 3)
        for case in manifest["cases"].values():
            self.assertTrue((REPO / case["pto"]).is_file())

    def test_scalar_overrides_are_exact(self):
        with TemporaryDirectory() as directory:
            main_cpp = Path(directory) / "main.cpp"
            main_cpp.write_text(
                "    int64_t v10 = 1;\n"
                "    int32_t v11 = 1;\n"
                "    int32_t v12 = 1;\n"
            )
            HARNESS.patch_scalar_overrides(
                main_cpp, {"v10": 128, "v11": 0, "v12": 64}
            )
            self.assertEqual(
                main_cpp.read_text(),
                "    int64_t v10 = 128;\n"
                "    int32_t v11 = 0;\n"
                "    int32_t v12 = 64;\n",
            )

    def test_unknown_selection_is_rejected(self):
        with self.assertRaises(SystemExit):
            HARNESS.select_names("missing", ["ordinary"])
        with self.assertRaises(SystemExit):
            HARNESS.select_names("", ["ordinary"])

    def test_generated_case_directory_is_discovered_under_any_category(self):
        with TemporaryDirectory() as directory:
            root = Path(directory)
            testcase = root / "generated" / "ordinary" / "rope_ordinary"
            testcase.mkdir(parents=True)
            (testcase / "validation_meta.env").touch()
            self.assertEqual(
                HARNESS.discover_generated_case_dir(
                    root / "generated", "rope_ordinary"
                ),
                testcase,
            )

    def test_generated_case_directory_requires_exactly_one_match(self):
        with TemporaryDirectory() as directory:
            root = Path(directory) / "generated"
            with self.assertRaises(SystemExit):
                HARNESS.discover_generated_case_dir(root, "rope_ordinary")

            for category in ("ordinary", "ptoas"):
                testcase = root / category / "rope_ordinary"
                testcase.mkdir(parents=True)
                (testcase / "validation_meta.env").touch()
            with self.assertRaises(SystemExit):
                HARNESS.discover_generated_case_dir(root, "rope_ordinary")

    def test_optional_provenance_command_allows_non_git_source(self):
        with TemporaryDirectory() as directory:
            self.assertEqual(
                HARNESS.capture_optional(
                    ["git", "rev-parse", "HEAD"], cwd=Path(directory)
                ),
                "unknown",
            )

    def test_sample_execution_requests_simulator_build(self):
        with TemporaryDirectory() as directory:
            generated = Path(directory)
            run_sh = generated / "run.sh"
            run_sh.touch()
            with (
                mock.patch.object(
                    HARNESS, "generated_case_dir", return_value=generated
                ),
                mock.patch.object(
                    HARNESS, "runtime_env", return_value={"GOLDEN_MODE": "skip"}
                ),
                mock.patch.object(HARNESS, "run") as run_mock,
            ):
                HARNESS.execute_generated(
                    "prefill_rope", "ordinary", generated / "run.log",
                    golden_mode="sim",
                )
            self.assertEqual(run_mock.call_args.kwargs["env"]["GOLDEN_MODE"], "sim")

    def test_camodel_open_file_limit_is_raised(self):
        with (
            mock.patch.object(
                HARNESS.resource, "getrlimit", return_value=(1024, 1048576)
            ),
            mock.patch.object(HARNESS.resource, "setrlimit") as setrlimit_mock,
        ):
            HARNESS.ensure_open_file_limit()
        setrlimit_mock.assert_called_once_with(
            HARNESS.resource.RLIMIT_NOFILE, (65536, 1048576)
        )

    def test_kernel_symbol_accepts_extern_c_export(self):
        with mock.patch.object(
            HARNESS, "capture", side_effect=("00000000 T rope\n", "rope")
        ):
            self.assertEqual(
                HARNESS.resolve_kernel_symbol(Path("libkernel.so"), "rope"),
                "rope",
            )

    def test_variants_keep_the_fusion_comparison_isolated(self):
        self.assertEqual(HARNESS.VARIANTS["ordinary"]["backend"], "emitc")
        self.assertEqual(HARNESS.VARIANTS["vmi_base"]["backend"], "vpto")
        self.assertEqual(HARNESS.VARIANTS["vmi_fused"]["backend"], "vpto")
        self.assertIn(
            "--enable-op-fusion=false", HARNESS.VARIANTS["vmi_base"]["flags"]
        )
        self.assertIn(
            "--enable-op-fusion=true", HARNESS.VARIANTS["vmi_fused"]["flags"]
        )

    def test_profile_metrics_count_each_instruction_once(self):
        with TemporaryDirectory() as directory:
            root = Path(directory)
            (root / "msprof.stdout.log").write_text("Total tick: 1234\n")
            csv_path = root / "core0.veccore0_instr_exe.csv"
            csv_path.write_text(
                "instr,call_count\n"
                "VLOOP,2\n"
                "RV_VLD,3\n"
                "RV_VST,5\n"
                "VSST,7\n"
            )
            self.assertEqual(HARNESS.parse_profile(root), ("1234", 2, 3, 12))


if __name__ == "__main__":
    unittest.main()
