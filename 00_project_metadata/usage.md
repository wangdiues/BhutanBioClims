# Usage

## Step 1: Download Source Data

Download climate grids from the CSIRO source dataset:

> Dorji et al. (2025). *High-resolution (250 m) historical and projected (CMIP6) air temperature and precipitation grids for Bhutan* (v1). CSIRO.
> DOI: https://doi.org/10.25919/pec2-hs50

Place raw monthly rasters into:
```
01_raw_cmip6_data/01_cmip6_monthly/
```

---

## Step 2: Run the Full Pipeline

```powershell
pwsh -File .\10_scripts\ps\run_all.ps1 -ProjectRoot "." -Overwrite -CleanOutputs
```

Or run the R entry point directly:

```bash
Rscript 10_scripts/r/bioclim_master.R \
  --input_root ./01_raw_cmip6_data/01_cmip6_monthly \
  --output_root ./03_bioclim_variables/01_bioclim_by_gcm
```

---

## Step 3: Verify Critical Outputs

```powershell
Get-ChildItem .\04_ensemble_products\ensemble_mean\1986_2015\historical -File -Filter *.tif | Measure-Object
Get-Item .\05_multicollinearity_analysis\vif_results.csv, .\06_quality_control\raster_alignment_report.txt | Select Name,LastWriteTime,Length
```

---

## Run Facts (last verified)

- Last pipeline run: 2026-02-22T17:14:58+06:00
- Ensemble rasters (04): 988
- Historical ensemble mean rasters (1986_2015/historical): 19
- Latest multicollinearity file: 2026-02-22 16:46:03
- Latest QC alignment report: 2026-02-22 16:43:36
- Latest integrity summary: 2026-02-22 16:07:30
