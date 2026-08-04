#!/usr/bin/env bash
set -euo pipefail

: "${A3_SSH_KEY:?set A3_SSH_KEY to the SSH private key}"
: "${A3_SSH_HOST:?set A3_SSH_HOST to user@host}"
: "${A3_CAMODEL_ROOT:?set A3_CAMODEL_ROOT to the remote harness root}"
SSH_KEY=$A3_SSH_KEY
HOST=$A3_SSH_HOST
REMOTE_ROOT=$A3_CAMODEL_ROOT
REPEATS=${REPEATS:-10}
TAG=${TAG:-$(date +%Y%m%d-%H%M%S)}
OUT=${OUT:-reports/camodel-repeats-${TAG}}
mkdir -p "$OUT/logs"

if [[ -n ${CASES:-} ]]; then
  read -r -a cases <<< "$CASES"
else
  cases=(
    softmax_off softmax_on softmax_vmi_base softmax_vmi_elide
    rope_off rope_on rope_vmi_base rope_vmi_loop rope_vmi_elide
    rmsnorm_off rmsnorm_on
  )
fi

printf 'case\trepeat\tstatus\ttotal_tick\tvloop\tvld\tvst\toutput_sha256\ttask_output\n' > "$OUT/samples.tsv"
for name in "${cases[@]}"; do
  for ((repeat = 1; repeat <= REPEATS; ++repeat)); do
    log="$OUT/logs/${name}.${repeat}.log"
    set +e
    ssh -i "$SSH_KEY" "$HOST" \
      "task-submit --timeout 1900 --max-time 1800 --run '$REMOTE_ROOT/vmi_camodel_harness/run_one_msprof.sh $name'" \
      >"$log" 2>&1
    status=$?
    set -e
    metrics=$(ssh -i "$SSH_KEY" "$HOST" "python3 - '$REMOTE_ROOT/camodel-msprof/$name'" <<'PY'
import csv
import hashlib
import re
import sys
from pathlib import Path

root = Path(sys.argv[1])
stdout = root / "msprof.stdout.log"
text = stdout.read_text(errors="replace") if stdout.exists() else ""
match = re.findall(r"Total tick:\s*(\d+)", text)
tick = match[-1] if match else "NA"

counts = {"VLOOP": 0, "VLD": 0, "VST": 0}
csvs = list(root.glob("OPPROF_*/simulator/core0.veccore0/core0.veccore0_instr_exe.csv"))
if csvs:
    with csvs[-1].open(newline="") as stream:
        for row in csv.DictReader(stream):
            instr = row.get("instr", "")
            calls = int(row.get("call_count", "0") or 0)
            if "VLOOP" in instr:
                counts["VLOOP"] += calls
            if instr.startswith("RV_VLD") or instr.startswith("VLD"):
                counts["VLD"] += calls
            if instr.startswith("RV_VST") or instr.startswith("VST") or instr.startswith("VSST"):
                counts["VST"] += calls

output = root / "output.bin"
digest = hashlib.sha256(output.read_bytes()).hexdigest() if output.exists() else "NA"
print(f"{tick}\t{counts['VLOOP']}\t{counts['VLD']}\t{counts['VST']}\t{digest}")
PY
)
    task_output=$(tail -n 1 "$log" | tr '\t\n' '  ' | sed 's/[[:space:]]*$//')
    printf '%s\t%s\t%s\t%s\t%s\n' "$name" "$repeat" "$status" "$metrics" "$task_output" \
      >> "$OUT/samples.tsv"
    printf '%s %02d/%02d status=%d metrics=%s\n' "$name" "$repeat" "$REPEATS" "$status" "$metrics"
  done
done

cat > "$OUT/provenance.txt" <<EOF
classification=historical-object-repeat-sampling
remote_host=$HOST
remote_root=$REMOTE_ROOT
repeats=$REPEATS
note=Remote binaries were built on 2026-08-03 and do not represent a newly rebuilt current PTOAS object.
EOF
