# Week 8: Lab 7: Fourier Series

## Acknowledgements

These examples have been adapted from Chapter 7 of 
<a href="http://site.ebrary.com/lib/swansea/docDetail.action?docID=10547416" target="_blank">Stephen Karris, Signals and Systems : With MATLAB Computing and Simulink Modeling (5th Edition)</a>.

The Simulink model used in Lab Exercise 18 was developed by Third Year EEE Student Fahad Alqahtani as part of his Level 3 Project in 2013-2014.

## Preparation

Before we start today's lab you will need to download and install the [Fourier series demo app](http://users.ece.gatech.edu/mcclella/matlabGUIs/#FourierSeries) that was demonstrated in class.

To install, visit the page and right-click the link where it says **Download** and save as to your week7/lab6 folder. Double click the downloaded zip files to unpack.

Open and run `fseriesdemo/fseriesdemo.m`.

If Matlab issues a message about the need to change the working directory or add a folder to the Matlab path. Accept the choice given.

## Lab Exercise 17: Computation of the coefficients of Trig. Fourier Series

In this lab exercise we will review the Fourier series for a square wave with odd and even symmetry before going on to compute and plot the Fourier series for the *triangular* waveform.

We will also explore and confirm the stated results of even-, odd- and half-wave symmetries.

### Before you Start

Download attached files:

* [TrigFourierSeries.m](https://github.com/cpjobling/EG-247-Resources/blob/master/portfolio/lab7/TrigFourierSeries.m)
* [trig_fseries.m](https://github.com/cpjobling/EG-247-Resources/blob/master/portfolio/lab7/trig_fseries.m)

and store them in your `lab7` folder.

### Part 1

Examine and run the script `trig_fseries.m` (which calls the `TrigFourierSeries` function defined in `TrigFourierSeries.m)` to calculate the trigonometric Fourier series for the square wave with odd-symmetry.

### Part 2

Copy the script `trig_fseries.m` and save it as `ex17_1.m`. Change the copy so that it computes and plots the trig. Fourier series for the square-wave waveform with even symmetry (Section 7.4.1 in the textbook).

### Part 3

Copy the script `trig_fseries.m` and save it as `ex17_2.m`. Change the copy so that it computes and plots the trig. Fourier series for the Triangular waveform (Section 7.4.3 in the textbook).

## Exercise 18: Simulating Wave Anaysis

Downoad and open the Simulink model [fourier_example.slx](https://github.com/cpjobling/EG-247-Resources/blob/master/portfolio/lab7/fourier_example.slx?raw=true). Examine the settings for the sine terms and compare the amplitudes and frequencies of the settings with the results of running `trig_fseries.m`. Run the simulation and view the reconstructed signal and the spectrum.

### Part 4

Change the settings so that the simulink model uses the coefficients from the square-wave even-symmetry result. Simulate and capture the time and spectrum plots. Save your model as `ex18_1.slx`.

### Part 5

Change the settings so so that the simulink model uses the coeffiecents from the triangular wave result. Simulate and capture the time and spectrum plots. Save your model as `ex18_2.slx`.

## Lab Exercise 17: Computation of the coefficients of Exponential Fourier Series

In this lab exercise we will review the Fourier series for a square wave with odd and even symmetry before going on to compute and plot the Fourier series for the `triangular` waveform.

We will also explore and confirm the stated results of even-, odd- and half-wave symmetries.

### Before you Start

Download the attached files:

* [FourierSeries.m](https://github.com/cpjobling/EG-247-Resources/blob/master/portfolio/lab7/FourierSeries.m)
* [exp_fseries.m](https://github.com/cpjobling/EG-247-Resources/blob/master/portfolio/lab7/exp_fseries.m)

### Part 6

Examine and run the script `exp_fseries.m` (which calls the `FourierSeries` function defined in `TrigFourierSeries.m`) to calculate the exponential Fourier series for the square wave with odd-symmetry.

### Part 7

Copy the script `exp_fseries.m` and save it as `ex19_1.m`. Change the copy so that it computes and plots the exponential Fourier series for the square-wave waveform with even symetry (Section 7.4.1 in the textbook). *Hint*: Use the same definition of f(t) that you used in Exercise 17.

Compare the computed spectrum with the simulated spectrum.

### Part 8

Copy the script `exp_fseries.m` and save it as `ex19_2.m`. Change the copy so that it computes and plots the exponential Fourier series for the full-wave rectified sinusoidal waveform (**Note**: f(t) = abs(sin(t)) (Section 7.4.5 in the textbook).

## Lab Exercise 20: Review and Change the Code.

### Part 9

Examine the code for the `FourierSeries` function that is defined in `FourierSeries.m`. Can you adapt it so that the user can define the range of the Fourier Series integral? If you succeed, use the modified function to compute the Fourier series of the triangular wave form by exploiting half-wave symmetry. Save the script that does this as `ex20_1.m`.

### Part 10

Examine the code that is defined in `TrigFourierSeries`. Note that it calls `FourierSeries` then computes `ak` and `bk` from the `Ck` coefficents. Why did I do that do you think? 

If you made the suggested change to `FourierSeries`, provide compatible changes to your copy of `TrigFourierSeries`. Test it on the half-wave rectified sinewave. Save the resulting calling script as `ex20_2.m`.

## What to Hand In

You should add your modified version of the provided files `trig_fseries.m` named as `ex17_1.m`, `ex17_2.m`, and `exp_fseries.m` named as `ex19_1.m` and `ex19_2.m` in folder `lab7` of your EG-247 portfolio. Additional marks will be awarded according to how many of Exercises 18 and 20 have been completed. Name each solution according to the exercise and part number: e.g. Exercise 18 models should be named `ex18_1.slx`, `ex18_2.slx` etc. Use the same naming scheme for any other Matlab m-files or Simulink models submitted for assessment.

See [Assessment and Feedback: Labwork Assessment](https://docs.google.com/spreadsheet/ccc?key=0AljOJ7w63DbTdERaUkhYako2V3VEemdabnd6angxSEE&amp;usp=sharing#gid=0) for a detailed marking scheme.

You will find it easiest to audit your completion of these exercises by publishing the script files using the Publish option in the m-file editor. I do not require you to add the published documents in your portfolio as I will regenerate these when I validate your claim.
