#! /bin/bash

# Default fonts
pdflatex Defaultfonts_sample
biber    Defaultfonts_sample
pdflatex Defaultfonts_sample
pdflatex Defaultfonts_sample

# Fira_Newtxsf
pdflatex Fira_Newtxsf_sample
biber    Fira_Newtxsf_sample
pdflatex Fira_Newtxsf_sample
pdflatex Fira_Newtxsf_sample

# Libertinus
pdflatex Libertinus_sample
biber    Libertinus_sample
pdflatex Libertinus_sample
pdflatex Libertinus_sample

# Lmodern
pdflatex Lmodern_sample
biber    Lmodern_sample
pdflatex Lmodern_sample
pdflatex Lmodern_sample

# Lucida
pdflatex Lucida_sample
biber    Lucida_sample
pdflatex Lucida_sample
pdflatex Lucida_sample

# Newtx-sans-text
pdflatex Newtx-sans-text_sample
biber    Newtx-sans-text_sample
pdflatex Newtx-sans-text_sample
pdflatex Newtx-sans-text_sample

# Newtx
pdflatex Newtx_sample
biber    Newtx_sample
pdflatex Newtx_sample
pdflatex Newtx_sample

# Heros-Stix2
lualatex Heros-Stix2_sample
biber    Heros-Stix2_sample
lualatex Heros-Stix2_sample
lualatex Heros-Stix2_sample

# Stix2
lualatex Stix2_sample
biber    Stix2_sample
lualatex Stix2_sample
lualatex Stix2_sample

# Termes-stix2
lualatex Termes-stix2_sample
biber    Termes-stix2_sample
lualatex Termes-stix2_sample
lualatex Termes-stix2_sample


# Termes
lualatex Termes_sample
biber    Termes_sample
lualatex Termes_sample
lualatex Termes_sample


# clean up

mkdir pdffiles
mv *.pdf pdffiles
rm *.aux
rm *.bbl
rm *.bcf
rm *.blg
rm *.log
rm *.lot
rm *.lof
rm *.toc
rm *.xml
