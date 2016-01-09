#!/bin/bash

DOC=elementary_signals

echo Building $DOC.slides.html
jupyter nbconvert $DOC.ipynb --to slides --reveal-prefix ../introduction/reveal.js
echo "Don't forget to export PDF for notebooks" *.ipynb
echo Done
echo Done
