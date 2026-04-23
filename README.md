# BhutanBioClims: CMIP6 Bioclimatic Variable Pipeline for Bhutan

This repository provides the **processing pipeline and metadata** for computing 250 m bioclimatic variables (BIO1–BIO19) for Bhutan from CMIP6 climate projections.

It does **not** host the climate data. Source data must be downloaded from the original CSIRO dataset (see below).

---

## Source Data

Download the required climate grids from:

> Dorji, S., Stewart, S., Bajwa, A., Aziz, A., Shabbir, A., & Adkins, S. (2025).
> *High-resolution (250 m) historical and projected (CMIP6) air temperature and precipitation grids for Bhutan* (v1). CSIRO. Data Collection.
> **DOI: https://doi.org/10.25919/pec2-hs50**

---

## Getting Started

1. Download source climate grids from [https://doi.org/10.25919/pec2-hs50](https://doi.org/10.25919/pec2-hs50)
2. Place raw monthly rasters into `01_raw_cmip6_data/01_cmip6_monthly/`
3. Run the pipeline:

```bash
Rscript 10_scripts/r/bioclim_master.R \
  --input_root ./01_raw_cmip6_data/01_cmip6_monthly \
  --output_root ./03_bioclim_variables/01_bioclim_by_gcm
```

Or using PowerShell (full pipeline):

```powershell
pwsh -File ./10_scripts/ps/run_all.ps1 -ProjectRoot . -Overwrite -CleanOutputs
```

---

## Pipeline Structure

```
cmip6_bioclim_bhutan_v1_0/
├── 00_project_metadata/         ← Citation, provenance, variable dictionaries
├── 01_raw_cmip6_data/           ← Place source data here (not tracked in git)
├── 02_bias_corrected_data/      ← Intermediate bias-corrected grids
├── 03_bioclim_variables/        ← Per-GCM BIO1–BIO19 rasters
├── 04_ensemble_products/        ← Multi-model ensemble mean/SD/min/max/uncertainty
├── 05_multicollinearity_analysis/ ← VIF/correlation screening outputs
├── 06_quality_control/          ← QC and alignment reports
├── 07_logs/                     ← Processing logs
├── 08_model_ready_layers/       ← Final SDM-ready predictor rasters
└── 10_scripts/                  ← All R and PowerShell scripts
```

---

## Outputs

- **Historical baseline**: BIO1–BIO19 for 1986–2015
- **Future projections**: BIO1–BIO19 for 10 GCMs × 4 SSPs × 3 time periods (2021–2050, 2051–2080, 2071–2100)
- **Ensemble products**: mean, standard deviation, minimum, maximum, uncertainty maps
- **Predictor sets**: multicollinearity-screened subsets for SDM use

---

## Metadata

See `00_project_metadata/` for:

| File | Contents |
|------|----------|
| `citation.cff` / `citation.txt` | How to cite this pipeline |
| `data_provenance.md` | Processing lineage |
| `variable_dictionary.csv` | BIO variable definitions and units |
| `gcm_inventory.csv` | GCM inventory |
| `ssp_inventory.csv` | SSP/scenario inventory |
| `temporal_coverage.csv` | Time period inventory |
| `modeling_guide.html` | Detailed guide for downstream SDM workflows |

---

## Methods

Bioclimatic variables (BIO1–BIO19) follow the standard definitions of O'Donnell & Ignizio (2012) and Nix (1986), computed from monthly tasmin, tasmax, and pr rasters using the R `terra` package. Source climate grids (Dorji et al., 2025) are pre-bias-corrected and downscaled to 250 m by the CSIRO team using a delta-change approach; no additional bias correction is applied in this pipeline. See `METHODS.md` for full methodological detail.

---

## Citation

If you use this pipeline or its outputs, please cite both this repository and the source dataset:

**This pipeline:**
See `00_project_metadata/citation.cff`

**Source data (required):**
> Dorji, S., Stewart, S., Bajwa, A., Aziz, A., Shabbir, A., & Adkins, S. (2025).
> *High-resolution (250 m) historical and projected (CMIP6) air temperature and precipitation grids for Bhutan* (v1). CSIRO. Data Collection.
> https://doi.org/10.25919/pec2-hs50

---

## Repository

- GitHub: https://github.com/wangdiues/BhutanBioClims-High-resolution-250-m-historical-and-projected-CMIP6-bioclimatic-variables-for-Bhutan
- Release v1.0.0: https://github.com/wangdiues/BhutanBioClims-High-resolution-250-m-historical-and-projected-CMIP6-bioclimatic-variables-for-Bhutan/releases/tag/v1.0.0
