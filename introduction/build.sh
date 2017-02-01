#!/bin/bash

DOC=Introduction

echo Building $DOC.slides.html
cat README-slides
# jupyter nbconvert $DOC.ipynb --to slides 
echo "Don't forget to export PDF for Intro"
echo Done



