# PowerShell script to create arXiv submission package
# Run this script from the author-kit-CVPR2026-v1-latex- directory

Write-Host "Creating arXiv submission package..." -ForegroundColor Green

# Define submission directory
$submitDir = "arxiv_submission"

# Remove old submission directory if it exists
if (Test-Path $submitDir) {
    Write-Host "Removing old submission directory..." -ForegroundColor Yellow
    Remove-Item -Recurse -Force $submitDir
}

# Create submission directory structure
Write-Host "Creating directory structure..." -ForegroundColor Cyan
New-Item -ItemType Directory -Force -Path $submitDir | Out-Null

# Copy main LaTeX files
Write-Host "Copying main LaTeX files..." -ForegroundColor Cyan
$mainFiles = @(
    "main.tex",
    "main.bib",
    "preamble.tex",
    "math_commands.tex",
    "cvpr.sty",
    "ieeenat_fullname.bst"
)

foreach ($file in $mainFiles) {
    if (Test-Path $file) {
        Copy-Item $file $submitDir
        Write-Host "  ✓ Copied $file" -ForegroundColor Gray
    } else {
        Write-Host "  ✗ Warning: $file not found!" -ForegroundColor Red
    }
}

# Copy section files (flattened - no subdirectory)
Write-Host "Copying section files..." -ForegroundColor Cyan
$sectionFiles = @(
    @{Source = "sec\0_abstract.tex"; Dest = "sec_0_abstract.tex"},
    @{Source = "sec\1_intro.tex"; Dest = "sec_1_intro.tex"},
    @{Source = "sec\2_preliminaries.tex"; Dest = "sec_2_preliminaries.tex"},
    @{Source = "sec\3_methodology.tex"; Dest = "sec_3_methodology.tex"},
    @{Source = "sec\4_experiments.tex"; Dest = "sec_4_experiments.tex"},
    @{Source = "sec\5_related_work.tex"; Dest = "sec_5_related_work.tex"},
    @{Source = "sec\5a_discussion.tex"; Dest = "sec_5a_discussion.tex"},
    @{Source = "sec\6_conclusion.tex"; Dest = "sec_6_conclusion.tex"},
    @{Source = "sec\appendix.tex"; Dest = "sec_appendix.tex"},
    @{Source = "sec\appendix_tables.tex"; Dest = "sec_appendix_tables.tex"},
    @{Source = "sec\appendix_variance.tex"; Dest = "sec_appendix_variance.tex"}
)

foreach ($file in $sectionFiles) {
    if (Test-Path $file.Source) {
        Copy-Item $file.Source "$submitDir\$($file.Dest)"
        Write-Host "  ✓ Copied $($file.Source) -> $($file.Dest)" -ForegroundColor Gray
    } else {
        Write-Host "  ✗ Warning: $($file.Source) not found!" -ForegroundColor Red
    }
}

# Copy image files
Write-Host "Copying image files..." -ForegroundColor Cyan
$imageFiles = @(
    "domain_feature_collapse.jpg",
    "butterfly_1_sample.jpg",
    "cards_1_sample.jpg",
    "colon_1_sample.jpg",
    "eurosat_1_sample.jpg",
    "fashion_1_sample.jpg",
    "food_1_sample.jpg",
    "garbage_1_sample.jpg",
    "plant_1_sample.jpg",
    "rock_1_sample.jpg",
    "tissue_1_sample.jpg",
    "yoga_1_sample.jpg",
    "figure1.pdf",
    "figure2.pdf"
)

foreach ($file in $imageFiles) {
    if (Test-Path $file) {
        Copy-Item $file $submitDir
        Write-Host "  ✓ Copied $file" -ForegroundColor Gray
    } else {
        Write-Host "  ✗ Warning: $file not found!" -ForegroundColor Red
    }
}

# Create ZIP file
Write-Host "Creating ZIP archive..." -ForegroundColor Cyan
$zipFile = "arxiv_submission.zip"
if (Test-Path $zipFile) {
    Remove-Item $zipFile
}

Compress-Archive -Path "$submitDir\*" -DestinationPath $zipFile -Force

# Display summary
Write-Host "`n========================================" -ForegroundColor Green
Write-Host "arXiv submission package created!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host "Package location: $zipFile" -ForegroundColor Yellow
Write-Host "Package size: $((Get-Item $zipFile).Length / 1MB) MB" -ForegroundColor Yellow
Write-Host "`nNext steps:" -ForegroundColor Cyan
Write-Host "1. Review the contents of $submitDir" -ForegroundColor White
Write-Host "2. Update author information in main.tex" -ForegroundColor White
Write-Host "3. Test compilation in the $submitDir directory" -ForegroundColor White
Write-Host "4. Upload $zipFile to arXiv" -ForegroundColor White
Write-Host "`nFor detailed instructions, see ARXIV_SUBMISSION_README.md" -ForegroundColor Cyan

