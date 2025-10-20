
NOTE ON FONT SAMPLE SOURCES FOR PDF/UA2

These font sample files call the following additional files as inputs:

abstract.tex
acknowledgments.tex
appendixb.tex
biography.tex
chapter1.tex
committee_members.tex
mitthesis-sample.bib

All of those files are in the directory mitthesis/MIT-thesis-template.

You should also copy the fontsets directory (and mitthesis.cls) into this folder.

Run as   % ./compile-font-samples-ua2.sh



These files validate completely with https://demo.verapdf.org/ (v1.28.1) including PDF/UA2 + tagged PDF profile, WTPDF 1.0 accessibility and reuse profiles, and the Arlington model java code (v 1.27.96).  

These files also render in HMTL generally as expected (albeit with no specific CSS) using  https://ngpdf.com/.  (The HTML rendering is missing some spaces in the TOC, LOF and LOT; gives no space between "Chapter 1" and "Introduction"; and loses some math formatting in the longtable heading. Some of this may be attributable to CSS, but I have not investigated.) 


RELATIVE TO the sample thesis in the main directory, only the following was changed to obtain UA2 compliance:

1. Appendix A was omitted. That appendix calls the listings package, which is not compatible with tagging.

2. The mhchem example in chapter1.tex was commented out.  That code compiles and validates with UA2 tagging, but the luamml is malformed and does not render in HMTL.

Note that the figures used are compatible with PDF/UA2.  The caption/subcaption packages are loaded, but not used. (The two design examples included use these packages to change the caption/subcaption label fonts, and they _also_ validate.) The class patches \caption@anchor when tagging is active to accommodate lot/lof.  The class also patches one bug in luamml. 

The class option lineno is not compatible with tagging.

For details of the tagging issues mentioned, see:

mhchem:   https://github.com/latex3/tagging-project/issues/793#issue-2824076016
luamml:   https://github.com/latex3/tagging-project/issues/757#issue-2644161105
lineno:   https://github.com/latex3/tagging-project/issues/210#issue-2418340429
caption:  https://github.com/latex3/tagging-project/issues/84#issue-2358401232
listings: https://github.com/latex3/tagging-project/issues/41#issue-2036294710
