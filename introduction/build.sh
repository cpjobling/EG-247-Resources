#!/bin/bash

DOC=Introduction

echo Building $DOC.slides.html
jupyter nbconvert $DOC.ipynb --to slides --reveal-prefix reveal.js
echo "Don't forget to export PDF for Intro and Homework"
echo Done



