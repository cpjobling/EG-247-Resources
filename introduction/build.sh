#!/bin/bash

DOC=Introduction

echo Building $DOC.slides.html
jupyter nbconvert $DOC.ipynb --to slides
echo "Don't forget to export PDF"
echo Done



