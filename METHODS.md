# Methods

## 1. Source Climate Data

Monthly temperature (tasmin, tasmax) and precipitation (pr) rasters for Bhutan were obtained from:

> Dorji, S., Stewart, S., Bajwa, A., Aziz, A., Shabbir, A., & Adkins, S. (2025).
> *High-resolution (250 m) historical and projected (CMIP6) air temperature and precipitation grids for Bhutan* (v1). CSIRO. Data Collection.
> DOI: https://doi.org/10.25919/pec2-hs50

These grids cover 10 CMIP6 General Circulation Models (GCMs), 4 Shared Socioeconomic Pathway scenarios (SSP1-2.6, SSP2-4.5, SSP3-7.0, SSP5-8.5), and 4 time periods (historical 1986–2015; future 2021–2050, 2051–2080, 2071–2100).

---

## 2. Bias Correction and Downscaling

Bias correction and statistical downscaling to 250 m spatial resolution were performed upstream by Dorji et al. (2025) using a **delta-change (anomaly) method**: CMIP6 model anomalies relative to a historical baseline period were applied to high-resolution observed climatologies derived from station data and thin-plate spline interpolation. No additional bias correction is applied in this pipeline.

---

## 3. Bioclimatic Variable Computation

BIO1–BIO19 variables were computed from monthly tasmin, tasmax, and pr rasters following the standard definitions of:

- **Nix (1986)**: original bioclimatic envelope framework
- **O'Donnell & Ignizio (2012)**: formalised variable definitions used in ANUCLIM and WorldClim

Implementation uses the R `terra` package (Hijmans et al., 2023). Unit conversions are applied automatically where required:
- Temperature: Kelvin → °C (subtract 273.15) if input range indicates Kelvin
- Precipitation: kg m⁻² s⁻¹ → mm month⁻¹ (multiply by seconds per month) if input values indicate flux units

Variables computed:

| Code | Name | Units |
|------|------|-------|
| BIO01 | Annual Mean Temperature | °C |
| BIO02 | Mean Diurnal Range | °C |
| BIO03 | Isothermality (BIO02/BIO07 × 100) | % |
| BIO04 | Temperature Seasonality (SD × 100) | — |
| BIO05 | Max Temperature of Warmest Month | °C |
| BIO06 | Min Temperature of Coldest Month | °C |
| BIO07 | Temperature Annual Range (BIO05–BIO06) | °C |
| BIO08 | Mean Temperature of Wettest Quarter | °C |
| BIO09 | Mean Temperature of Driest Quarter | °C |
| BIO10 | Mean Temperature of Warmest Quarter | °C |
| BIO11 | Mean Temperature of Coldest Quarter | °C |
| BIO12 | Annual Precipitation | mm |
| BIO13 | Precipitation of Wettest Month | mm |
| BIO14 | Precipitation of Driest Month | mm |
| BIO15 | Precipitation Seasonality (CV) | % |
| BIO16 | Precipitation of Wettest Quarter | mm |
| BIO17 | Precipitation of Driest Quarter | mm |
| BIO18 | Precipitation of Warmest Quarter | mm |
| BIO19 | Precipitation of Coldest Quarter | mm |

---

## 4. Ensemble Products

Multi-model ensemble statistics were computed across all available GCMs for each SSP and time period:

- **Mean**: arithmetic mean across models
- **Median**: median across models
- **Standard deviation (SD)**: inter-model spread (uncertainty proxy)
- **Minimum / Maximum**: model range bounds

Ensemble products require a minimum of 2 models per cell. Cells where fewer models provided valid data are assigned NA.

---

## 5. Multicollinearity Screening

Variance Inflation Factor (VIF) analysis was applied to the ensemble mean layers to identify and remove highly collinear predictors for downstream Species Distribution Modelling (SDM). The `usdm` R package (Naimi et al., 2014) was used. Variables with VIF > 10 were iteratively removed.

---

## 6. Quality Control

Post-processing QC checks included:

- Raster alignment verification (extent, resolution, CRS consistency across all outputs)
- NA/NaN/Inf cell counts logged per layer
- File integrity checks (file size, completeness)

QC reports are stored in `06_quality_control/`.

---

## 7. Coordinate Reference System

All outputs are in **EPSG:5266 — DRUKREF 03 / Bhutan National Grid**, the national standard CRS for Bhutan. Spatial resolution: 250 m.

---

## References

- Hijmans, R.J. et al. (2023). *terra: Spatial Data Analysis*. R package v1.7. https://CRAN.R-project.org/package=terra
- Naimi, B. et al. (2014). Where is positional uncertainty a problem for species distribution modelling? *Ecography*, 37(2), 191–203. https://doi.org/10.1111/j.1600-0587.2013.00205.x
- Nix, H.A. (1986). A biogeographic analysis of Australian elapid snakes. In: Longmore, R. (ed.), *Atlas of Elapid Snakes of Australia*, pp. 4–15. Australian Government Publishing Service, Canberra.
- O'Donnell, M.S. & Ignizio, D.A. (2012). *Bioclimatic predictors for supporting ecological applications in the conterminous United States*. US Geological Survey Data Series 691.
- Dorji, S., Stewart, S., Bajwa, A., Aziz, A., Shabbir, A., & Adkins, S. (2025). *High-resolution (250 m) historical and projected (CMIP6) air temperature and precipitation grids for Bhutan* (v1). CSIRO. https://doi.org/10.25919/pec2-hs50
