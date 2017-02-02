# Lab 4: Laplace Transforms and Transfer Functions for Circuit Analysis

These examples have been adapted from Chapter 4 of 
[Stephen Karris, Signals and Systems : With MATLAB Computing and Simulink Modeling (5th Edition)](http://site.ebrary.com/lib/swansea/docDetail.action?docID=10547416).

## Tutorial: Defining Transfer Functions in Matlab (not assessed)

The linked m-File is a short tutorial introduction to the definition of transfer functions in Matlab. It introduces the Linear Time Invariant (LTI) block and shows how it can be used in analysis. Download, publish and read the file and use it as a reference for later labs.

Linked m-file: [tf_matlab.m](https://github.com/cpjobling/EG-247-Resources/blob/master/portfolio/lab04/tf_matlab.m).
## Lab Exercise 7

Download the linked script file for the Solution for Example 3 from Week 3. 
This presents part of the solution to Textbook Example 4.3.

Linked script file [solution3.m](https://github.com/cpjobling/EG-247-Resources/blob/master/portfolio/lab04/solution3.m)

Starting from the simplified circuit (Fig. 4.9 from Karris, 2012: p4-5):

![Transformed circuit of Example 4.3](https://raw.githubusercontent.com/cpjobling/EG-247-Resources/master/portfolio/lab04/fig4_9.png)

1. Use the Symbolic Toolbox in Matlab to verify $$V_{\mathrm out}(s) = \frac{2s(s+3)}{s^3+8s^2+10s+4}$$.
2. Use `roots` to find the factors of the denominator $$s^3+8s^2+10s+4$$ and expand the terms with complex roots to find the quadratic factor.
3. Use the inverse Laplace Transform on the rational polynomial with real and quadratic factors to determine the symbolic expression |vout| as a function of time.
4. Verify that the response is $$v_{\mathrm out}(t) = \left(1.36e^{-6.57t)+0,64e^{-0.715t}\cos 0.316t -1.84e^{-0.715t}\sin 0.316t\right)u_0(t)$$
4. Use |ezplot| to plot this result.
5. Compare your answer with the numerical solution given by the script.

Save your solution as `ex7.m`.

## Lab Exercise 8: Problem Solving in Matlab

Choose one of the Problems Q1-Q3 from Section 4.7 of Karris 2012 (page 4-21) and use Matlab to adapt the methods used to solve the problem in Lab Exercise 8 to determine the required solution.

Save your chosen solution as `ex8.m`.

## Lab Exercise 9: Complex Impedance and Admittance

The linked file solves Example 4.5 from Karris 2012 (Example 5 in the notes). The solution concerns the calculation of the Complex Impedance and Admittance of the Circuit shown in Figure 4.16.

Linked file: [solution5.m](https://github.com/cpjobling/EG-247-Resources/blob/master/portfolio/lab04/solution5.m).

![Circuit for Example 4.5](https://raw.githubusercontent.com/cpjobling/EG-247-Resources/master/portfolio/lab04/4_16.png)

Download the file into Matlab and use it to verify the equation for the circuit impedance $Z(s)$ given in the notes and the text. Extend it to calculate the admittance $Y(s)$.

Use the same technique to solve Q4 from Section 4.7 (Exercises) of Karris (p. 4-21).

Save your solution to a single m-file called `ex9.m`.

## Mini Project 3: Transfer Functions

Download the linked Matlab script which computes the solution to Example 4.7 
from Karris (2007) (Example 7 from the notes). This script computes the 
transfer function of the Op-Amp circuit shown below:

![The s-Domain circuit for Example 4.7](https://raw.githubusercontent.com/cpjobling/EG-247-Resources/master/portfolio/lab04/fig4_21.png)

Linked script file: [solution7.m](https://github.com/cpjobling/EG-247-Resources/blob/master/portfolio/lab04/solution7.m)

In the original example:

R1 = 20 kOhm
R2 = 40 kOhm
R3 = 50 kOhm
C1 = 25 nF
C2 = 10 nF

Use your student number to give a different set of component values whiles maintaining the relative sizes.

For example if your number was 876543 you might use:
R1 = **8**0 kOhm
R2 = **7**0 kOhm
R3 = **6**0 kOhm
C1 = **54** nF
C2 = **3**0 nF

If your student number contains 0s, you should substitute a digit if your choice.
You may find `doc` or `help` and the symbolic toolbox function ``sym2poly`` useful.

To Do: save a copy of `solution7.m` file as `proj3.m`. Adapt the script to repeat the computation
using component values based on your student number. Then:

1. compute and plot the phase response of Gs - see function `angle`
2. make a transfer function LTI object `Gs2 = tf(numG,denG)`
3. Compare frequency response with result of `bode(Gs2)`
4. Plot the pole-zero map of Gs2 using the `pzmap` function.
5. Plot the step response of GS2 using the `step` function.
6. Compute and plot the response of GS2 to the sinusoid using the `lsim` function.
7. Repeat the simulation of the sinsoudal response in Simulink - save model as `proj3.slx`.

Save your solution as `proj3.m`.

## What to hand in

You should add your modified version of the file `proj3.m` in folder `lab04` of your EG-247 labwork portfolio along with the Simulink model. 
Additional marks will be awarded according to how many of exercises 7-9 have been completed. Name each solution according to the exercise: e.g. Exercise 7 should be named `ex7.m` etc.</p>

See [**Assessment and Feedback: Labwork Assessment**](https://docs.google.com/spreadsheets/d/17VCWrwHpfx0W_7FX3MYB2HhddwgdbblUVdUNoLSwECQ/edit?usp=sharing) for a detailed marking scheme.

You will find it easiest to audit your completion of these exercises by publishing the script files using the *Publish* option in the m-file editor. I do not require you to add the published documents in your portfolio as I will regenerate these when I validate your claim.

