# Domain Feature Collapse Research Project

This repository is for converting the **AAAI submission** into a **CVPR 2026 submission**.

## Project Overview

This repository contains the research work on **Domain Feature Collapse** - a novel approach to understanding and addressing feature learning limitations in neural networks across different domains. Domain Feature Collapse investigates how neural networks learn domain-specific features that may not generalize well across different contexts, leading to reduced model robustness and transferability.

## Repository Structure

### AAAI_2026_Domain_Feature_Collapse(1)/
Contains the AAAI 2026 submission materials:
- **AnonymousSubmission/LaTeX/**: LaTeX source files for the anonymous submission
  - `anonymous-submission-latex-2026.tex`: Main paper file
  - `aaai2026.sty`, `aaai2026.bst`, `aaai2026.bib`: AAAI style files and bibliography
  - `math_commands.tex`: Mathematical notation definitions
  - Various sample images: `butterfly_1_sample.jpg`, `cards_1_sample.jpg`, etc.
  - `figure1.pdf`, `figure2.pdf`: Main figures for the paper
- **AnonymousSubmission/Word/**: Word version of the submission
- **Copyright/**: Copyright and release forms

### author-kit-CVPR2026-v1-latex-/
Contains CVPR 2026 submission materials:
- LaTeX template and style files for CVPR submission
- `main.tex`: Main paper file
- `main.bib`: Bibliography
- `sec/`: Section files for the paper
- `rebuttal.tex`: Rebuttal document

## Research Status

**Publication Status**: Converting AAAI submission to CVPR 2026 submission

## Key Contributions

1. **Theoretical Framework**: Novel understanding of domain feature collapse phenomenon
2. **Empirical Analysis**: Comprehensive evaluation across multiple domains and datasets
3. **Practical Solutions**: Methods to mitigate domain feature collapse in neural networks

## Getting Started

### Prerequisites
- LaTeX distribution (TeX Live, MiKTeX, etc.)
- Python 3.x (for any experimental code)

### Building the Papers

#### AAAI 2026 Submission
```bash
cd "AAAI_2026_Domain_Feature_Collapse(1)/AnonymousSubmission/LaTeX"
pdflatex anonymous-submission-latex-2026.tex
bibtex anonymous-submission-latex-2026
pdflatex anonymous-submission-latex-2026.tex
pdflatex anonymous-submission-latex-2026.tex
```

#### CVPR 2026 Submission
```bash
cd "author-kit-CVPR2026-v1-latex-"
pdflatex main.tex
bibtex main
pdflatex main.tex
pdflatex main.tex
```

## Contact

This research is part of a PhD dissertation on representation learning and neural network robustness.

## License

This research work is proprietary and confidential. Please do not distribute without permission.
