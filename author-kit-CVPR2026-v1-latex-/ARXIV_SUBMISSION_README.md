# arXiv Submission Guide

This document has been prepared for arXiv submission. Below are the steps and important information for submitting to arXiv.

## Changes Made for arXiv

1. **Document class**: Changed from `\usepackage[review]{cvpr}` to `\usepackage[pagenumbers]{cvpr}` for arXiv compatibility
2. **Author information**: Template updated to include actual author names (you need to fill in your details)
3. **Paper ID**: Commented out CVPR-specific paper ID fields
4. **Bibliography**: Updated with complete citation information
5. **File structure**: Flattened directory structure - all section files renamed from `sec/filename.tex` to `sec_filename.tex` (arXiv doesn't support subdirectories with backslashes)

## Files Required for arXiv Submission

### Essential Files
You need to include the following files in your arXiv submission:

#### Main Document Files
- `main.tex` - Main LaTeX file (modified with flattened paths)
- `main.bib` - Bibliography file
- `main.bbl` - Compiled bibliography (required by arXiv)
- `preamble.tex` - Preamble with package imports
- `math_commands.tex` - Custom math commands

#### Style Files
- `cvpr.sty` - CVPR style file
- `ieeenat_fullname.bst` - Bibliography style file

#### Section Files (flattened - no subdirectory)
- `sec_0_abstract.tex`
- `sec_1_intro.tex`
- `sec_2_preliminaries.tex`
- `sec_3_methodology.tex`
- `sec_4_experiments.tex`
- `sec_5_related_work.tex`
- `sec_5a_discussion.tex`
- `sec_6_conclusion.tex`
- `sec_appendix.tex`
- `sec_appendix_tables.tex`
- `sec_appendix_variance.tex`

#### Image Files
- `domain_feature_collapse.jpg`
- `butterfly_1_sample.jpg`
- `cards_1_sample.jpg`
- `colon_1_sample.jpg`
- `eurosat_1_sample.jpg`
- `fashion_1_sample.jpg`
- `food_1_sample.jpg`
- `garbage_1_sample.jpg`
- `plant_1_sample.jpg`
- `rock_1_sample.jpg`
- `tissue_1_sample.jpg`
- `yoga_1_sample.jpg`
- `figure1.pdf`
- `figure2.pdf`

### Files to EXCLUDE
Do NOT include these files:
- `*.aux`, `*.log`, `*.out`, `*.bbl`, `*.blg`, `*.fls`, `*.fdb_latexmk`, `*.synctex.gz`
- `main.pdf` (arXiv will generate this)
- `rebuttal.*` (CVPR-specific files)
- `anonymous-submission-latex-2026.pdf`

## Before Submitting

### 1. Update Author Information
Edit `main.tex` lines 31-46 to include your actual author information:
```latex
\author{Your Name\\
Your Institution\\
Your Address\\
{\tt\small your.email@institution.edu}
\and
Second Author\\
Second Institution\\
Second Address\\
{\tt\small second.author@institution.edu}
}
```

### 2. Verify Compilation
Run the following commands to ensure the document compiles correctly:
```bash
pdflatex main.tex
bibtex main
pdflatex main.tex
pdflatex main.tex
```

### 3. Check for Warnings
Review the compilation output for any warnings or errors that need to be addressed.

## Creating the arXiv Submission Package

### Option 1: Manual ZIP Creation
1. Create a new directory for your submission
2. Copy all required files (listed above) - all files should be in the root directory (flat structure, no subdirectories)
3. Create a ZIP file containing all these files
4. **Important**: arXiv does not support subdirectories with backslashes - all files must be in the root of the ZIP

### Option 2: Using the Provided Script (Recommended)
Simply run the provided batch script:

```bash
create_arxiv_package.bat
```

This script will:
- Create a clean `arxiv_submission/` directory
- Copy all necessary files with flattened structure (no subdirectories)
- Automatically modify main.tex and appendix.tex to use flattened paths
- Include the compiled bibliography file (main.bbl)
- Remove any auxiliary files (.aux, .log, .pdf, etc., but keep .bbl)
- Create `arxiv_submission.zip` ready for upload to arXiv

The script handles all the complexity of creating a flat file structure that arXiv requires.

**Important**: Make sure you have compiled your document locally at least once before running the script, so that the `main.bbl` file exists.

**Note**: A ready-to-use script is provided - see Option 2 below. The script automatically creates a flat structure compatible with arXiv.

## Uploading to arXiv

1. Go to https://arxiv.org/submit
2. Log in to your arXiv account
3. Follow the submission wizard
4. Upload your ZIP file
5. arXiv will process your files and compile the PDF
6. Review the generated PDF carefully
7. Complete the metadata (title, authors, abstract, categories)
8. Submit!

## Important Notes

- **Primary Category**: Choose the most appropriate category (e.g., cs.CV for Computer Vision)
- **License**: Select an appropriate license (e.g., CC BY 4.0)
- **Comments**: You can add a note like "Submitted to CVPR 2026" if applicable
- **arXiv Compilation**: arXiv uses TeXLive, which should be compatible with this document

## Troubleshooting

If arXiv fails to compile:
1. Check that all image files are included
2. Ensure all `\input{}` and `\include{}` files are present
3. Verify that no absolute paths are used
4. Make sure all custom packages are either standard or included in your submission

## Contact

If you encounter issues, consult the arXiv help pages:
- https://info.arxiv.org/help/submit_tex.html
- https://info.arxiv.org/help/faq/index.html

