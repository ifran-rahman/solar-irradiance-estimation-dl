#!/usr/bin/env bash
# Wait for v7 (Solar_Enhanced_IR) to start and a GPU slot (<2 runs) to free up, then train main.ipynb.
cd "$(dirname "$0")"
LOG=../Solar_Enhanced_IR/run_all.log
until grep -q "v7_inception_clahe3_norm_cmap started" "$LOG"; do sleep 60; done
sleep 30
while [ "$(pgrep -fc '^/home/ifran/miniconda3/envs/torch/bin/python .*jupyter-nbconvert')" -ge 2 ]; do sleep 60; done
OUT=result/mobilenet_regression_v2
echo "mobilenet started $(date)" | tee -a "$OUT/queue.log"
if MPLBACKEND=Agg /home/ifran/miniconda3/envs/torch/bin/jupyter nbconvert --to notebook --execute main.ipynb \
    --output-dir "$OUT" --output main_run.ipynb --ExecutePreprocessor.timeout=-1 \
    --ExecutePreprocessor.kernel_name=torch > "$OUT/run.log" 2>&1; then
    echo "mobilenet finished $(date)" | tee -a "$OUT/queue.log"
else
    echo "mobilenet FAILED $(date), see $OUT/run.log" | tee -a "$OUT/queue.log"
fi
