
# The Impulse Response and Convolution (Part 1)

Dr Chris Jobling ([c.p.jobling@swansea.ac.uk](mailto:c.p.jobling@swansea.ac.uk))

Digital Technium 123

Office Hours: 12:00-13:00 Mondays

You can view the notes for this presentation in [HTML](http://cpjobling.github.io/EG-247-Resources/week4/convolution.html
  ) and [PDF](http://cpjobling.github.io/EG-247-Resources/week4/convolution.pdf).

  The source code of this presentation is available in Markdown format from GitHub: [convolution.md](https://github.com/cpjobling/EG-247-Resources/tree/master/week4/convolution.md).

The GitHub repository [EG-247 Resources](https://github.com/cpjobling/EG-247-Resources)
also contains the source code for all the Matlab/Simulink
examples and the Laboratory Exercises.

## Scope and Background Reading

This session is an introduction to the impulse response of a system and time
convolution. Together, these can be used to determine a Linear Time Invariant
(LTI) system's time response to any signal.

As we shall see, in the determination of a system's response to a signal input,
time convolution involves integration by parts and is a tricky operation. But
time convolution becomes multiplication in the Laplace Transform domain, and is
much easier to apply.

The material in this presentation and notes is based on Chapter 6 of [Steven T.
Karris, Signals and Systems: with Matlab Computation and Simulink Modelling, 5th
Edition.](http://site.ebrary.com/lib/swansea/docDetail.action?docID=10547416)
and builds on the time response of a state-space model that was developed in the
[previous session](http://nbviewer.ipython.org/github/cpjobling/EG-247-Resources
/blob/master/week4/state_space.ipynb).

## Agenda

The material to be presented will need two sessions.

*Today*

* The Impulse Response of a System in Time Domain
* Even and Odd Functions of Time

*Next Session*

* Time Convolution
* Graphical Evaluation of the Convolution Integral
* System Response by Convolution
* System Response by Laplace

# The Impulse Response of a System in Time Domain

## The Impulse Response of a System in Time Domain

In the last session we showed that if the state-space model of a SISO system
was:

$$\begin{array}{l}
{\bf{\dot x}} = {\bf{Ax}} + {\bf{B}}u\\
y = {\bf{Cx}} + du
\end{array}$$

the state response would be

$${\bf{x}}(t) = {e^{{\bf{A}}t}}{{\bf{x}}_0} + \int_0^t {{e^{{\bf{A}}(t - \tau
)}}{\bf{B}}u(\tau )d\tau } $$

which for our later convenience can be rewritten

$${\bf{x}}(t) = {e^{{\bf{A}}t}}{{\bf{x}}_0} + {e^{{\bf{At}}}}\int_0^t {{e^{ -
{\bf{A}}\tau }}{\bf{B}}u(\tau )d\tau } $$

## Impulse response (1)

If we assume zero initial conditions $\bf{x}_0 = \bf{0}$ and $u(t) = \delta(t)$
(Matlab `dirac`), then the state-reponse to an impulse input is:

$${\bf{x}}(t) = {e^{{\bf{At}}}}\int_0^t {{e^{ - {\bf{A}}\tau
}}{\bf{B}}\delta(\tau )d\tau } $$

Using the *sifting property* of the delta function

$$\int_{-\infty}^{\infty}f(t)\delta(\tau)d\tau = f(0)$$

then

$${\bf{x}}(t) = {e^{{\bf{At}}}}{\bf{B}}$$

so, the impulse response is:

$$y(t) = {\bf{C}}{e^{{\bf{At}}}}{\bf{B}} + d\delta (t)$$

## Impulse response (2)

In most systems that you will encounter on this course the scalar quantity $d =
0$ so the impulse response, which we donate as $h(t)$, is

$$h(t) = {\bf{C}}{e^{{\bf{At}}}}{\bf{B}}u_0(t)$$

where the unit step function $u_0(t)$ has been included to indicate that the
impulse response is only defined for $t>0$.

<div class="notes">

## Note

In the text book, Karris presents the impulse response as

$${\mathbf{x}}(t) = {\mathbf{h}}(t) = {e^{{\mathbf{A}}t}}{\mathbf{B}}{u_0}(t)$$

but this is the impulse response of the state variables and is a vector
quantity.

You need to introduce the output equation to find the actual scalar impulse
response $h(t)$ which is for a SISO system.

Karris gets away with this in his book because he uses voltages and currents as
*physical state variables* and the coefficient of the corresponding $\bf{C}$
matrix will be unity.

In general, we cannot assume that this will be true so I prefer to be a little
more careful in my presentation.

</div>

## Example 1

Compute the impulse response of the series RC circuit shown below in terms of
the constants $R$ and $C$, where the response is considered to be the voltage
across the capicitor, and $v_c(0^-)=0$. Then, compute the current through the
capacitor.

![Example 1](pictures/c_example1.png)

## Example 2

In the RLC circuit shown below, compute the impulse response $h(t)=v_c(t)$ given
that the initial conditions are zero, that is $i_L(0^-)=0$ and $V_c(0^-)=0$.

![Example 2](pictures/c_example2.png)

## Solution

We tackled this problem as Example 6 in the previous session and found that:

$$\begin{array}{l}
{\bf{B}} = \left[ {\begin{array}{*{20}{c}}
4\\
0
\end{array}} \right]\\
{e^{{\bf{A}}t}} = \left[ {\begin{array}{*{20}{c}}
{ - \frac{1}{2}{e^{ - t}} + \frac{3}{2}{e^{ - 3t}}}&{ - 2{e^{ - t}} + 2{e^{ -
3t}}}\\
{\frac{3}{8}{e^{ - t}} + \frac{3}{8}{e^{ - 3t}}}&{\frac{3}{2}{e^{ - t}} -
\frac{1}{2}{e^{ - 3t}}}
\end{array}} \right]
\end{array}$$

so the impulse response of the state variables is:

$$\begin{array}{c}
{\bf{x}}(t) = {e^{{\bf{A}}t}}{\bf{B}}{u_0}(t) = \left[ {\begin{array}{*{20}{c}}
{ - \frac{1}{2}{e^{ - t}} + \frac{3}{2}{e^{ - 3t}}}&{ - 2{e^{ - t}} + 2{e^{ - 3t}}}\\
{\frac{3}{8}{e^{ - t}} + \frac{3}{8}{e^{ - 3t}}}&{\frac{3}{2}{e^{ - t}} - \frac{1}{2}{e^{ - 3t}}}
\end{array}} \right]\left[ {\begin{array}{*{20}{c}}
4\\
0
\end{array}} \right]{u_0}(t)\\
 = \left[ {\begin{array}{*{20}{c}}
{ - 2{e^{ - t}} + 6{e^{ - 3t}}}\\
{\frac{3}{2}{e^{ - t}} + \frac{3}{2}{e^{ - 3t}}}
\end{array}} \right]{u_0}(t
\end{array}$$

## Impulse response

In Example 6 in the previous session, we defined $x_1 = i_L$ and $x_2 = v_c$ so
if we want the circuit output to be the capacitor voltage, the output vector
$\bf{C}$ will be

$${\bf{C}} = \left[ {\begin{array}{*{20}{c}}
0&1
\end{array}} \right]$$

so

$$\begin{array}{*{20}{l}}
{h(t) = y(t) = {v_c}(t)}& = &{{\bf{C}}{e^{{\bf{A}}t}}{\bf{B}}{u_0}(t)}\\
{}& = &{\left[ {\begin{array}{*{20}{c}}
0&1
\end{array}} \right]\left[ {\begin{array}{*{20}{c}}
{ - 2{e^{ - t}} + 6{e^{ - 3t}}}\\
{\frac{3}{2}{e^{ - t}} + \frac{3}{2}{e^{ - 3t}}}
\end{array}} \right]{u_0}(t)}\\
{}& = &{\left( {\frac{3}{2}{e^{ - t}} + \frac{3}{2}{e^{ - 3t}}} \right){u_0}(t) = \frac{3}{2}\left( {{e^{ - t}} + {e^{ - 3t}}} \right){u_0}(t)}
\end{array}$$

# Even and Odd Functions of Time

## Even and Odd Functions of Time

(** This should be revision! **)

## Why do we care?

We need to be reminded of *even* and *odd* functions so that we can develop the
idea of *time convolution* which is a means of determining the time response
of any system for which we know its *impulse response* to any signal.

The development requires us to find out if the Dirac delta function
($\delta(t)$) is an *even* or an *odd* function of time.

## Even Functions of Time

A function $f(t)$ is said to be an *even function* of time if the following
relation holds

$$f(-t) = f(t)$$

that is, if we relace $t$ with $-t$ the function $f(t)$ does not change.

Polynomials with even exponents only, and with or without constants, are even
functions. For example:

$$\cos t = 1 - \frac{t^2}{2!} + \frac{t^4}{4!} - \frac{t^6}{6!} + \ldots$$

is even.

## Other Examples of Even Functions

![Even functions](pictures/even_funcs.png)

## Odd Functions of Time

A function $f(t)$ is said to be an *odd function* of time if the following
relation holds

$$-f(-t) = f(t)$$

that is, if we relace $t$ with $-t$, we obtain the negative of the function
$f(t)$.

Polynomials with odd exponents only, and no constants, are odd functions. For
example:

$$\sin t = t - \frac{t^3}{3!} + \frac{t^5}{5!} - \frac{t^7}{7!} + \ldots$$

is odd.

## Other Examples of Odd Functions

![Examples of odd functions](pictures/odd_funcs.png)

## Observations

* For odd functions $f(0) = 0$.
* If $f(0) = 0$ we should not conclude that $f(t)$ is an odd function. *c.f.*
$f(t) = t^2$ is even, not odd.
* The product of *two even* or *two odd* functions is an even function.
* The product of an even and an odd function, is an odd function.

In the following $f_e(t)$ will donate an even function and $f_o(t)$ an odd
function.

## Time integrals of even and odd functions

For an even function $f_e(t)$

$$\int_{-T}^{T}f_e(t) dt = 2 \int_{0}^{T}f_e(t) dt$$

For an odd function $f_o(t)$

$$\int_{-T}^{T}f_o(t) dt = 0$$

## Even/Odd Representation of an Arbitrary Function

A function $f(t)$ that is neither even nor odd can be represented as an even
function by use of:

$$f_e(t) = \frac{1}{2}\left[f(t)+f(-t)\right]$$

or as an odd function by use of:

$$f_o(t) = \frac{1}{2}\left[f(t)-f(-t)\right]$$

Adding these together, an abitrary signal can be represented as

$$f(t) = f_e(t) + f_o(t)$$

That is, any function of time can be expressed as the sum of an even and an odd
function.

## Example 3

Is the Dirac delta $\delta(t)$ an even or an odd function of time?

## Solution

Let $f(t)$ be an arbitrary function of time that is continous at $t=t_0$. Then
by the sifting property of the delta function

$$\int_{-\infty}^{\infty} f(t)\delta(t-t_0) dt = f(t_0)$$

and for $t_0 = 0$

$$\int_{-\infty}^{\infty} f(t)\delta(t) dt = f(0)$$

----

Also for an even function $f_e(t)$

$$\int_{-\infty}^{\infty} f_e(t)\delta(t) dt = f_e(0)$$

and for an odd function $f_o(t)$

$$\int_{-\infty}^{\infty} f_o(t)\delta(t) dt = f_o(0)$$

## Even or odd?

An odd function $f_o(t)$ evaluated at $t=0$ is zero, that is $f_o(0) = 0$.

Hence

$$\int_{-\infty}^{\infty} f_o(t)\delta(t) dt = f_o(0) = 0$$

Hence the product $f_o(t)\delta(t)$ is odd function of $t$.

----

Since $f_o(t)$ is odd, $\delta(t)$ must be even because only an *even* function
multiplied by an *odd* function can result in an *odd* function.

(Even times even or odd times odd produces an even function. See earlier slide)

## Is the Dirac delta $\delta(t)$ an even or an odd function of time?

$\delta(t)$ is an *even* function.

This will be useful to us later.

## Next Time

We will conclude our discussion of *Time Convolution* by presenting:

* Time Convolution
* Graphical Evaluation of the Convolution Integral
* System Response by Convolution
* System Response by Laplace

## Homework

You should be able to do Question 1 from Section 6.7 of the textbook.

If you want to refresh your knowledge of even and odd functions, Chapter 1 of
[Schaum's Outline on Signals and Systems (Hsu, 2nd
Ed.)](https://www.dawsonera.com/abstract/9780071634731) has some examples. For
example see Solved Problems 1.5&ndash;1.8 and Supplementary Problems
1.48&ndash;1.50$.

## Lab Work

In the lab, a week on Friday, we will demostrate the solution of Examples 1 and 2 in
Matlab.
