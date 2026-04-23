# Publishing Guide

This repository contains **processing code and metadata only**. The underlying climate data is not hosted here and is not redistributed.

---

## Distribution Model

| Component | Platform | Notes |
|-----------|----------|-------|
| Code & Metadata | GitHub (this repository) | Scripts, documentation, workflow definitions |
| Source Climate Data | CSIRO Data Access Portal | Dorji et al. (2025) — DOI: 10.25919/pec2-hs50 |

Users download source data from CSIRO and use the scripts in this repository to reproduce the bioclimatic variable pipeline.

---

## What Is Tracked in Git

**Included:**
- `README.md`, `LICENSE`, `PUBLISHING.md`
- `.github/` (CI workflows)
- `00_project_metadata/` (citation, provenance, variable dictionaries)
- `10_scripts/` (R and PowerShell pipeline scripts)

**Excluded (heavy data, not redistributed):**
- `01_raw_cmip6_data/` through `09_release/`
- `*.tif`, `*.tiff`, `*.vrt`

---

## Publishing Checklist

- [x] Code repository live on GitHub
- [x] GitHub release v1.0.0 tagged
- [x] Citation metadata in `00_project_metadata/citation.cff`
- [x] Source data DOI (10.25919/pec2-hs50) referenced in all documentation

---

## Creating a GitHub Release

```bash
git tag v1.0.0
git push origin v1.0.0
```

Use `09_release/v1_0_0/changelog.md` as the basis for release notes.

---

## Linking Everything

Ensure the following files all reference the CSIRO source DOI and the GitHub repository URL:

- `README.md`
- `00_project_metadata/data_access.md`
- `00_project_metadata/data_download.md`
- `00_project_metadata/citation.cff`

---

**Document Version**: 2.0
**Last Updated**: 2026-04-23
