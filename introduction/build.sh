#!/bin/bash

DOC=Introduction

echo Building $DOC.slides.html
jupyter nbconvert $DOC.ipynb --to slides
echo Building $DOC.pdf
jupyter nbconvert $DOC.ipynb --to pdf
# echo Building $DOC.html
# pandoc --mathjax -s $DOC.md -o $DOC.html
echo Done



