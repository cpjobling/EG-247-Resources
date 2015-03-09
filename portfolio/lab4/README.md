# Week 5: Lab 4: State space modelling and the impulse response

## Matlab/Simulink Concepts Introduced

n this lab you will:

* Define matrices, column and row vectors in **Matlab**
* Use the `int`, `diff`, `heaviside`, `dirac`, `laplace`, `ilaplace`, and `expm` functions from the **Symbolic Toolbox**
* Use matrix multiplication and the matrix functions `eye`, and `inv` in **Matlab**
* Model and simulate a transfer function and state-space model in **Simulink**
* Define models using the **Linear Time Invariant (LTI) blocks** `ss` and `tf` from the **Control Systems Toolbox** and use these to calculate and plot *step* and *impulse* responses.

## Context for this lab session

These examples have been adapted from Chapters 5 and 6 of <a href="http://site.ebrary.com/lib/swansea/docDetail.action?docID=10547416" target="_blank">Stephen Karris, Signals and Systems : With MATLAB Computing and Simulink Modeling (5th Edition)</a>.

The script presented in Lab Exercise 11 is described in the notes accompanying the Week 4 Session (Lesson 7) on *Modelling Systems in the State Space* (<a href="http://cpjobling.github.io/EG-247-Resources/week4/state_space.html" title="Modelling Systems in State Space (Notes)" target="_blank">linked here for your convenience</a>). Those notes also describe the relationship between the state space model and the transfer function as well as the Laplace transform of the transition matrix which are explored in Exercises 12 and 13.

The impulse response of a system represented by a state-space model was explored in the Week 4 Session on <strong>Convolution</strong> (Lesson 8 - <a href="http://cpjobling.github.io/EG-247-Resources/week4/convolution.html" title="Convolution - Part 1 (Notes)" target="_blank">Notes</a>).</p>

## Lab Exercise 11: State-Space Modelling of an RLC Circuit

Download the linked script file for the Solution for Example 7 from Week 4 Contact Hour 7. This presents part of the solution to Textbook Example 5.10.

Linked script: [rlc.m](https://github.com/cpjobling/EG-247-Resources/blob/master/portfolio/lab4/rlc.m)

Starting from the circuit (Fig. 5.7 from Karris, 2012: p5-22):

![Fig 5.7](https://raw.githubusercontent.com/cpjobling/EG-247-Resources/master/portfolio/lab4/fig5_7.png)

1. Run the script to verify the solution matches equation 5.96.
2. Add comments to the script so that you can demonstrate that you understand what each step does.
3. Determine and plot the step reponse of the current through the inductor. Use this result to determine and plot the voltage across the inductor.
4. Use the state-space block in Simulink to implement and simulate the step response of the circuit (assuming that the output is the voltage across the capacitor).
5. Compare your simulation results with the responses produced by the script.

Save and add your copy of the modified `rlc.m` file plus the Simulink model (suggested name `rlc_sim.slx`) to your lab4 portfolio.

## Lab Exercise 12: The Laplace Transform of the Transition Matrix

![Figure 5.10](https://raw.githubusercontent.com/cpjobling/EG-247-Resources/master/portfolio/lab4/fig5_10.png)

Adapt the script used in Lab Exercise 11 to determine the state-space model of the circuit shown in Figure 5.10. Use Matlab to show that the Laplace transform of the transition matrix <em>e</em><strong><sup>A</sup></strong><sup><strong></strong><em>t</em></sup> is defined by the inverse laplace transform of (s<strong>I</strong>-<strong>A</strong>)<sup>-1</sup>.</p>

Save and add the resulting script as `ex12.m` to your lab4 portfolio.

## Lab Exercise 13: State-space and Transfer Functions

In the circuit of Figure 5.11, all initial conditions are zero.

![Fig 5.11](https://raw.githubusercontent.com/cpjobling/EG-247-Resources/master/portfolio/lab4/fig5_11.png)

* Adapt the scripts from Lab Exercises 11 and 12 to determine the State Matrices <strong>A</strong>, <strong>B</strong>, <strong>C</strong> and <strong>D</strong> for Fig. 5.11.
* Derive the transfer function using Y(s) = (<strong>C</strong>(s<strong>I</strong> - <strong>A</strong>)<sup>-1</sup><strong>B</strong> + <strong>D</strong>)U(s)
* Use inverse Laplace transforms to determine the step response.
* Compare with the result obtained by the state-space time-response method.
* Put the state-space model and the transfer function model together in a model in Simulink, as shown in Figure 5.13 in the textbook. Verify that the two representations are equivalent.

In Matlab we can define a state-space model using the LTI function `ss` as in:
````matlab
sys_ss = ss(A,B,C,D)
````
we can then convert it to a transfer function using

````matlab
sys_tf = tf(sys_ss)
````
Once we have the model in either of these forms, we can compute the step response using:

````matlab
step(sys)
````

* Complete Exercise 13 by creating a state-space LTI model from the calculated <strong>A</strong>, <strong>B</strong>, <strong>C</strong>, and <strong>D</strong> matrices
* Convert it into an LTI transfer function
* Plot the step response for both forms
* Compare the results with those of Simulink.

Store the resulting script as a file `ex13.m` in your week4 portfolio.

## Lab Exercise 14: The Impulse Response

Adapt the script used in Lab Exercise 11 to compute and plot the impulse response of the circuit shown below (Figure 6.3 from Example 6.2 in the text book).

![Figure 6.2](https://raw.githubusercontent.com/cpjobling/EG-247-Resources/master/portfolio/lab4/fig6_2.png)

From the result of this analysis:

* If the impulse response of the circuit is <em>h</em>(<em>t</em>), use Matlab to Laplace transform <em>h</em>(<em>t</em>) to demonstrate that <em>H</em>(<em>s</em>) is equal to the transfer function <em>V</em>c(<em>s</em>)/<em>U</em>(<em>s</em>) of the circuit.
* Find and plot the impulse response by inverse-Laplace transforming the transfer function <em>H</em>(<em>s</em>)
* Use the state-space and transfer function LTI blocks (see Lab Exercise 13) and the `impulse` function to plot the impulse response of the circuit using Matlab.

## What to hand in

You should add your modified version of the file `rlc.m` in folder `lab4` of your EG-247 portfolio along with the simulink model `rlc.slx`. Additional marks will be awarded according to how many of exercises 12-14 have been completed. Name each solution according to the exercise: e.g. Exercise 12 scripts and models should be named `ex12.m` and `ex12.slx` etc.

See <a href="https://docs.google.com/spreadsheet/ccc?key=0AljOJ7w63DbTdERaUkhYako2V3VEemdabnd6angxSEE&amp;usp=sharing#gid=0" target="_blank"><strong>Assessment and Feedback: Labwork Assessment</strong></a> for a detailed marking scheme.

You will find it easiest to audit your completion of these exercises by publishing the script files using the <strong>Publish</strong> option in the m-file editor. I do not require you to add the published documents in your portfolio as I will regenerate these when I validate your claim.
