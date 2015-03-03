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

Save and add your copy of the modified `rlc.m` file plus the Simulink model (suggested name `rlc.slx`) to your lab4 portfolio.

## Lab Exercise 12: The Laplace Transform of the Transition Matrix

![Figure 5.10](https://raw.githubusercontent.com/cpjobling/EG-247-Resources/master/portfolio/lab4/fig5_10.png)

Adapt the script used in Lab Exercise 11 to determine the state-space model of the circuit shown in Figure 5.10. Use Matlab to show that the Laplace transform of the transition matrix <em>e</em><strong><sup>A</sup></strong><sup><strong></strong><em>t</em></sup> is defined by the inverse laplace transform of (s<strong>I</strong>-<strong>A</strong>)<sup>-1</sup>.</p>

Save and add the resulting script as `ex12.m` to your lab4 portfolio.
