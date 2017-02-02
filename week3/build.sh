#!/bin/bash

DOC=transfer_functions

echo Building $DOC.slides.html
jupyter nbconvert $DOC.ipynb --to slides --reveal-prefix "http://cdn.jsdelivr.net/reveal.js/2.6.2"


DOC=circuit_analysis

echo Building $DOC.slides.html
cat README-slides
# jupyter nbconvert $DOC.ipynb --to slides

echo "Don't forget to export PDF for notebooks" *.ipynb
echo done
