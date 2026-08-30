#!/usr/bin/env bash
# Stage-2 deliverable: a single entry point, data_dir -> submission CSV.
# The verification committee runs exactly this, on their machine, on data they
# release at the start of the session, following README.md step by step.
# Budget: <= 2 hours end to end. No network access. No API calls.
#
#   ./inference.sh <data_dir> <output_csv>
#
# <data_dir> is a directory of clip folders in the released layout:
#   <data_dir>/<clip_id>/<modality>/<files>

set -euo pipefail

DATA_DIR="${1:?usage: ./inference.sh <data_dir> <output_csv>}"
OUTPUT_CSV="${2:-submission.csv}"
CHECKPOINT="${CHECKPOINT:-checkpoints/model.pth}"

echo "data       : ${DATA_DIR}"
echo "checkpoint : ${CHECKPOINT}"
echo "output     : ${OUTPUT_CSV}"

python code/submit/make_submission.py \
    --data-dir "${DATA_DIR}" \
    --checkpoint "${CHECKPOINT}" \
    --config configs/default.yaml \
    --output "${OUTPUT_CSV}"

echo "wrote ${OUTPUT_CSV}"
