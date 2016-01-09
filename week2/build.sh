#!/bin/bash

DOC=laplace


echo Building $DOC.slides.html
jupyter nbconvert $DOC.ipynb --to slides --reveal-prefix ../introduction/reveal.js


DOC=inverse_laplace

echo Building $DOC.slides.html
jupyter nbconvert $DOC.ipynb --to slides --reveal-prefix ../introduction/reveal.js

echo "Don't forget to export PDF for notebooks" *.ipynb
echo done
