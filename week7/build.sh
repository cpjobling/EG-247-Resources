#!/bin/bash

DOC=ft1

echo Building $DOC.slides.pdf
pandoc --latex-engine=xelatex -t beamer $DOC.md --slide-level=2 -V fonttheme:professionalfonts -o $DOC.slides.pdf
echo Building $DOC.pdf
pandoc --latex-engine=xelatex $DOC.md -o $DOC.pdf
echo Building $DOC.html
pandoc --mathjax -s $DOC.md -o $DOC.html
echo Done

DOC=ft2

echo Building $DOC.slides.pdf
pandoc --latex-engine=xelatex -t beamer $DOC.md --slide-level=2 -V fonttheme:professionalfonts -o $DOC.slides.pdf
echo Building $DOC.pdf
pandoc --latex-engine=xelatex $DOC.md -o $DOC.pdf
echo Building $DOC.html
pandoc --mathjax -s $DOC.md -o $DOC.html

# Tables of transforms and properties
pandoc --mathjax -s ft_props.md -o ft_props.html
pandoc --mathjax -s ft_table.md -o ft_table.html
