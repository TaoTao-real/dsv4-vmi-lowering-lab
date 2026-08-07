# DSv4 PTO Input Snapshot

This directory contains the 120 generated `.pto` files used by the checked-in
DSv4 VMI lowering reports. Keeping the compiler inputs beside the reports makes
the static lowering experiments reproducible without a private workspace
layout or a separately downloaded `build_output` directory.

## Provenance

- Source project: [`hw-native-sys/pypto-lib`](https://github.com/hw-native-sys/pypto-lib)
- Source checkout: `0999dbaf492b57327fd8e4902a94a570d274762f`
- Model path: `models/deepseek/v4`
- Generated snapshot directories: `_jit_*_20260723_*/ptoas`
- Snapshot file count: 120

The source project ignores `build_output`, so these files are generated
compiler inputs rather than files tracked by the source checkout. They are
stored here byte-for-byte as consumed by the PTOAS experiments; no formatting
or canonicalization was applied.

The authoritative byte count and SHA256 for each file are recorded in:

```text
manifests/533887b4ae09635e9c7ddb5db7d7bf29c12f8347-inputs.tsv
```

Run the verifier from the repository root:

```bash
python3 scripts/verify_inputs.py
```

These `.pto` files contain compiler IR only. They do not contain model weights,
tensor dumps, access credentials, device binaries, or private machine paths.

## Runtime Data Boundary

These inputs reproduce PTOAS lowering and static FusionRegion analysis. They do
not by themselves reproduce the historical Camodel measurements. Runtime
performance also requires the matching harness, fixed numerical fixtures,
compiled objects, CANN/Camodel version, and timing command. Historical runtime
results remain explicitly classified as such in the performance reports.
