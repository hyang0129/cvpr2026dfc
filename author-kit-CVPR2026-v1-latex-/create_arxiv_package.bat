@echo off
REM Batch script to create arXiv submission package
REM Run this script from the author-kit-CVPR2026-v1-latex- directory

echo Creating arXiv submission package...
echo.

REM Define submission directory
set SUBMITDIR=arxiv_submission

REM Remove old submission directory if it exists
if exist %SUBMITDIR% (
    echo Removing old submission directory...
    rmdir /s /q %SUBMITDIR%
)

REM Create submission directory structure
echo Creating directory structure...
mkdir %SUBMITDIR%

REM Copy main LaTeX files (only source files, no auxiliary files)
echo Copying main LaTeX files...
if exist main.bib copy main.bib %SUBMITDIR%\ >nul
if exist main.bbl copy main.bbl %SUBMITDIR%\ >nul
if exist preamble.tex copy preamble.tex %SUBMITDIR%\ >nul
if exist math_commands.tex copy math_commands.tex %SUBMITDIR%\ >nul
if exist cvpr.sty copy cvpr.sty %SUBMITDIR%\ >nul
if exist ieeenat_fullname.bst copy ieeenat_fullname.bst %SUBMITDIR%\ >nul

REM Copy section files (flattened - no subdirectory)
echo Copying section files...
if exist sec\0_abstract.tex copy sec\0_abstract.tex %SUBMITDIR%\sec_0_abstract.tex >nul
if exist sec\1_intro.tex copy sec\1_intro.tex %SUBMITDIR%\sec_1_intro.tex >nul
if exist sec\2_preliminaries.tex copy sec\2_preliminaries.tex %SUBMITDIR%\sec_2_preliminaries.tex >nul
if exist sec\3_methodology.tex copy sec\3_methodology.tex %SUBMITDIR%\sec_3_methodology.tex >nul
if exist sec\4_experiments.tex copy sec\4_experiments.tex %SUBMITDIR%\sec_4_experiments.tex >nul
if exist sec\5_related_work.tex copy sec\5_related_work.tex %SUBMITDIR%\sec_5_related_work.tex >nul
if exist sec\5a_discussion.tex copy sec\5a_discussion.tex %SUBMITDIR%\sec_5a_discussion.tex >nul
if exist sec\6_conclusion.tex copy sec\6_conclusion.tex %SUBMITDIR%\sec_6_conclusion.tex >nul
if exist sec\appendix_tables.tex copy sec\appendix_tables.tex %SUBMITDIR%\sec_appendix_tables.tex >nul
if exist sec\appendix_variance.tex copy sec\appendix_variance.tex %SUBMITDIR%\sec_appendix_variance.tex >nul

REM Create modified appendix.tex with flattened paths
echo Creating modified appendix files...
powershell -Command "(Get-Content sec\appendix.tex) -replace 'sec/', 'sec_' | Set-Content '%SUBMITDIR%\sec_appendix.tex'"

REM Create modified main.tex with flattened paths
echo Creating modified main.tex...
powershell -Command "(Get-Content main.tex) -replace 'sec/', 'sec_' -replace 'sec_appendix\.tex', 'sec_appendix.tex' | Set-Content '%SUBMITDIR%\main.tex'"

REM Copy image files
echo Copying image files...
if exist domain_feature_collapse.jpg copy domain_feature_collapse.jpg %SUBMITDIR%\ >nul
if exist butterfly_1_sample.jpg copy butterfly_1_sample.jpg %SUBMITDIR%\ >nul
if exist cards_1_sample.jpg copy cards_1_sample.jpg %SUBMITDIR%\ >nul
if exist colon_1_sample.jpg copy colon_1_sample.jpg %SUBMITDIR%\ >nul
if exist eurosat_1_sample.jpg copy eurosat_1_sample.jpg %SUBMITDIR%\ >nul
if exist fashion_1_sample.jpg copy fashion_1_sample.jpg %SUBMITDIR%\ >nul
if exist food_1_sample.jpg copy food_1_sample.jpg %SUBMITDIR%\ >nul
if exist garbage_1_sample.jpg copy garbage_1_sample.jpg %SUBMITDIR%\ >nul
if exist plant_1_sample.jpg copy plant_1_sample.jpg %SUBMITDIR%\ >nul
if exist rock_1_sample.jpg copy rock_1_sample.jpg %SUBMITDIR%\ >nul
if exist tissue_1_sample.jpg copy tissue_1_sample.jpg %SUBMITDIR%\ >nul
if exist yoga_1_sample.jpg copy yoga_1_sample.jpg %SUBMITDIR%\ >nul
if exist figure1.pdf copy figure1.pdf %SUBMITDIR%\ >nul
if exist figure2.pdf copy figure2.pdf %SUBMITDIR%\ >nul

REM Clean up any auxiliary files in submission directory (but keep .bbl!)
echo Cleaning auxiliary files...
del %SUBMITDIR%\*.aux >nul 2>&1
del %SUBMITDIR%\*.log >nul 2>&1
del %SUBMITDIR%\*.out >nul 2>&1
del %SUBMITDIR%\*.blg >nul 2>&1
del %SUBMITDIR%\*.brf >nul 2>&1
del %SUBMITDIR%\*.fls >nul 2>&1
del %SUBMITDIR%\*.fdb_latexmk >nul 2>&1
del %SUBMITDIR%\*.synctex.gz >nul 2>&1
del %SUBMITDIR%\*.pdf >nul 2>&1

REM Create ZIP file using PowerShell (works without execution policy issues)
echo Creating ZIP archive...
if exist arxiv_submission.zip del arxiv_submission.zip
powershell -Command "Compress-Archive -Path '%SUBMITDIR%\*' -DestinationPath 'arxiv_submission.zip' -Force"

echo.
echo ========================================
echo arXiv submission package created!
echo ========================================
echo Package location: arxiv_submission.zip
echo.
echo Next steps:
echo 1. Review the contents of %SUBMITDIR%
echo 2. Update author information in main.tex
echo 3. Test compilation in the %SUBMITDIR% directory
echo 4. Upload arxiv_submission.zip to arXiv
echo.
echo For detailed instructions, see ARXIV_SUBMISSION_README.md
echo.
pause

