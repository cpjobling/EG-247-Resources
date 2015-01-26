
# Elementary Signals

Dr Chris Jobling
([c.p.jobling@swansea.ac.uk](mailto:c.p.jobling@swansea.ac.uk))<br />Digital
Technium 123<br />Office Hours: Thursdays 14:00-15:00

You can view the notes for this presentation in [HTML format](http://nbviewer.ip
ython.org/github/cpjobling/EG-247-Resources/blob/master/week1/elementary_signals
.ipynb) and print using your Brower's print function. The source code of this
presentation is available as an interactive [IPython
notebook](http://ipython.org/notebook.html) from GitHub:
<https://github.com/cpjobling/EG-247-Resources>. The GitHub repository also
contains the source code for all the Matlab/Simulink examples.

## Review of Final Example from Previous

Consider a signal

$$x = f(t) = \left\{ {\begin{array}{*{20}{c}}
{0\;:\;t <  - 1}\\
{t + 1\;:\; - 1 \le t \le 1}\\
{0\;:\;t > 1}
\end{array}} \right.$$

Sketch this signal and plot the effect on this signal of applying the following
basic signal operations

* $2 f(t)$
* $0.5 f(t)$
* $f(2t)$
* $f(0.5 t)$
* $-f(t)$
* $f(-t)$
* $-f(-t)$
* $f(t - 1)$
* $f(t + 1)$
* $-2f(-t+2)$

### Sketch of signal

<img src="files/pictures/sig1.png">

### Amplitude scaling

<img src="files/pictures/sigs2.png">

### Time scaling

<img src="files/pictures/sigs3.png">

### Mirroring

<img src="files/pictures/sigs4.png">

### Time shifting - delay and advance

<img src="files/pictures/sigs5.png">

### Exercise

We leave the solution of $-2f(-t+2)$ as an exercise for the reader but note that
it involves *amplitude scaling*, *amplitude mirroring*, *time mirroring*, and a
*time shift*. Each operation can be performed in sequence in any order.

## Elementary Signals

Consider this circuit:

<img src="files/pictures/circuit1.png">

What happens **before** $t=0$?

1. $v_{\mathrm{out}} = \mathrm{undefined}$
2. $v_{\mathrm{out}} = 0$
3. $v_{\mathrm{out}} = V_s$
4. $v_{\mathrm{out}} = 1/2$
5. $v_{\mathrm{out}} = \infty$

<img src="files/pictures/circuit1.png">

What happens **after** $t=0$?

1. $v_{\mathrm{out}} = \mathrm{undefined}$
2. $v_{\mathrm{out}} = 0$
3. $v_{\mathrm{out}} = V_s$
4. $v_{\mathrm{out}} = 1/2$
5. $v_{\mathrm{out}} = \infty$

<img src="files/pictures/circuit1.png">

What happens **at** $t=0$?

1. $v_{\mathrm{out}} = \mathrm{undefined}$
2. $v_{\mathrm{out}} = 0$
3. $v_{\mathrm{out}} = V_s$
4. $v_{\mathrm{out}} = 1/2$
5. $v_{\mathrm{out}} = \infty$

What does the response of $V_{\mathrm{out}}$ look like?

1: <img src="files/pictures/impulse.png">

What does the response of $V_{\mathrm{out}}$ look like

2: <img src="files/pictures/ramp.png">

What does the response of $V_{\mathrm{out}}$ look like

3: <img src="files/pictures/step1.png">

What does the response of $V_{\mathrm{out}}$ look like?

4: <img src="files/pictures/curve.png">

## Answers

Mathematically

1. $v_{\mathrm{out}} = 0$ when $-\infty < t < 0$ (answer 2)
2. $v_{\mathrm{out}} = V_s$ when $0 < t < \infty$ (answer 3)
3. $v_{\mathrm{out}} = \mathrm{undefined}$ when $t=0$ (answer 1)

$V_{\mathrm{out}}$ jumps from $0$ to $V_s$ instantanously when the switch is
closed. We call this a discontinuous signal!

The correct image is:

3: <img src="files/pictures/step2.png">

## Unit Step Function

$${u_0}(t) = \left\{ {\begin{array}{*{20}{c}}
{0\quad t < 0}\\
{1\quad t > 0}
\end{array}} \right.$$

<img src="files/pictures/unitstep.png">

### In Matlab

In Matlab, we use the `heaviside` function (Named after [Oliver
Heaviside](http://en.wikipedia.org/wiki/Oliver_Heaviside)).

```syms t
ezplot(heaviside(t),[-1,1])
```

<img src="files/pictures/heaviside.png">

See: [heaviside_function.m](files/matlab/heaviside_function.m)

Note that, so it can be plotted, Matlab defines the *heaviside function*
slightly differently from the mathematically ideal unit step:

$$\mathrm{heaviside}(t) = \left\{ {\begin{array}{*{20}{c}}
{0\quad t < 0}\\
{1/2\quad t = 0}\\
{1\quad t > 0}
\end{array}} \right.$$


## Circuit Revisited

Consider the network shown below, where the switch is closed at time $t=T$.

<img src="files/pictures/circuit2.png">

Express the output voltage $v_{\mathrm{out}}$ as a function of the unit step
function, and sketch the appropriate waveform.

## Simple Signal Operations

### Amplitude Scaling

Sketch $Au_0(t)$ and $-Au_0(t)$

### Time Reversal

Sketch $u_0(-t)$

### Time Delay and Advance

Sketch $u_0(t-T)$ and $u_0(t+T)$

## Examples

### Example 1

Which of these signals represents $-Au_0(t+T)$?

<img src="files/pictures/stepf1.png" width="50%">

### Example 2

What is represented by

<img src="files/pictures/stepf2.png" width="50%">

1. $-Au_0(t - T)$
2. $-Au_0(-t + T)$
3. $-Au_0(-t - T)$
4. $-Au_0(t-T)$

## Synthesis of Signals from Unit Step

Unit step functions can be used to represent other time-varying functions such
as rectangular pulses, square waves and triangular pulses.

### Synthesize Rectangular Pulse

<img src="files/pictures/rect.png">

### Synthesize Square Wave

<img src="files/pictures/square_wave.png">

### Synthesize Symmetric Rectangular Pulse

<img src="files/pictures/symm_rect.png">

### Synthesize Symmetric Triangular Pulse

<img src="files/pictures/symm_tri.png">

## Homework

Show that the waveform shown below

<img src="files/pictures/example1.png">

can be represented by the function

$$v(t) = (2t + 1)u_0(t)-2(t-1)u_0(t-1)-tu_0(t-2)+(t-3)u_o(t-3)$$

## The Ramp Function

<img src="files/pictures/rc.png">

In the circuit shown above $i_s$ is a constant current source and the switch is
closed at time $t=0$. Show that the voltage across the capacitor can be
represented as

$$v_C(t)=\frac{i_s}{C}t u_0(t)$$

and sketch the wave form.

The unit ramp function is defined as

$$u_1(t) = \int_{-\infty}^{t}u_0(\tau)d\tau$$

so

$${u_1}(t) = \left\{ {\begin{array}{*{20}{c}}
{0\quad t < 0}\\
{t\quad t \ge 0}
\end{array}} \right.$$

and

$$u_0(t) = \frac{d }{dt}u_1(t)$$

### Note

Higher order functions of $t$ can be generated by the repeated integration of
the unit step function.

For future reference, you should determine $u_2(t)$, $u_3(t)$ and $u_n(t)$ for
yourself and make a note of the general rule:

$$u_{n-1} = \frac{1}{n}\frac{d}{dt}u_n(t)$$

Details are given in equations 1.26&mdash;1.29 in the textbook.

## The Dirac Delta Function

<img src="files/pictures/lr.png">

In the circuit shown above, the switch is closed at time $t=0$ and $i_L(t)=0$
for $t<0$. Express the inductor current $i_L(t)$ in terms of the unit step
function.

To solve this problem we need to invent a function that represents the
derivative of the unit step function. This function is called $\delta(t)$ or the
*dirac delta* function (named after [Paul
Dirac](http://en.wikipedia.org/wiki/Paul_Dirac)).

This function is tricky because $u_0(t)$ is discontinuous at $t=0$ but it must
have the properties

$$\int_{-\infty}^{t}\delta(\tau)d\tau = u_0(t)$$

and

$\delta(t) = 0$ for all $t\ne 0$.

### Sampling Property

The *sampling property* of the delta function states that

$$f(t)\delta(t-a) = f(a)\delta(t-a)$$

or, when $a = 0$,

$$f(t)\delta(t) = f(0)\delta(t)$$

Multiplication of any function $f(t)$ by the delta function $\delta(t)$ results
in sampling the function at the time instants for which the delta function is
not zero.

The study of descrete-time (sampled) systems is based on this property.

*You should work through the proof* for youself.

### Sifting Property

The *sifting property* of the delta function states that

$$\int_{-\infty}^{\infty}f(t)\delta(t-\alpha)dt=f(\alpha)$$

That is, if multiply any function $f(t)$ by $\delta(t-\alpha)$, and integrate
from $-\infty$ to $+\infty$, we will get the value of $f(t)$ evaluated at
$t=\alpha.$

*You should also work through the proof* for yourself.

### Higher Order Delta Fuctions

the n*th*-order *delta function* is defined as the n*th* derivative of $u_0(t)$,
that is

$$\delta^n(t)=\frac{d^n}{dt^n}[u_0(t)]$$

The function $\delta'(t)$ is called the *doublet*, $\delta''(t)$ is called the
*triplet* and so on.

By a procedure similar to the derivation of the sampling property we can show
that

$$f(t)\delta'(t-a)=f(a)\delta'(t-a)-f'(t)\delta(t-a)$$



Also, derivation of the sifting property can be extended to show that

$$\int_{-\infty}^{infty}f(t)\delta^n(t-\alpha)dt = {\left. {{{( -
1)}^n}\frac{{{d^n}}}{{d{t^n}}}[f(t)]} \right|_{t = \alpha }}$$

## Examples

### Example 3

Evaluate the following expressions

1. $$3t^4\delta(t-1) $$
2. $$\int_{-\infty}^{\infty}t\delta(t-2)dt$$
3. $$t^2\delta'(t-3)$$


### Example 4

<img src="files/pictures/example2.png">

1. Express the voltage waveform $v(t)$ shown above aa sum of unit step functions
for the time interval $-1 < t < 7$ s

2. Using the result of part (1), compute the derivative of $v(t)$ and sketch
it's waveform.

## Homework

Do the end of the chapter exercises (Section 1.7) from the textbook. Don't look
at the answers until you have attempted the problems.

## Lab Work

In the lab, on Monday, we will solve Example 2 using Matlab/Simulink following
the procedure given in Pages between pages 1-17 and 1-22 of the textbook. We
will also explore the `heaviside` and `dirac` functions.
