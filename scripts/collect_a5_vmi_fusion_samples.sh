#!/usr/bin/env bash
set -euo pipefail

: "${WORK_ROOT:?set WORK_ROOT to the directory containing generated cases}"
: "${RESULT_ROOT:?set RESULT_ROOT to the output directory}"

DEVICE_ID=${DEVICE_ID:-7}
REPEATS=${REPEATS:-5}
MSPROF=${MSPROF:-${ASCEND_HOME_PATH:-/usr/local/Ascend/latest}/tools/profiler/bin/msprof}

cases=(
  prefill_softmax
  prefill_rope
  decode_rmsnorm
  decode_rmsnorm_rope
  decode_comb_sinkhorn
  prefill_comb_sinkhorn
)
variants=(ordinary vmi_candidate vmi_loop vmi_fused)

mkdir -p "$RESULT_ROOT"
samples="$RESULT_ROOT/samples.tsv"
printf 'case\tvariant\trepeat\ttask_duration_us\toutput_sha256\tprofile\n' >"$samples"

output_digest() {
  local generated=$1
  python3 - "$generated" <<'PY'
import hashlib
import json
import sys
from pathlib import Path

root = Path(sys.argv[1])
names = [
    line.strip()
    for line in (root / "outputs.txt").read_text().splitlines()
    if line.strip()
]
mapping = {
    name: hashlib.sha256((root / f"{name}.bin").read_bytes()).hexdigest()
    for name in names
}
payload = json.dumps(mapping, sort_keys=True, separators=(",", ":"))
print(hashlib.sha256(payload.encode()).hexdigest())
PY
}

task_duration() {
  local profile=$1
  python3 - "$profile" <<'PY'
import csv
import sys
from pathlib import Path

files = sorted(Path(sys.argv[1]).rglob("task_time_*.csv"))
if not files:
    raise SystemExit("missing task_time CSV")
with files[-1].open(newline="") as stream:
    rows = [
        row
        for row in csv.DictReader(stream)
        if row.get("kernel_name") not in (None, "", "N/A")
    ]
if len(rows) != 1:
    raise SystemExit(f"expected one measured kernel task, found {len(rows)}")
print(rows[0]["task_time(us)"])
PY
}

# Run all heavy variants serially. Parallel profiling produced device-level
# contention in earlier experiments and is not a valid comparison protocol.
for case_name in "${cases[@]}"; do
  for variant in "${variants[@]}"; do
    generated="$WORK_ROOT/$case_name/$variant/generated/$variant/${case_name}_${variant}"
    application="$generated/build/${case_name}_${variant}"
    [[ -x "$application" ]] || {
      echo "missing application: $application" >&2
      exit 1
    }

    export ACL_DEVICE_ID=$DEVICE_ID GOLDEN_MODE=skip RUN_MODE=npu
    (cd "$generated" && "$application" >/dev/null 2>&1)
    echo "warmup $case_name/$variant"

    for ((repeat = 1; repeat <= REPEATS; ++repeat)); do
      relative_profile="$case_name/profiles/${variant}-${repeat}"
      profile="$RESULT_ROOT/$relative_profile"
      log="$RESULT_ROOT/$case_name/logs/${variant}-${repeat}.log"
      rm -rf "$profile"
      mkdir -p "$profile" "$(dirname "$log")"
      (cd "$generated" && "$MSPROF" \
        --output="$profile" \
        --application="$application" >"$log" 2>&1)
      duration=$(task_duration "$profile")
      digest=$(output_digest "$generated")
      profile_ref="\${RESULT_ROOT}/$relative_profile"
      printf '%s\t%s\t%s\t%s\t%s\t%s\n' \
        "$case_name" "$variant" "$repeat" "$duration" "$digest" "$profile_ref" \
        >>"$samples"
      echo "sample $case_name/$variant $repeat/$REPEATS duration_us=$duration"
    done
  done
done

echo "samples=$samples"
