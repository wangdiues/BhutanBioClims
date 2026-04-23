# Data Provenance

## Source Dataset

This pipeline ingests Bhutan climate rasters from:

> Dorji, S., Stewart, S., Bajwa, A., Aziz, A., Shabbir, A., & Adkins, S. (2025).
> *High-resolution (250 m) historical and projected (CMIP6) air temperature and precipitation grids for Bhutan* (v1). CSIRO. Data Collection.
> DOI: https://doi.org/10.25919/pec2-hs50

---

## Processing Lineage

| Stage | Directory | Contents |
|-------|-----------|----------|
| 1 | `01_raw_cmip6_data/01_cmip6_monthly/` | Monthly tasmin, tasmax, and pr rasters sourced from Dorji et al. (2025). These are already bias-corrected and downscaled to 250 m by the CSIRO team using delta-change methodology; no further bias correction is applied in this pipeline. |
| 2 | `02_bias_corrected_data/` | Pass-through stage (reserved). Source data from Dorji et al. (2025) are provided pre-bias-corrected; this directory is intentionally empty in v1.0. |
| 3 | `03_bioclim_variables/01_bioclim_by_gcm/` | BIO1–BIO19 computed per GCM/period/SSP using the standard O'Donnell & Ignizio (2012) / Nix (1986) bioclimatic variable definitions, implemented via the R `terra` package |
| 4 | `04_ensemble_products/` | Multi-model ensemble statistics (mean, median, SD, min, max) across all available GCMs per SSP and time period |
| 5 | `05_multicollinearity_analysis/` | VIF-based predictor screening outputs for SDM variable selection |
| 6 | `06_quality_control/` | Raster alignment, extent, CRS, and NA integrity reports |
| 7 | `08_model_ready_layers/` | Final multicollinearity-screened SDM-ready rasters |

---

## Latest Synchronization

- Refreshed: 2026-02-22T17:14:58+06:00
- Main run log: `07_logs/bioclim_run_20260222_140443.log`
- Ensemble log: `07_logs/ensemble_build_log.txt`
