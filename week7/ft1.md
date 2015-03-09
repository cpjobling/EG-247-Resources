
# The Fourier Transform (Part 1)

Dr Chris Jobling
([c.p.jobling@swansea.ac.uk](mailto:c.p.jobling@swansea.ac.uk))<br />Digital
Technium 123<br />Office Hours: Thursdays 14:00-15:00

You can view the notes for this presentation in [HTML format](http://nbviewer.ip
ython.org/github/cpjobling/EG-247-Resources/blob/master/week7/ft1.ipynb) and
print using your Brower's print function. The source code of this presentation
is available as an interactive [IPython
notebook](http://ipython.org/notebook.html) from GitHub:
<https://github.com/cpjobling/EG-247-Resources>. The GitHub repository also
contains the source code for all the Matlab/Simulink examples.

## Agenda

* Fourier Transform as the Limit of a Fourier Series
* Doing the Maths
* Special forms of the Fourier Transform
* Properties of the Fourier Transform
* Computing Fourier Transforms in Matlab

## Scope and Background Reading

This session continues our coverage of **Fourier Analysis** with an introduction
to the **Fourier Transform**.

* **Fourier Series** is used when we are dealing with signals that are
*periodic* in time. It is based on harmonics of the fundamental frequency
$\omega_0$ of the periodic signal where the period $T = 2\pi/\omega_0$.

* The line spectrum occur at integer multiples of the fundamental frequency
$k\omega_0$ and is a *discrete* (or sampled) function of frequency.

* As the period $T$ is increased, the distance between harmonics decreases
because $\omega_0$ reduces.

* In the limit $T\to \infty$, the signal becomes **aperiodic** and $k\omega_0
\to \omega$ which is a *continuous* function of frequency.

This is the basis of the **Fourier Transform** which is very important as the
basis for data transmission, signal filtering, and the determination of system
frequency reponse.

The material in this presentation and notes is based on Chapter 8 (Starting at
Section 8.1) of [Steven T. Karris, Signals and Systems: with Matlab Computation
and Simulink Modelling, 5th
Edition.](http://site.ebrary.com/lib/swansea/docDetail.action?docID=10547416)
from the **Required Reading List**. I also used Chapter 5 of [Benoit Boulet,
Fundamentals of Signals and
Systems](http://site.ebrary.com/lib/swansea/docDetail.action?docID=10228195)
from the **Recommended Reading List**.

##  Fourier Transform as the Limit of a Fourier Series

We start by considering the pulse train that we used in the last lecture and
demonstrate that the discrete line spectra for the Fourier Series becomes a
continuous spectrum as the signal becomes aperiodic.

This analysis is from Boulet pp 142&mdash;144 and 176&mdash;180.

Let $\tilde x(t)$ be the Fourier series of the rectangular pulse train shown
below:

<img src="files/pictures/pulse_train.png">



## Fourier Series

In the previous lecture we used

$$C_k = \frac{1}{2\pi}\int_{-\pi/w}^{\pi/w} Ae^{-jk(\omega t)}\,d(\omega t) =
\frac{A}{2\pi}\int_{-\pi/w}^{\pi/w} e^{-jk(\omega t)}\,d(\omega t) $$

to compute the line spectra.

### From the Time Point of View

If we instead take a time point-of-view and let $A = 1$

$$C_k = \frac{1}{T}\int_{-t_0}^{t_0} e^{-jk\omega_0 t}\,dt.$$

Let's complete the analysis on the board.

$$C_k = \frac{1}{T}\int_{-t_0}^{t_0} e^{-jk\omega_0 t}\,dt =
-\frac{1}{jk\omega_0 T}\left[e^{-jk\omega_0 t}\right]_{-t_0}^{t_0} =
-\frac{1}{jk\omega_0 T}\left(e^{-jk\omega_0 t_0}-e^{jk\omega_0 t_0}\right)$$

$$C_k = \frac{2}{k\omega_0 T}\left(\frac{e^{jk\omega_0 t_0}-e^{-jk\omega_0
t_0}}{2j}\right) = 2\frac{\sin(k\omega_0 t_0)}{k\omega_0 T}$$

and since $\omega_0 = 2\pi/T$

$$C_k = \frac{\sin\left(\pi k\frac{2t_0}{T}\right)}{k\pi } =
\frac{T}{2t_0}{\mathop{\rm sinc}}\left(\pi k\frac{2t_0}{T}\right)$$


### The Sinc Function

The function, $\sin(x)/x$ crops up again and again in Fourier analysis. The
Fourier coefficients $C_k$ are scaled *samples* of the real continuous
*normalized sinc* function defined as follows:

$$\operatorname{sinc} u: = \frac{{\sin \pi u}}{{\pi u}},\;u \in \mathbb{R}.$$

The function is equal to 1 at $u=0$<sup>*</sup> and has zero crossings at $u=\pm
n,\; n=1,2,3,\ldots$ as shown below

<img src="files/pictures/sinc.png">

Matlab code to reproduce this plot: [sinc_plot.m](files/matlab/sinc_plot.m).

----

Note $sin(\pi u)/(\pi u)$ is undefined at $u = 0$. To compute its value we need
to take the limit

$$\lim_{u\to 0} \frac{\sin(\pi u)}{u}$$

which can be shown to be 1. I leave the discovery of the proof to you and the
internet.

### Duty cycle

* We define the duty cycle $\eta = 2t_0/T$ of the rectangular pulse train as the
fraction of the time the signal is "on" (equal to 1) over one period.
* The duty cycle is often given as a percentage.

The spectral coefficients expressed using the normalized sinc function and the
duty cycle can be written as

$$C_k = \frac{2t_0}{T}\frac{\sin\left(\frac{\pi k2t_0}{T}\right)}{\frac{\pi
k2t_0}{T}}=\frac{2t_0}{T}\operatorname{sinc}\left(\frac{k2t_0}{T}\right)$$

$$C_k = \eta \operatorname{sinc}\left(k\eta\right)$$

### Normalize the spectral coefficients

Let us normalize the spectral coefficients of $\tilde x(t)$ by mutiplying them
by $T$, and assume $t_0$ is fixed so that the duty cycle $\eta = 2t_0/T$ will
decrease as we increase $T$:

$$T C_k = T\eta \operatorname{sinc}\left(k\eta\right)=2t_0\operatorname{sinc}\le
ft(k\frac{2t_0}{T}\right)$$

Then the normalized coefficents $T C_k$ of the rectangular wave a sinc envelope
with constant amplitude at the origin equal to $2t_0$, and a zero crossing at
fixed frequency $\pi/t_0$ rad/s, both independent of T.

Plots follow (use [duty_cycle.m](files/matlab/duty_cycle.m) to reproduce).

### Durty cycle 50%

<img src="files/pictures/dc_point5.png">

### Duty cycle 12.5%

<img src="files/pictures/dc_12point5.png">

### Comments

* As the fundamental period increases, we get more spectral lines packed into
the lobes of the sinc envelope.
* These normalized spectral coefficients turn out to be samples of the
continuous sinc function on the spectrum of $\tilde{x}(t)$
* The two spectra are plotted against the frequency variable $k\omega_0$ with
units of rad/s rather than index of harmonic component
* The first zeros of each side of the main lobe are at frequencies $\omega = \pm
\pi/t_0$ rad/s
* The zero-crossing points of sinc envelope are independent of the period T.
They only depend on $t_0$.

### Intuition leading to the Fourier Transform

* An aperiodic signal that has been made periodic by "repeating" its graph every
$T$ seconds will have a line spectrum that becomes more and more dense as the
fundamental period is made longer and longer.
* The line spectrum has the same continuous envelope.
* As $T$ goes to infinity, the line spectrum will become a continuous function
of $\omega$.
* The *envelope* is this function.

### Doing the Maths

Fourier series coefficients for the rectangular wave are computed using:

$$C_k = \frac{1}{T}\int_{-t_0}^{t_0} \tilde{x}(t) e^{-jk(\omega_0 t)}\,dt $$

where $\omega_0 = 2\pi/T$ as usual.

Now define a signal $x(t)$ as a signal equal to $\tilde{x}(t)$ over one period
and zero elsewhere.

<img src="files/pictures/pulse.png">

### A rectangular pulse

The aperiodic signal, a single rectangular pulse, can be thought of as being
periodic with an infinite fundamental period (we will let $T\to +\infty$ later).

Since $\tilde{x}(t)=x(t)$ over $t \in [-T/2,T/2]$, the spectral coefficients
$C_k$ of the periodic signal $\tilde{x}(t)$ can be written in terms of the
aperiodic signal $x(t)$ as follows:

$$C_k = \frac{1}{T}\int_{-\infty}^{+\infty}x(t)e^{-jk\omega_0 t} dt.$$

Let us define the envelope $X(j\omega)$ of $T C_k$ (we already know this to be
the sinc function):

$$X(j\omega):= \int_{-\infty}^{+\infty}x(t)e^{-j\omega t} dt =
\int_{-t_0}^{+t_0}e^{-j\omega t} dt =
2t_0\operatorname{sinc}\left(\frac{t_0}{\pi}\omega\right).$$

The coefficients $C_k$ are therefore samples of the continuous envelope
$X(j\omega)$:

$$C_k = \frac{1}{T}X(jk\omega_0).$$

### Back to the periodic signal

$\tilde{x}(t)$ has the Fourier series representation

$$\tilde{x}(t) = \sum_{k=-\infty}^{\infty}\frac{1}{T}X(jk\omega_0)e^{jk\omega_0
t}.$$

or equivalently, since $\omega_0 = 2\pi/T$:

$$\tilde{x}(t) = \frac{1}{2\pi}
\sum_{k=-\infty}^{\infty}X(jk\omega_0)e^{jk\omega_0 t}\omega_0.$$


### Now take the limits

At the limit, as $T\to \infty$, in

$$\tilde{x}(t) = \frac{1}{2\pi} \sum_{k=-\infty}^{\infty}
X(jk\omega_0)e^{jk\omega_0 t}\omega_0.$$

we get

* $\omega_0 \to d\omega$ &ndash; the fundamental frequency becomes
infinitesimally small.
* $k\omega_0 \to \omega$ &ndash; harmonic frequencies get so close together they
become a continuum.
* The summation becomes an integral.
* $\tilde{x}(t) \to x(t)$ &ndash; the periodic signal tends to the aperiodic
signal.

### Define the Inverse Fourier and Fourier Transform

Putting these elements together we have an expression for the aperiodic signal
in terms of its Fourier transform:

**Inverse Fourier Transform**:

$$x(t) = \frac{1}{2\pi} \int_{-\infty}^{\infty} X(j\omega)e^{j\omega t}\,d\omega
:= \mathcal{F}^{-1} \left\{X(j\omega)\right\}$$

Similarly, given the expression we have already seen for an arbitrary $x(t)$:

**Fourier Transform**:

$$X(j\omega) = \int_{-\infty}^{\infty}x(t)e^{-j\omega t}\,dt :=
\mathcal{F}\left\{x(t)\right\}.$$

### Fourier Transform Pair

* The two equations on the previous slide are called the *Fourier transform
pair*.
* They are analogous to the *Laplace transform pair* we have already seen and we
can develop tables of properties and transform pairs in the same way.
* Equation $X(j\omega) = \int_{-\infty}^{\infty}x(t)e^{-j\omega t}\,dt.$ gives
the *Fourier transform* or the *frequency spectrum* of the signal $x(t)$.
* Equation $x(t) = \frac{1}{2\pi} \int_{-\infty}^{\infty} X(j\omega)e^{j\omega
t}\,d\omega.$ is the *inverse Fourier transform*. It gives the function of time
that has a given spectrum in the frequency domain.

## Special Forms of the Fourier Transform

The table on the next slide is developed in Section 8.2 of Karris by assuming
that in general both $f(t)$ and $F(j\omega)$ are complex. So that:

$$f(t) = \Re\left\{f(t)\right\} + j\Im\left\{f(t)\right\} = f_{\mathrm{Re}}(t) +
j\, f_{\mathrm{Im}}(t)$$

The Fourier transform can therefore be rewritten

$$F(j\omega) = \int_{-\infty}^{\infty}f_{\mathrm{Re}}(t)e^{j\omega t}\,dt +
j\int_{-\infty}^{\infty}\, f_{\mathrm{Im}}(t)e^{j\omega t}\,dt$$

which by Euler's identity becomes

$$F(j\omega) = \int_{-\infty}^{\infty}\left[f_{\mathrm{Re}}(t)\cos\omega t +
f_{\mathrm{Im}}(t)\sin\omega t\right]\,dt -
j\int_{-\infty}^{\infty}\left[f_{\mathrm{Re}}(t)\sin\omega t -
f_{\mathrm{Im}}(t)\cos\omega t\right]\,dt$$

So the Real and Imaginary parts of $F(j\omega)$ are

$$F_\mathrm{Re}(j\omega) =
\int_{-\infty}^{\infty}\left[f_{\mathrm{Re}}(t)\cos\omega t +
f_{\mathrm{Im}}(t)\sin\omega t\right]\,dt$$

$$F_\mathrm{Im}(j\omega) = -
\int_{-\infty}^{\infty}\left[f_{\mathrm{Re}}(t)\sin\omega t -
f_{\mathrm{Im}}(t)\cos\omega t\right]\,dt$$

We can do a similar analysis for the inverse Fourier transform.

### Time Domain and Frequecy Domain Correspondence


By consideration of the Real and Imaginary parts of $f(t)$ and $F(j\omega)$ we
can construct the following table. See Sections **8.2.1 Real-Time Functions**
and **8.2.2 Imaginary Time Functions** which shows the summarizes the *nature*
of the Fourier transform for particular types of the signal.

<html>
<table>
<thead>
<tr>
<thead>
    <tr><td rowspan="2" style="text-align: center;">$f(t)$</td><td colspan="5"
style="text-align: center;">$F(j\omega)$</td></tr>
    <tr><td>Real</td><td>Imaginary</td><td>Complex</td><td>Even</td><td>Odd</td>
</tr>
</thead>
<tbody>
<tr><td>Real</td><td>&nbsp;</td><td>&nbsp;</td><td>√</td><td>&nbsp;</td><td>&nbs
p;</td></tr>
<tr><td>Real and
Even</td><td>√</td><td>&nbsp;</td><td>&nbsp;</td><td>√</td><td>&nbsp;</td></tr>
<tr><td>Real and
Odd</td><td>&nbsp;</td><td>√</td><td>&nbsp;</td><td>&nbsp;</td><td>√</td></tr>
<tr><td>Imaginary</td><td>&nbsp;</td><td>&nbsp;</td><td>√</td><td>&nbsp;</td><td
>&nbsp;</td></tr>
<tr><td>Imaginary and
Even</td><td>&nbsp;</td><td>√</td><td>&nbsp;</td><td>√</td><td>&nbsp;</td></tr>
<tr><td>Imaginary and
Odd</td><td>√</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>√</td></tr>
</tbody>
</table>
</html>

### A useful consequence for f(t) real

If $f(t)$ is real (even or odd), the real part of $F(j\omega)$ is even, and the
imaginary part is odd.

Then, for $f(t)$ real:

$$F_\mathrm{Re}(-j\omega)=F_\mathrm{Re}(j\omega)$$

and

$$F_\mathrm{Im}(-j\omega)=-F_\mathrm{Im}(j\omega)$$

Since

$$F(j\omega) = F_\mathrm{Re}(j\omega)+jF_\mathrm{Im}(j\omega)$$

it follows that

$$F(-j\omega) = F_\mathrm{Re}(-j\omega)+jF_\mathrm{Im}(-j\omega) =
F_\mathrm{Re}(j\omega)-jF_\mathrm{Im}(j\omega)$$

or

$$F(-j\omega) = F^*(j\omega)$$


## Properties of the Fourier Transform

Again, we will provide any properties that you might need in the examination.

For fun, you may like to read and even complete the proofs for these properties
guided by the text books Karris (Section 8.3) or Boulet pp 180&mdash;185.

We are more interested in your ability to exploit the properties in problem
solving.

A little more detail is given in the notes available on Blackboard.

### Linearity

The Fourier transform is a linear operation:

$$a_1f_1(t)+a_2f_2(t)+\cdots+a_nf_n(t)\Leftrightarrow
a_1F_1(j\omega)+a_2F_2(j\omega)+\cdots+a_nF_n(j\omega)$$

### Symmetry

If $F(j\omega)$ is the Fourier transform of $f(t)$, the *symmetry property of
the Fourier transform* states that

$$F(t)\Leftrightarrow2\pi f(-j\omega)$$

That is if in $F(j\omega)$ we replace $j\omega$ with $t$, we obtain this pair.

### Time/Frequency Scaling

Scaling the time variable with $\alpha  \in \mathbb{R}$ either expands or
compresses the Fourier transform:

$$f(\alpha t)\Leftrightarrow
\frac{1}{|\alpha|}F\left(j\frac{\omega}{\alpha}\right)$$

* For $\alpha > 0$, the signal $f(\alpha t)$ is sped up (or compressed in time),
so its frequency components will be expanded to higher frequencies.
* For $\alpha < 0$, the signal $f(\alpha t)$ is slowed down (or expanded in
time), so its frequency components will be compressed to lower frequencies.

### Time Shifting

A time shift results in a phase shift in the Fourier transform

$$f(t-t_0) \Leftrightarrow e^{-j\omega_0}F(j\omega)$$

where $\omega_0 = 2\pi/t_0$

### Frequency Shifting

Multiplying a time function by a complex exponential resuls in a frequency shift

$$e^{j\omega 0}f(t) \Leftrightarrow X(j\omega-j\omega_0)$$



### Time Differentiation

If $F(j\omega)$ is the Fourier transform of $f(t)$

$$\frac{d^n}{dt^n}\,f(t)\Leftrightarrow (j\omega)^nF(j\omega)$$

### Frequency Differentiation

If $F(j\omega)$ is the Fourier transform of $f(t)$

$$(-jt)^n f(t)\Leftrightarrow \frac{d^n}{d\omega^n}F(j\omega)$$

### Time Integration

If $F(j\omega)$ is the Fourier transform of $f(t)$

$$\int_{-\infty}^{t}f(\tau)d\tau \Leftrightarrow \frac{F(j\omega)}{j\omega}+\pi
F(0)\delta(\omega)$$

### Conjugate Time and Frequency Functions

If $F(j\omega)$ is the Fourier transform of the complex function $f(t)$

$$f^*(t)\Leftrightarrow F^*(-j\omega)$$

### Time Convolution

$$f_1(t)*f_2(t) \Leftrightarrow F_1(j\omega) F_2(j\omega)$$

That is convolution in the time domain corresponds to multiplication in the
frequency domain.

(Compare with Laplace Transform)

### Frequency Convolution

$$f_1(t)f_2(t) \Leftrightarrow \frac{1}{2\pi} F_1(j\omega)*F_2(j\omega)$$

That is, multiplication in the time domain corresponds to convolution in the
frequency domain.

This also has application to amplitude modulation as shown in Boulet pp
182&mdash;183.


### Area under f(t)

$$\int_{-\infty}^{\infty} f(t)\,dt = F(0)$$

That is, the area under a time function $f(t)$ is equal to the value of the
Fourier transform of $f(t)$ evaluated at $\omega = 0$ rad/s.

### Area under F(jomega)

$$f(0) = \frac{1}{2\pi}\int_{-\infty}^{\infty} F(j\omega)\,d\omega$$

That is, the value of a time function, $f(t)$, evaluated at $t=0$ is equal to
the area under its Fourier transform $F(j\omega)$ times $1/2\pi$.

### Energy-Density Spectrum

Recalling that the power spectrum of a periodic signal is defined as the squared
magnitudes of its Fourier series coefficients. A plot of the power spectrum of a
signal gives us an idea of the power at different frequencies (harmonics).

By analogy, the *energy-density spectrum* of an aperiodic signal is defined as
the magnitude squared of its spectrum; that is $|F(j\omega)|^2$ is the energy-
density spectrum of $f(t)$.

For example

$$E_{[\omega_1,\omega_2]}:=\frac{1}{2\pi}\int_{\omega_1}^{\omega_2}|F(j\omega)|^
2\,d\omega.$$

Note that for real signals, it is customary to include the negative frequency
band as well.

### Parseval's Theorem

Just like the total average power of a periodic signal is equal to the sume of
the powers of all the harmonics, the total energy in an aperidic signal is equal
to the total energy in its sepctrum.

This is the Parseval equality for Fourier transforms:

$$\int_{-\infty}^{\infty}|f(t)|^2\,dt=\frac{1}{2\pi}\int_{-\infty}^{\infty}|F(j\
omega)|^2\,d\omega.$$

## Table of Properites of the Fourier Transform

As was the case of the Laplace Transform, properties of Fourier transforms are
usually summarized in Tables of Fourier Transform properties. For example this
one: [Properties of the Fourier Transform (Wikpedia)](http://en.wikipedia.org/wi
ki/Fourier_transform#Properties_of_the_Fourier_transform) and Table 8.8 in
Karris (page 8-17).

More detail and some commentry is given in the printable version of these notes.

<table>
<thead>
<tr><td></td><td>**Name**</td><td>$f(t)$</td><td>$F(j\omega)$</td><td>**Remarks*
*</td></tr>
<thead>
<tbody>
<tr><td>1</td><td>Linearity</td><td>$a_1f_1(t)+a_2f_2(t)+\cdots+a_nf_n(t)$</td><
td>$a_1F_1(j\omega)+a_2F_2(j\omega)+\cdots+a_nF_n(j\omega)$</td><td>Fourier
transform is a linear operator.</td></tr>
<tr><td>2</td><td>Symmetry</td><td>$2\pi
f(-j\omega)$</td><td>$F(t)$</td><td></td></tr>
<tr><td>3.</td><td>Time and frequency scaling</td><td>$f(\alpha t)$</td><td>$$\f
rac{1}{|\alpha|}F\left(j\frac{\omega}{\alpha}\right)$$</td><td>time compression
is frequency expansion and *vice versa*</td></tr>
<tr><td>4.</td><td>Time shifting</td><td>$$f(t-t_0)$$</td><td>$$e^{-j\omega
t_0}F(j\omega)$$</td><td>A time shift corresponds to a phase shift in frequency
domain</td></tr>
<tr><td>5.</td><td>Frequency shifting</td><td>$$e^{j\omega_0
t}f(t)$$</td><td>$$F(j\omega-j\omega_0)$$</td><td>Multiplying a signal by a
complex exponential results in a frequency shift.</td></tr>
<tr><td>6.</td><td>Time differentiation</td><td>$$\frac{d^n}{dt^n}\,f(t)$$</td><
td>$$(j\omega)^nF(j\omega)$$</td><td></td></tr>
<tr><td>7.</td><td>Frequency differentiation</td><td>$$(-jt)^n
f(t)$$</td><td>$$\frac{d^n}{d\omega^n}F(j\omega)$$</td><td></td></tr>
<tr><td>8.</td><td>Time integration</td><td>$$\int_{-\infty}^{t}f(\tau)d\tau$$</
td><td>$$\frac{F(j\omega)}{j\omega}+\pi F(0)\delta(\omega)$$</td><td></td></tr>
<tr><td>9.</td><td>Conjugation</td><td>$$f^*(t)$$</td><td>$$F^*(-j\omega)$$</td>
<td></td></tr>
<tr><td>10.</td><td>Time
convolution</td><td>$$f_1(t)*f_2(t)$$</td><td>$$F_1(j\omega)
F_2(j\omega)$$</td><td>Compare with Laplace Transform</td></tr>
<tr><td>11.</td><td>Frequency
convolution</td><td>$$f_1(t)f_2(t)$$</td><td>$$\frac{1}{2\pi}
F_1(j\omega)*F_2(j\omega)$$</td><td>This has application to amplitude modulation
as shown in Boulet pp 182&mdash;183.</td></tr>
<tr><td>12.</td><td>Area under $f(t)$</td><td>$$\int_{-\infty}^{\infty} f(t)\,dt
= F(0)$$</td><td></td><td>Way to calculate DC (or average) value of a
signal</td></tr>
<tr><td>13.</td><td>Area under $F(j\omega)$</td><td>$$f(0) =
\frac{1}{2\pi}\int_{-\infty}^{\infty}
F(j\omega)\,d\omega$$</td><td></td><td></td></tr>
<tr><td>14.</td><td>Energy-Density Spectrum</td><td>$$E_{[\omega_1,\omega_2]}:=\
frac{1}{2\pi}\int_{\omega_1}^{\omega_2}|F(j\omega)|^2\,d\omega.$$</td><td></td><
td></td></tr>
<tr><td>15.</td><td>Parseval's theorem</td><td>$$\int_{-\infty}^{\infty}|f(t)|^2
\,dt=\frac{1}{2\pi}\int_{-\infty}^{\infty}|F(j\omega)|^2\,d\omega.$$</td><td></t
d><td>Definition RMS follows from this</td></tr>
</tbody>
</table>

See also: [Wikibooks: Engineering Tables/Fourier Transform Properties](http://en
.wikibooks.org/wiki/Engineering_Tables/Fourier_Transform_Properties) and
[Fourier Transfom&mdash;WolframMathworld](http://mathworld.wolfram.com/FourierTr
ansform.html) for more complete references.


## Examples

1. Amplitude Modulation
2. Impulse response
3. Energy computation

### Example 1: Amplitude Modulation

Compute the result of multiplying a signal $f(t)$ by a carrier waveform $\cos
\omega_c t$.

*Hint* use Euler's identity and the frequency shift property

### Solution 1

$$\cos\omega_c t = \frac{e^{j\omega_c t}+e^{-j\omega_c t}}{2}$$

it follows from the *frequency shifting* property that

$$f(t)\cos\omega_c t \Leftrightarrow \frac{F(j\omega-j\omega_c)+F(j\omega +
j\omega_c)}{2}.$$

Similarly

$$f(t)\sin\omega_c t \Leftrightarrow \frac{F(j\omega-j\omega_c)-F(j\omega +
j\omega_c)}{j2}.$$

### Remarks

We can also tackle this using the Frequency Convolution property. See Boulet pp
182&mdash;183.

### Example 2: Impulse response

A system has impulse response $f(t) = e^{-t}u_0(t)$. Compute the frequency
sprectrum of this system.

### Solution 2

$$\begin{gathered}
  \mathcal{F}\left\{ {{e^{ - t}}{u_0}(t)} \right\} &=& \int_0^\infty  {{e^{ -
t}}} {e^{ - j\omega t}}\;dt \\
   &=& \int_0^\infty  {{e^{ - (1 + j\omega )t}}} \;dt \\
   &=&  - \frac{1}{{j\omega  + 1}}\left[ {{e^{ - (1 + j\omega )t}}}
\right]_0^\infty  =  - \frac{1}{{j\omega  + 1}}\left[ {0 - 1} \right] \\
  F(j\omega ) &=& \frac{1}{{j\omega  + 1}} \\
\end{gathered} $$

Thus

$$e^{ - t}{u_0}(t)\Leftrightarrow \frac{1}{{j\omega  + 1}}$$

### Example 3: Energy computation

An aperiodic real signal $f(t)$ has Fourier transform $F(j\omega)$. Compute the
energy contained the signal between 5kHz and 10kHz.

### Solution 3

Use the Energy-Density function.

$$E_{[10,000\pi,20,000\pi]}^r=\frac{1}{2\pi}\left[\int_{10,000\pi}^{20,000\pi}|X
(j\omega)|^2\,d\omega +
\frac{1}{2\pi}\int_{-20,000\pi}^{-10,000\pi}|X(j\omega)|^2\,d\omega\right] =
\frac{1}{\pi}\int_{10,000\pi}^{20,000\pi}|X(j\omega)|^2\,d\omega.$$

## Computing Fourier Transforms in Matlab

MATLAB has the built-in **fourier** and **ifourier** functions that can be used
to compute the Fourier transform and its inverse. We will explore some of thes
in the next lab.

For now, here's an example:

### Example

Use Matlab to confirm the Fourier transform pair:

$$e^{-\frac{1}{2}t^2}\Leftrightarrow \sqrt{2\pi}e^{-\frac{1}{2}\omega^2}$$

See script: [ftex1.m](files/matlab/ftex1.m).

## End of Part 1

*Summary*

* Fourier Transform as the Limit of a Fourier Series
* Doing the Maths
* Special forms of the Fourier Transform
* Properties of the Fourier Transform
* Computing Fourier Transforms in Matlab

*Next Time*

* [Fourier transform of commonly occuring signals](http://nbviewer.ipython.org/g
ithub/cpjobling/EG-247-Resources/blob/master/week7/ft1.ipynb)
([Slides](http://cpjobling.github.io/EG-247-Resources/week7/ft1.slides.html))
