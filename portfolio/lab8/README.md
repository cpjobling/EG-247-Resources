# Lab 8: Filters

## Acknowledgements

This lab is based on [Filter Design Using Matlab Demo by David Dorran](http://dadorran.wordpress.com/2013/10/18/filter-design-using-matlab-demo/).

There is a [YouTube video](http://www.youtube.com/watch?v=vfH5r4cKukg&amp;list=PLJ8LTUMGG9U4vAGind2_Bh4TUfgg1y0F4&amp;feature=share&amp;index=2) that illustrates what we are going to be using.

## Preparation

Download the example filter design script <a href="https://github.com/cpjobling/EG-247-Resources/blob/master/portfolio/lab8/filters.m" title="filters.m" target="_blank">filters.m</a> from this repository. Save it to your folder for `week9/lab8`.

Run the script step-by step and read and understand the commentary.

## Lab Exercise 21: Interactive Filter Design

Matlab provides a filter design tool with a graphical user interface called *fdatool*.

We want you to use this tool to design and test a low-pass butterworth filter with sampling frequency equal to your student number whose cut-off frequency (in Hz) is equal to the nearest whole number to your student number divided by 10 and whose stop band is the nearest whole number to your student number divided by 5. The filter should have 3dB in the pass band and 60 dB in the stop band.

You should save the result as `lab9.mat` and submit this for assessment along with a script `lab9.m` that demonstrates that the filter has the correct pass band, stop band and cut-off frequency behaviour.

The attached file can be used as a model for the filter-test file: <a href="https://github.com/cpjobling/EG-247-Resources/blob/master/portfolio/lab8/testfda.m" title="testfda.m" target="_blank">testfda.m</a>.
