param(
    [string]$RepoId = "Wangdiues/cmip6_bioclim_bhutan_v10",
    [string]$Token = ""
)

$ErrorActionPreference = "Stop"

function Invoke-Hf {
    param(
        [Parameter(ValueFromRemainingArguments = $true)]
        [string[]]$Args
    )

    if ($Token) {
        & hf @Args --token $Token
    }
    else {
        & hf @Args
    }
}

if (-not (Get-Command hf -ErrorAction SilentlyContinue)) {
    throw "The 'hf' CLI is not installed. Install it first with: python -m pip install -U huggingface_hub"
}

$root = Resolve-Path (Join-Path $PSScriptRoot "..\..")
$datasetCard = Join-Path $root "00_project_metadata\huggingface_dataset_card.md"
$manifest = Join-Path $root "00_project_metadata\data_manifest.csv"
$checksums = Join-Path $root "00_project_metadata\checksums_sha256.csv"

Write-Host "Uploading dataset card to README.md..."
Invoke-Hf upload $RepoId $datasetCard README.md --repo-type dataset

Write-Host "Uploading manifest files..."
Invoke-Hf upload $RepoId $manifest 00_project_metadata/data_manifest.csv --repo-type dataset
Invoke-Hf upload $RepoId $checksums 00_project_metadata/checksums_sha256.csv --repo-type dataset

$include = @(
    "01_raw_cmip6_data/**",
    "02_bias_corrected_data/**",
    "03_bioclim_variables/**",
    "04_ensemble_products/**",
    "05_multicollinearity_analysis/**",
    "06_quality_control/**",
    "07_logs/**",
    "08_model_ready_layers/**",
    "09_release/**"
)

$args = @("upload-large-folder", $RepoId, $root, "--repo-type", "dataset")
foreach ($pattern in $include) {
    $args += @("--include", $pattern)
}

Write-Host "Uploading large dataset folders..."
Invoke-Hf @args

Write-Host "Dataset publication complete."
