# Week 6: Lab 5: Convolution

## Acknowledgements

These examples have been adapted from Chapter 6 of <a href="http://site.ebrary.com/lib/swansea/docDetail.action?docID=10547416" target="_blank">Stephen Karris, Signals and Systems : With MATLAB Computing and Simulink Modeling (5th Edition)</a>.

## Matlab/Simulink Concepts Introduced

In this lab you will:

* Explore convolution and Fourier series with the aid of interactive Matlab "apps"
* Use the `int` and `heaviside` functions from the <strong>Symbolic Toolbox</strong> to perform symbolic computation of convolution integrals and the coefficients of trigonometric Fourier series.
* Use `laplace` and `ilaplace` to solve convolution problems.
* Use `ezplot` to plot symbolic functions.
*
## Preparation

Before we start today's lab you will need to download and install the <a href="http://www.mathworks.co.uk/matlabcentral/fileexchange/25199-graphical-demonstration-of-convolution" target="_blank">Graphical demonstration of convolution app</a>.

To install, right-click button of link as appropriate and save as to your week7/lab6 folder. Double click the downloaded zip files to unpack.

Open and run `convolutiondemo.m`.

If Matlab issues a message about the need to change the working directory or add a folder to the Matlab path. Accept the choice given.

## Lab Exercise 13: Graphical Demonstration of Convolution

In this lab exercise we will use the `convolutiondemo` app demonstrated in class as an aid to understanding and setting up the convolution integral for various systems including the step-response of an RL circuit.

### Part 1

Set up the `convolutiondemo` app as described in the notes for the computation of the Convolution Integral for Example 6.4 from the textbook illustrated below. (Refer to Example 1 in [Week 5: Contact Hour 9](http://cpjobling.github.io/EG-247-Resources/week5/convolution.html) for the Matlab settings).

![Example 6.4](https://raw.githubusercontent.com/cpjobling/EG-247-Resources/master/portfolio/lab5/2014-03-03_1228.png)

Use the tool to confirm the convolution result given by this Matlab script: <a href="https://raw.githubusercontent.com/cpjobling/EG-247-Resources/master/portfolio/lab5/exercise13.m" target="_blank">exercise13.m</a></p>

### Part 2

Taking the script <a href="https://raw.githubusercontent.com/cpjobling/EG-247-Resources/master/portfolio/lab6/exercise13.m" target="_blank">exercise13.m</a> as a model. Use the `convolutiondemo` tool as an aid to defining the integration limits needed to find and plot the convolution integral for the example shown below (Example 6.5 from the textbook).

![Example 6.5](https://raw.githubusercontent.com/cpjobling/EG-247-Resources/master/portfolio/lab5/2014-03-03_1240.png)

### Part 3

Repeat the procedure for example 6.6 from the textbook.

![Example 6.6](https://raw.githubusercontent.com/cpjobling/EG-247-Resources/master/portfolio/lab5/2014-03-03_1246.png)


### Part 4

Adapt your procedure to determine the step response of the RC circuit given as Example 6.7 in the textbook.

![Example 6.7](https://raw.githubusercontent.com/cpjobling/EG-247-Resources/master/portfolio/lab5/2014-03-03_1248.png)

## Lab Exercise 14: Using Laplace to Solve Convolution Problems

In this lab exercise will demonstrate that time-convolution of a system response can be solved in the complex frequency domain using Laplace and Inverse Laplace transforms.

* Use the inverse Laplace transform function `ilaplace` to solve the step response of the RC circuit given in exercise 13 without convolution. You will need the Laplace transform of the circuit's impulse response *h*(*t*) and the unit step *u*<sub>0</sub>(*t*) (Matlab `heaviside`).
* Plot the result using `ezplot`
* Confirm the result with a simulink simulation

## What to hand in

You should add your modified version of the file `example13.m` in folder `lab6` of your EG-247 portfolio as `ex13_1.m<`. Additional marks will be awarded according to how many of Exercises 13 (Parts 2-4) and 14 have been completed. Name each solution according to the exercise and part number: e.g. Exercise 13 scripts should be named `ex13_2.m<`, `ex13_3.m<` etc. Use the same naming scheme for any Simulink models submitted for assessment.

See <a href="https://docs.google.com/spreadsheet/ccc?key=0AljOJ7w63DbTdERaUkhYako2V3VEemdabnd6angxSEE&amp;usp=sharing#gid=0" target="_blank"><strong>Assessment and Feedback: Labwork Assessment</strong></a> for a detailed marking scheme.

You will find it easiest to audit your completion of these exercises by publishing the script files using the <strong>Publish</strong> option in the m-file editor. I do not require you to add the published documents in your portfolio as I will regenerate these when I validate your claim.
