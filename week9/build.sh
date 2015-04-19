#!/bin/bash

DOC=sampling

echo Building $DOC.slides.pdf
pandoc --latex-engine=xelatex -t beamer $DOC.md --slide-level=2 -V fonttheme:professionalfonts -o $DOC.slides.pdf
echo Building $DOC.pdf
pandoc --latex-engine=xelatex $DOC.md -o $DOC.pdf
echo Building $DOC.html
pandoc --mathjax -s $DOC.md -o $DOC.html
echo Done

DOC=z-transform

echo Building $DOC.slides.pdf
pandoc --latex-engine=xelatex -t beamer $DOC.md --slide-level=2 -V fonttheme:professionalfonts -o $DOC.slides.pdf
echo Building $DOC.pdf
pandoc --latex-engine=xelatex $DOC.md -o $DOC.pdf
echo Building $DOC.html
pandoc --mathjax -s $DOC.md -o $DOC.html

# Tables of transforms and properties
pandoc --mathjax -s zt_props.md -o zt_props.html
pandoc --mathjax -s zt_table.md -o zt_table.html
