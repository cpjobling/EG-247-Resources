# Week 4: Lab 3: Laplace Transforms for Circuit Analysis

These examples have been adapted from Chapter 4 of <a href="" target="_blank">[Stephen Karris, Signals and Systems : With MATLAB Computing and Simulink Modeling (5th Edition)](http://site.ebrary.com/lib/swansea/docDetail.action?docID=10547416).

## Lab Exercise 5

Download the linked script file for the Solution for Example 3 from Week 3 Contact Hour 5. This presents part of the solution to Textbook Example 4.3.

Linked script file [solution3.m](https://github.com/cpjobling/EG-247-Resources/blob/master/portfolio/lab3/solution3.m)

Starting from the simplified circuit (Fig. 4.9 from Karris, 2012: p4-5):

![Transformed circuit of Example 4.3](https://raw.githubusercontent.com/cpjobling/EG-247-Resources/master/portfolio/lab3/fig4_9.png)

1. Use the Symbolic Toolbox in Matlab to verify Equation 4.6.
2. Given equation 4.6, use roots to find the factors of the denominator and expand the terms with complex roots to find the quadratic factor.
3. Use the inverse Laplace Transform on the rational polynomial with real and quadratic factors to determine the symbolic expression |vout| as a function of time.
4. Use |ezplot| to plot this result.
5. Compare your answer with the numerical solution given by the script.

Save your solution as `ex5.m`.

## Lab Exercise 6: Problem Solving in Matlab

Choose one of the Problems Q1-Q3 from Section 4.7 of Karris 2012 (page 4-21) and use Matlab to adapt the methods used to solve the problem in Lab Exercise 5 to determine the required solution.

Save your chosen solution as `ex6.m`.

## Lab Exercise 7: Complex Impedance and Admittance

The linked file solves Example 4.5 from Karris 2012 (Example 5 in the notes). The solution concerns the calculation of the Complex Impedance and Admittance of the Circuit shown in Figure 4.16.

Linked file: [solution5.m](https://github.com/cpjobling/EG-247-Resources/blob/master/portfolio/lab3/solution5.m).

![Circuit for Example 4.5](https://raw.githubusercontent.com/cpjobling/EG-247-Resources/master/portfolio/lab3/4_16.png)

Download the file into Matlab and use it to verify the equation for the circuit impedance $Z(s)$ given in the notes and the text. Extend it to calculate the admittance $Y(s)$.

Use the same technique to solve Q4 from Section 4.7 (Exercises) of Karris (p. 4-21).

Save your solution to a single m-file called `ex7.m`.

## Lab Exercise 8: Transfer Functions

Download the linked Matlab script which computes the solution to Example 4.7 from Karris (2007) (Example 7 from the notes). This script computes the transfer function of the Op-Amp circuit shown below:

![The s-Domain circuit for Example 4.7](https://raw.githubusercontent.com/cpjobling/EG-247-Resources/master/portfolio/lab3/fig4_21.png)

Linked script file: [solution7.m](https://github.com/cpjobling/EG-247-Resources/blob/master/portfolio/lab3/solution7.m)

In the original example:

R1=20 kOhm
R2 = 40 kOhm
R3 = 50 kOhm
C1 = 25 nF
C2 = 10 nF

Use your student number to give a different set of component values whiles maintaining the relative sizes.

For example if your number was 876543 you might use:
R1=**8**0 kOhm
R2 = **7**0 kOhm
R3 = **6**0 kOhm
C1 = **54** nF
C2 = **3**0 nF

If your student number contains 0s, you should substitute a digit if your choice.

1. Calculate the numeric transfer function of the resulting circuit and compute its frequency response.
2. Build and simulate the circuit's response to a 100 Hz sinusoid using a Simulink transfer function block and the signal generator block.
3. Please ensure that you tell me what student number you have used.

You may find the symbolic toolbox function ``sym2poly`` useful.

Save your solution as `ex8.m`.

## What to hand in

You should add your modified version of the file `ex9.m` in folder `lab3` of your EG-247 labwork portfolio. Additional marks will be awarded according to how many of exercises 6-8 have been completed. Name each solution according to the exercise: e.g. Exercise 6 should be named `ex6.m` etc.</p>

See [**Assessment and Feedback: Labwork Assessment**](https://docs.google.com/spreadsheet/ccc?key=0AljOJ7w63DbTdERaUkhYako2V3VEemdabnd6angxSEE&amp;usp=sharing#gid=0) for a detailed marking scheme.

You will find it easiest to audit your completion of these exercises by publishing the script files using the *Publish* option in the m-file editor. I do not require you to add the published documents in your portfolio as I will regenerate these when I validate your claim.

## Homework: Defining Transfer Functions in Matlab (not assessed)

The linked m-File is a short tutorial introduction to the definition of transfer functions in Matlab. It introduces the Linear Time Invariant (LTI) block and shows how it can be used in analysis. Download, publish and read the file and use it as a reference for later labs.

Linked m-file: [tf_matlab.m](https://github.com/cpjobling/EG-247-Resources/blob/master/portfolio/lab3/tf_matlab.m).
