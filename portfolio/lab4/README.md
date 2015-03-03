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
