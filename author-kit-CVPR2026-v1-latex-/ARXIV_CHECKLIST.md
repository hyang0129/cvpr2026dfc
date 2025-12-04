# arXiv Submission Checklist

Use this checklist to ensure your submission is ready for arXiv.

## Pre-Submission Checklist

### 1. Document Preparation
- [x] Changed document class to `\usepackage[pagenumbers]{cvpr}` for arXiv
- [ ] Updated author information in `main.tex` (lines 31-46)
- [ ] Removed or commented out anonymous submission text
- [ ] Verified title is correct
- [x] Commented out CVPR paper ID fields

### 2. Content Review
- [ ] Proofread the entire document
- [ ] Checked all figures are included and display correctly
- [ ] Verified all citations are present in the bibliography
- [ ] Ensured all equations are properly formatted
- [ ] Checked that all tables are readable
- [ ] Reviewed appendix content

### 3. Bibliography
- [x] All BibTeX entries are complete
- [ ] No missing references
- [ ] Author names are correctly formatted
- [ ] Publication venues are accurate
- [ ] Years are correct

### 4. Technical Checks
- [x] Document compiles without errors
- [ ] No undefined references
- [ ] No missing citations
- [ ] All images load correctly
- [ ] No overfull/underfull hbox warnings (or acceptable)
- [x] **Compiled document locally to generate main.bbl** (pdflatex + bibtex + pdflatex)

### 5. File Preparation
- [x] Created submission package using `create_arxiv_package.bat`
- [x] Verified all required files are in `arxiv_submission/` directory
- [x] **Verified main.bbl is included in the package**
- [x] Tested compilation in the submission directory
- [ ] Checked that no auxiliary files (.aux, .log, etc.) are included (but .bbl should be there!)
- [x] Created `arxiv_submission.zip`

### 6. Final Review
- [ ] Reviewed the compiled PDF from the submission directory
- [ ] Checked page numbers are present
- [ ] Verified formatting is correct
- [ ] Ensured no CVPR-specific review comments remain
- [ ] Confirmed all author information is accurate

## Files Included in Submission

### Main Files (7 files)
- [x] main.tex (modified with flattened paths)
- [x] main.bib
- [x] main.bbl (compiled bibliography - required!)
- [x] preamble.tex
- [x] math_commands.tex
- [x] cvpr.sty
- [x] ieeenat_fullname.bst

### Section Files (11 files - flattened, no subdirectory)
- [x] sec_0_abstract.tex
- [x] sec_1_intro.tex
- [x] sec_2_preliminaries.tex
- [x] sec_3_methodology.tex
- [x] sec_4_experiments.tex
- [x] sec_5_related_work.tex
- [x] sec_5a_discussion.tex
- [x] sec_6_conclusion.tex
- [x] sec_appendix.tex
- [x] sec_appendix_tables.tex
- [x] sec_appendix_variance.tex

### Image Files (14 files)
- [x] domain_feature_collapse.jpg
- [x] butterfly_1_sample.jpg
- [x] cards_1_sample.jpg
- [x] colon_1_sample.jpg
- [x] eurosat_1_sample.jpg
- [x] fashion_1_sample.jpg
- [x] food_1_sample.jpg
- [x] garbage_1_sample.jpg
- [x] plant_1_sample.jpg
- [x] rock_1_sample.jpg
- [x] tissue_1_sample.jpg
- [x] yoga_1_sample.jpg
- [x] figure1.pdf
- [x] figure2.pdf

## arXiv Submission Steps

1. [ ] Go to https://arxiv.org/submit
2. [ ] Log in to your arXiv account (create one if needed)
3. [ ] Click "START NEW SUBMISSION"
4. [ ] Upload `arxiv_submission.zip`
5. [ ] Wait for arXiv to process and compile
6. [ ] Review the generated PDF
7. [ ] Fill in metadata:
   - [ ] Title
   - [ ] Authors (with affiliations)
   - [ ] Abstract
   - [ ] Comments (e.g., "Submitted to CVPR 2026")
   - [ ] Primary category (e.g., cs.CV - Computer Vision and Pattern Recognition)
   - [ ] Secondary categories (if applicable)
8. [ ] Select license (recommended: CC BY 4.0)
9. [ ] Review all information
10. [ ] Submit!

## Post-Submission

- [ ] Note your arXiv ID (e.g., arXiv:YYMM.NNNNN)
- [ ] Share the arXiv link with collaborators
- [ ] Update your CV/website with the arXiv link
- [ ] Consider announcing on social media/mailing lists

## Common Issues and Solutions

### Issue: arXiv compilation fails
- **Solution**: Check that all files are included, especially images and .tex files
- **Solution**: Verify no absolute paths are used in the LaTeX code
- **Solution**: Ensure all custom packages are standard or included

### Issue: Missing references
- **Solution**: Make sure main.bib is included and all cited works are in the file
- **Solution**: Check that bibliography style file (ieeenat_fullname.bst) is included

### Issue: Images not displaying
- **Solution**: Verify all image files are in the ZIP
- **Solution**: Check that image file names match exactly (case-sensitive)
- **Solution**: Ensure images are in supported formats (PDF, JPG, PNG)

### Issue: Formatting looks different
- **Solution**: This is normal - arXiv uses TeXLive which may render slightly differently
- **Solution**: As long as content is correct, minor formatting differences are acceptable

## Need Help?

- See `ARXIV_SUBMISSION_README.md` for detailed instructions
- Visit https://info.arxiv.org/help/submit_tex.html
- Contact arXiv support if you encounter technical issues

