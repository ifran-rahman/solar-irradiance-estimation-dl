# Results: MobileNetV2 Regression (Girasol IR)

Model: MobileNetV2 with random initialization (no pretrained weights) and a linear regression head.
Metrics are on the test split in W/m². One seed (42).

| Run | Batch | Target scaling | RMSE | MAE | R² | Epochs | Results |
|---|---|---|---|---|---|---|---|
| v2 (current) | 256 | min-max | **65.53** | **39.92** | **0.9262** | 25 | `result/mobilenet_regression_v2/` |

The `v2` run uses the shared setup of this chapter. The earlier run in `result/mobilenet_regression/`
used batch 128 and raw W/m² targets, so it is not comparable with the other sections.

## Setup

Shared with `Solar_Enhanced_IR/` and `Solar_Estimation_KD/kd_full_split/`:
70/30 split of `girasol.csv` (348,785 / 149,480), 80×60 images, input standardization (mean 0.3938, std 0.0242),
min-max scaled irradiance targets (training-split statistics), MSE loss, Adam (LR 1e-4, weight decay 1e-5),
batch 256, ReduceLROnPlateau (×0.1, patience 2), early stopping patience 5, max 50 epochs.

Notebook: `main.ipynb`. Executed copy, checkpoint, loss curve and log: `result/mobilenet_regression_v2/`.
