#! /bin/bash

# first run

for i in *.tex; 
	do 
		if [ "$i" != "abstract.tex" ] ; then 
			lualatex $i; 
		fi; 
	done

# second run

for i in *.tex; 
	do 
		if [ "$i" != "abstract.tex" ] ; then 
			lualatex $i; 
		fi; 
	done

# clean up

mkdir pdffiles
mv *.pdf pdffiles
rm *.aux
# rm *.gz
rm *.html
rm *.log




