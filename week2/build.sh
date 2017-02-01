#!/bin/bash

DOC=laplace


echo Building $DOC.slides.html
# jupyter nbconvert $DOC.ipynb --to slides 


DOC=inverse_laplace

echo Building $DOC.slides.html
cat README-slides
# jupyter nbconvert $DOC.ipynb --to slides

echo "Don't forget to export PDF for notebooks" *.ipynb
echo done
