#! /bin/bash

# Libertinus
lualatex Libertinus_sample_ua2
biber    Libertinus_sample_ua2
lualatex Libertinus_sample_ua2
lualatex Libertinus_sample_ua2

# Lmodern
lualatex Lmodern_sample_ua2
biber    Lmodern_sample_ua2
lualatex Lmodern_sample_ua2
lualatex Lmodern_sample_ua2

# Lucida
lualatex Lucida_sample_ua2
biber    Lucida_sample_ua2
lualatex Lucida_sample_ua2
lualatex Lucida_sample_ua2

# Heros-Stix2
lualatex Heros-Stix2_sample_ua2
biber    Heros-Stix2_sample_ua2
lualatex Heros-Stix2_sample_ua2
lualatex Heros-Stix2_sample_ua2

# Stix2
lualatex Stix2_sample_ua2
biber    Stix2_sample_ua2
lualatex Stix2_sample_ua2
lualatex Stix2_sample_ua2

# Termes-stix2
lualatex Termes-stix2_sample_ua2
biber    Termes-stix2_sample_ua2
lualatex Termes-stix2_sample_ua2
lualatex Termes-stix2_sample_ua2

# Termes
lualatex Termes_sample_ua2
biber    Termes_sample_ua2
lualatex Termes_sample_ua2
lualatex Termes_sample_ua2


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
