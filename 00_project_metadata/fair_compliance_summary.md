# FAIR Compliance Summary

## Findable

- Source data is findable via a persistent DOI: https://doi.org/10.25919/pec2-hs50 (Dorji et al., 2025, CSIRO)
- This pipeline code is findable via GitHub release v1.0.0 with a stable URL
- Structured stage directories and manifest file (`data_manifest.csv`) aid internal discoverability

## Accessible

- Source climate data is openly accessible via the CSIRO Data Access Portal at the DOI above
- Pipeline code is openly accessible on GitHub under an MIT licence
- Distribution model is documented in `data_access.md` and `data_download.md`

## Interoperable

- Standard raster formats (GeoTIFF, Cloud Optimised GeoTIFF)
- Standard coordinate reference system (EPSG:5266, DRUKREF 03 / Bhutan National Grid)
- CSV metadata tables for variable definitions, GCM inventory, and scenario inventory

## Reusable

- Full citation metadata: `citation.cff`, `citation.txt`
- Source DOI and provenance documented in `data_provenance.md`
- Variable definitions, units, and file naming conventions documented in `variable_dictionary.csv` and `README_BhutanBioClims.md`
- Full methodological detail (bias correction, BIO variable formulas, ensemble approach, VIF screening) documented in `METHODS.md`
- MIT licence for pipeline code; source data licence: CC BY 4.0 (CSIRO)

---

Updated: 2026-04-23
