#!/bin/bash

DOC=sampling

echo Building $DOC.slides.html
jupyter nbconvert $DOC.ipynb --to slides --reveal-prefix "http://cdn.jsdelivr.net/reveal.js/2.6.2"


DOC=z-transform

echo Building $DOC.slides.html
jupyter nbconvert $DOC.ipynb --to slides --reveal-prefix "http://cdn.jsdelivr.net/reveal.js/2.6.2"

echo "Don't forget to export PDF for notebooks" *.ipynb

# Tables of transforms and properties
pandoc --mathjax -s zt_props.md -o zt_props.html
pandoc --mathjax -s zt_table.md -o zt_table.html
