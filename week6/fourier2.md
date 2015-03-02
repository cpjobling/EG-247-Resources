
# Fourier Series (Part 2)

Dr Chris Jobling ([c.p.jobling@swansea.ac.uk](mailto:c.p.jobling@swansea.ac.uk))

Digital Technium 123

Office Hours: 12:00-13:00 Mondays

You can view the notes for this presentation in [HTML](http://cpjobling.github.io/EG-247-Resources/week6/fourier2.html
  ) and [PDF](http://cpjobling.github.io/EG-247-Resources/week6/fourier2.pdf).

  The source code of this presentation is available in Markdown format from GitHub: [fourier2.md](https://github.com/cpjobling/EG-247-Resources/tree/master/week6/fourier2.md).

The GitHub repository [EG-247 Resources](https://github.com/cpjobling/EG-247-Resources)
also contains the source code for all the Matlab/Simulink
examples and the Laboratory Exercises.



## Agenda

*Last time*

* Trigonometric Fourier Series

*This Time*

* Exponents and Euler's Equation
* The Exponential Fourier series
* Symmetry in Exponential Fourier Series
* Examples

*Next Time*

* Line spectra
* Power in periodic signals
* Steady-State Response of an LTI System to a Periodic Signals

## Scope and Background Reading

This session continues our introduction to Fourier Series.

Trigonometric Fourier series uses integration of a periodic signal multiplied by
sines and cosines at the fundamental and harmonic frequencies. If performed by
hand, this can a painstaking process. Even with the simplifications made
possible by exploiting waveform symmetries, there is still a need to integrate
cosine and sine terms, be aware of and able to exploit the tigonometrc
identities, and the properties of *orthogonal functions* before we can arrive at
the simplified solutions. This is why I concentrated on the properties and left
the computation to a computer.

----

However, by exploiting the exponential function $e^{at}$, we can derive a method
for calculating the coefficients of the harmonics that is much easier to
calculate by hand and convert into an algorithm that can be executed by
computer.

The result is called the *Exponential Fourier Series* and we will develop it in
this session.

----

The material in this presentation and notes is based on Chapter 7 (Starting at
Section 7.8) of [Steven T. Karris, Signals and Systems: with Matlab Computation
and Simulink Modelling, 5th
Edition.](http://site.ebrary.com/lib/swansea/docDetail.action?docID=10547416)
from the Required Reading List. Some clarificattion was needed and I used
Chapter 4 of [Benoit Boulet, Fundamentals of Signals and
Systems](http://site.ebrary.com/lib/swansea/docDetail.action?docID=10228195)
from the Recommended Reading List for this.

# Exponents and Euler's Equation

## The Exponential Function $e^{at}$

* You should already be familiar with $e^{at}$ because it appears in the
solution of differential equations; the transition matrix $\phi(t)$ used in the
solution of state-space models; and the definition of the impulse response of a
system.
* It's also a function that appears in the definition of the Laplace and Inverse
Laplace Transform
* It's pops up again and again in tables and properties of the Laplace Transform.

## Case when a is real.

When $a$ is real the function $e^{at}$ will take one of the two forms
illustrated below:

![Case when $a$ is real. ](pictures/expon.png)

<div class="notes"

* When $a < 0$ the response is a decaying exponential (green line in plot)
* When $a = 0$ $e^{at} = 1$ -- essentially a model of DC
* When $a > 0$ the response is an *unbounded* increasing exponential (blue line
in plot)

Image generated with this Matlab script: [expon.m](matlab/expon.m)
</div>

## Case when a is imaginary

This is the case that helps us simplify the computation of *sinusoidal Fourier
series*.

It was [Leonhard Euler](http://en.wikipedia.org/wiki/Leonhard_Euler) who
discovered the [formula](http://en.wikipedia.org/wiki/Euler%27s_formula)
$$exp(j\omega t) = cos(\omega t) + jsin(\omega t)$$
visualized on the next slide.

## Case when a is imaginary

![Case when $a$ is imaginary](pictures/euler.png)

## Some important values of $\omega t$

These are useful when simplifying expressions that result from integrating
functions that involve the imaginary exponential

Give the following:

* $e^{j\omega t}$ when $\omega t = 0$
* $e^{j\omega t}$ when $\omega t = \pi/2$
* $e^{j\omega t}$ when $\omega t = \pi$
* $e^{j\omega t}$ when $\omega t = 3\pi/2$
* $e^{j\omega t}$ when $\omega t = 2\pi$


## Solution

* When $\omega t = 0$: $e^{j\omega t} = e^{j0} = 1$
* When $\omega t = \pi/2$: $e^{j\omega t} = e^{j\pi/2} = j$
* When $\omega t = \pi$: $e^{j\omega t} = e^{j\pi} = -1$
* When $\omega t = 3\pi/2$: $e^{j\omega t} = e^{j3\pi/2} = -j$
* When $\omega t = 2\pi$: $e^{j\omega t} = e^{j2\pi} e^{j0}= 1$

<div class="notes">
It is also worth being aware that $n\omega t$, when $n$ is an integer, produces
rotations that often map back to the simpler cases given above. For example see
$e^{j2\pi}$ above.
</div>

## Case where a is complex

We shall not say much about this case except to note that the Laplace transform
equation includes such a number. The variable $s$ in the Laplace Transform

$$\int_{0}^{\infty} f(t)e^{-st} dt$$

is a *complex exponential*.

The consequences of a complex $s$ have particular significance in the
development of system stabilty theories and in control systems analysis and
design. Look out for them in EG-243.

## Two Other Important Properties

By use of trig. identities, it is relatively straight forward to show that:

$$\cos \omega t = \frac{e^{j\omega t} + e^{-j\omega t}}{2}$$

and

$$\sin \omega t = \frac{e^{j\omega t} - e^{-j\omega t}}{j2}$$

We can use this result to convert the *Trigonometric Fourier Series* into an
*Exponential Fourier Series* which has only one integral term to solve per
harmonic.

# The Exponential Fourier Series

## The Exponential Fourier Series

As we saw last time any periodic waveform $f(t)$ can be represented as

$$\begin{gathered}
  f(t) = \frac{1}{2}{a_0} + {a_1}\cos \omega t + {a_2}\cos 2\omega t +  \cdots
\\
   + {b_1}\sin \omega t + {b_2}\sin 2\omega t +  \cdots  \\
\end{gathered} $$

If we replace the cos and sin terms with their imaginary exponential equivalents:

$$\begin{gathered}
  f(t) = \frac{1}{2}{a_0} + {a_1}\left(\frac{e^{j\omega t} + e^{-j\omega
t}}{2}\right) + {a_2}\left(\frac{e^{j2\omega t} + e^{-j2\omega t}}{2}\right) +
\cdots  \\
   + {b_1}\left(\frac{e^{j\omega t} - e^{-j\omega t}}{j2}\right) +
{b_2}\left(\frac{e^{j2\omega t} - e^{-j2\omega t}}{j2}\right) +  \cdots  \\
\end{gathered} $$

## Gouping terms with same exponents

$$\begin{array}{l}
f(t) =  \cdots  + \left( {\frac{{{a_2}}}{2} - \frac{{{b_2}}}{{j2}}} \right){e^{ - j2\omega t}} + \left( {\frac{{{a_1}}}{2} - \frac{{{b_1}}}{{j2}}} \right){e^{ - j\omega t}} + \frac{1}{2}{a_0}\\
\quad  + \left( {\frac{{{a_1}}}{2} + \frac{{{b_1}}}{{j2}}} \right){e^{j\omega t}} + \left( {\frac{{{a_2}}}{2} + \frac{{{b_2}}}{{j2}}} \right){e^{j2\omega t}} +  \cdots
\end{array}$$

## New coefficents

The terms in parentheses are usually denoted as

$$C_{-k} = \frac{1}{2}\left(a_k-\frac{b_k}{j}\right) = \frac{1}{2}\left(a_k+j
b_k\right)$$

$$C_{k} = \frac{1}{2}\left(a_k+\frac{b_k}{j}\right) = \frac{1}{2}\left(a_k-j
b_k\right)$$

$$C_0 = \frac{1}{2}a_0$$

## The Exponential Fourier Series

$$f(t) = \cdots + C_{-2}e^{-j2\omega t} + C_{-1}e^{-j\omega t} + C_0 +
C_{1}e^{j\omega t} + C_{2}e^{j2\omega t} +\cdots $$

or more compactly

$$f(t) = \sum_{k=-n}^{n}C_{k}e^{-jk \omega  t}$$

**Important**

The $C_k$ coefficents, except for $C_0$ are *complex* and appear in conjugate
pairs so

$$C_{-k} = C_k^*$$

## Evaluation of the complex coefficients

The coefficients are obtained from the following expressions<sup>*</sup>:

$$C_k = \frac{1}{2\pi}\int_{0}^{2\pi}f(t)e^{-jk(\omega t)}\,d(\omega t)$$

or

$$C_k = \frac{1}{T}\int_{0}^{T}f(t)e^{-jk\omega t}\,dt$$

These are much easier to derive and compute than the equivalent Trigonometric
Fourier Series coefficients.

<div class="notes">
<sup>*</sup> The analysis that leads to this result is provided between pages
7-31 and 7-32 of the text book. It is not a difficult proof, but we are more
interested in the result.
</div>

## Trigonometric Fourier Series from Exponential Fourier Series

By substituting $C_{-k}$ and $C_{k}$ back into the original expansion

$$C_k+C_{-k} = \frac{1}{2}\left(a_k-jb_k + a_k+jb_k\right)$$

so

$$a_k = C_k + C_{-k}$$

----

Similarly

$$C_k-C_{-k} = \frac{1}{2}\left(a_k-jb_k - a_k-jb_k\right)$$

so

$$b_k = j\left(C_k - C_{-k}\right)$$

Thus we can easily go back to the Trig. Fourier series if we want to.

# Symmetry in Exponential Fourier Series

## Symmetry in Exponential Fourier Series

Since the coefficients of the Exponential Fourier Series are complex numbers, we
can use symmetry to determine the form of the coefficients and thereby simplify
the computation series for wave forms that have symmetry.

## Even Functions

For even functions, all coefficients $C_k$ are real.

<div class="notes">
**Proof**

Recall

$$C_{-k} = \frac{1}{2}\left(a_k-\frac{b_k}{j}\right) =
\frac{1}{2}\left(a_k+jb_k\right)$$

and

$$C_k = \frac{1}{2}\left(a_k+\frac{b_k}{j}\right) = \frac{1}{2}\left(a_k-
jb_k\right)$$

From last session, even functions have no sine terms so the $b_k$ coefficients
are 0. Therefore both $C_{-k}$ and $C_k$ are real.
</div>

## Odd Functions

For odd functions, all coefficients $C_k$ are imaginary.

By a similar argument, all odd functions have no cosine terms so the $a_k$
coefficients are 0. Therefore both $C_{-k}$ and $C_k$ are imaginary.


## Half-wave symmetry

If there is *half-wave symmetry*, $C_k = 0$ for $n$ even.

<div class="notes">
**Proof**

From trigonometric Fourier Series, if there is half-wave symmetry, all even
harnonics are zero, thus both $a_k$ and $b_k$ are zero for $k$ even. Hence
$C_{-k}$ and $C_k$ are also zero when $k$ is even.
</div>

## No symmetry

If there is no symmetry the Exponential Fourier Series of $f(t)$ is complex.

## Relation of $C_{-k}$ to $C_{k}$

$C_{-k}$ is **always** the complex conjugate of $C_{k}$

So

$$C_{-k} = C_{k}^*$$

# Examples

## Example 1

Compute the Exponential Fourier Series for the square wave shown below assuming
that $\omega = 1$

![Example 1](pictures/sqw.png)

## Some questions for you

* Square wave is an [**odd/even/neither**] function?
* DC component is [**zero/non-zero**]?
* Square wave [**has/does not have**] half-wave symmetry?

Hence

* $C_0 = $ [**?**]
* Coefficients $C_k$ are [**real/imaginary/complex**]?
* Subscripts $k$ are [**odd only/even only/both odd and even**]?
* What is the integral that needs to be solved for $C_k$?

## Some answers for you

* Square wave is an **odd** function!
* DC component is **zero**!
* Square wave **has** half-wave symmetry!

Hence

* $C_0 = 0$
* Coefficients $C_k$ are **imaginary**!
* Subscripts $k$ are **odd only**!
* What is the integral that needs to be solved for $C_k$?

----

$${C_k} = \frac{1}{{2\pi }}\int_0^{2\pi } f (t){e^{ - jk(\omega t)}}\,d(\omega t)$$

$${C_k} = \frac{1}{{2\pi }}\left[ {\int_0^\pi  A {e^{ - jk(\omega t)}}\,d(\omega t) + \int_\pi ^{2\pi } {( - A)} {e^{ - jk(\omega t)}}\,d(\omega t)} \right]$$

## Solution

See notes for detailed evaluation of the integral that leads to this result

<div class="notes">
$$\frac{1}{2\pi}\left[\int_{0}^{\pi} Ae^{-jk(\omega t)}\, d(\omega t) +
\int_{\pi}^{2\pi} (-A)e^{-jk(\omega t)}\, d(\omega t)\right] =
\frac{1}{2\pi}\left[\left.\frac{A}{-jk}e^{-jk(\omega
t)}\right|_0^\pi+\left.\frac{-A}{-jk}e^{-jk(\omega
t)}\right|_\pi^{2\pi}\right]$$

$$ = \frac{1}{2\pi}\left[\frac{A}{-jk}\left(e^{-jk\pi} -
1\right)+\frac{A}{jk}\left(e^{-j2k \pi}-e^{-jk\pi}\right)\right] =
\frac{A}{2j\pi k}\left(1 - e^{-jk\pi}+ e^{-j2k \pi}-e^{-jk\pi}\right)$$

$$\frac{A}{2j\pi k}\left(e^{-j2k \pi} - 2e^{-jk\pi} -1 \right) = \frac{A}{2j\pi
k}\left(e^{-jk\pi}-1\right)^2$$

For $n$ odd<sup>*</sup>, $e^{-jk\pi} = -1$. Therefore
</div>

$$\begin{array}{c}
\begin{array}{*{20}{c}}
{{C_k}}\\
{k = {\rm{odd}}}
\end{array} = \frac{A}{{2j\pi k}}{\left( {{e^{ - jk\pi }} - 1} \right)^2}\\
 = \frac{A}{{2j\pi k}}{\left( { - 1 - 1} \right)^2}\\
 = \frac{A}{{2j\pi k}}{\left( { - 2} \right)^2}\\
 = \frac{{2A}}{{j\pi k}}
\end{array}$$

<div class="notes">
<sup>*</sup> You may want to verify that $C_0 = 0$ and

$${C_n \atop {n=\mathrm{even}}} = 0.$$
</div>

## exponential Fourier series for the square wave with odd symmetry

From the definition of the exponential Fourier series

$$f(t) = \cdots + C_{-2}e^{-j2\omega t} + C_{-1}e^{-j\omega t} + C_{0} +
C_{1}e^{j\omega t} + C_{2}e^{j2\omega t} + \cdots$$

the *exponential Fourier series for the square wave with odd symmetry* is

$$f(t) = \frac{2A}{j\pi}\left(\cdots - \frac{1}{3}e^{-j3\omega t} - e^{-j\omega
t} + e^{j\omega t} + \frac{1}{3}e^{j3\omega t} + \cdots\right)$$
$$f(t) = \frac{2A}{j\pi}\sum_{k = \mathrm{odd}} \frac{1}{k}e^{jk\omega t}$$

<div class="notes">
Note sign change in first two terms. This is due to the fact that $C_{-k} =
C_k^*$.

E.g. since $C_3 = 2A/j3\pi$, $C_{-3} = C_3^* = -2A/j3\pi$
</div>

## Trig. Fourier Series from Exponential Fourier Series

Since

$$f(t) = \frac{2A}{j\pi}\left(\cdots - \frac{1}{3}e^{-j3\omega t} - e^{-j\omega
t} + e^{j\omega t} + \frac{1}{3}e^{j3\omega t} + \cdots\right) $$

gathering terms at each harmonic frequency gives

$$f(t) = \frac{4A}{\pi}\left(\cdots + \left(\frac{e^{j\omega t} - e^{-j\omega
t}}{2j}\right)  + \frac{1}{3}\left(\frac{e^{j3\omega t} - e^{-j3\omega
t}}{2j}\right)  +  \cdots\right)$$
$$f(t) = \frac{4A}{\pi}\left(\sin \omega t +
\frac{1}{3}\sin 3\omega t + \cdots\right) = \frac{4A}{\pi} \sum_{k=\mathrm{odd}}
\frac{1}{k}\sin k\omega t$$

## Example 2

Verify the result of Example 1 using Matlab.

## Solution

Solution: See [efs_sqw.m](matlab/efs_sqw.m).

Script confirms that:

* $C_0 = 0$
* $C_k$ is imaginary: function is odd
* $C_k = 0$: for $i$ even -- half-wave symmetry

----

```
X =

[ (A*2*i)/(5*pi), 0, (A*2*i)/(3*pi), 0, (A*2*i)/pi, 0, -(A*2*i)/pi, 0,
-(A*2*i)/(3*pi), 0, -(A*2*i)/(5*pi)]


w =

    -5    -4    -3    -2    -1     0     1     2     3     4     5
```

## Plot of Result

![Result of example 2](pictures/efs_sqw.png)

## End of Part 2

*Summary*

* Exponents and Euler's Equation
* The exponential Fourier series
* Symmetry in Exponential Fourier Series
* Examples

*Next Time*

* Line spectra
* Power in periodic signals
* Steady-State Response of an LTI System to a Periodic Signals

## Home work

Compute the exponential Fourier series for the wave forms shown in the last
lecture.

## Lab Work

In the lab, in week 7, we will explore Fourier Series and their
applications
