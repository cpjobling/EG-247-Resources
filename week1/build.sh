#!/bin/bash

DOC=elementary_signals

echo Building $DOC.slides.html
jupyter nbconvert $DOC.ipynb --to slides --reveal-prefix "http://cdn.jsdelivr.net/reveal.js/2.6.2"
echo "Don't forget to export PDF for notebooks" *.ipynb
echo Done
