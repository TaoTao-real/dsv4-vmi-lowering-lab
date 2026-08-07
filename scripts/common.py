#!/usr/bin/env python3

from __future__ import annotations

import hashlib
import os
from pathlib import Path


REPO = Path(__file__).resolve().parents[1]
WORKSPACE = REPO.parent
PTOAS_WORKTREE = Path(os.environ.get(
    "PTOAS_WORKTREE", str(WORKSPACE / "PTOAS_vmi_vf_next")
))
DSV4_ROOT = Path(os.environ.get(
    "DSV4_ROOT",
    str(REPO / "inputs/dsv4"),
))
PTOAS = Path(os.environ.get(
    "PTOAS_BIN", str(PTOAS_WORKTREE / "build-llvm21/tools/ptoas/ptoas")
))
PTODSL_PYTHON = Path(os.environ.get(
    "PTODSL_PYTHON",
    str(WORKSPACE / "llvm-workspace/.venv-llvm21/bin/python"),
))
MLIR_PYTHON_ROOT = Path(os.environ.get(
    "MLIR_PYTHON_ROOT",
    str(WORKSPACE / "llvm-workspace/llvm-project-21/build-shared/tools/mlir/python_packages/mlir_core"),
))

KEY_PASSES = (
    "pto-fusion-region-gen",
    "pto-vmi-loop-fusion",
    "pto-vmi-load-store-elision",
)


def git_commit() -> str:
    import subprocess

    return subprocess.check_output(
        ["git", "rev-parse", "HEAD"], cwd=PTOAS_WORKTREE, text=True
    ).strip()


def compiler_command(
    input_path: Path,
    output_path: Path,
    fusion: bool,
    insert_sync: bool = False,
) -> list[str]:
    command = [
        str(PTOAS),
        "--pto-arch=a5",
        "--pto-level=level3",
        "--pto-backend=vpto",
        "--tile-lib-backend=ptodsl",
        f"--ptodsl-pkg-path={PTOAS_WORKTREE / 'ptodsl'}",
        f"--ptodsl-python-exe={PTODSL_PYTHON}",
    ]
    if fusion:
        command.extend(("--enable-vmi", "--enable-op-fusion"))
    else:
        command.extend(("--enable-vmi", "--enable-op-fusion=false"))
    if insert_sync:
        command.append("--enable-insert-sync")
    command.extend(("--emit-vpto", str(input_path), "-o", str(output_path)))
    return command


def compiler_flags(fusion: bool, insert_sync: bool = False) -> list[str]:
    """Return the behavior-affecting flags recorded in experiment manifests."""
    flags = [
        "--pto-arch=a5",
        "--pto-level=level3",
        "--pto-backend=vpto",
        "--tile-lib-backend=ptodsl",
        "--enable-vmi",
        "--enable-op-fusion" if fusion else "--enable-op-fusion=false",
    ]
    if insert_sync:
        flags.append("--enable-insert-sync")
    flags.append("--emit-vpto")
    return flags


def command_env() -> dict[str, str]:
    env = os.environ.copy()
    env["MLIR_PYTHON_ROOT"] = str(MLIR_PYTHON_ROOT)
    return env


def safe_name(relative: Path) -> str:
    return str(relative).replace("/", "__").replace(" ", "_")


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()
