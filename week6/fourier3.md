
# Fourier Series (Part 3)

Dr Chris Jobling ([c.p.jobling@swansea.ac.uk](mailto:c.p.jobling@swansea.ac.uk))

Digital Technium 123

Office Hours: 12:00-13:00 Mondays

You can view the notes for this presentation in [HTML](http://cpjobling.github.io/EG-247-Resources/week6/fourier3.html
  ) and [PDF](http://cpjobling.github.io/EG-247-Resources/week6/fourier3.pdf).

  The source code of this presentation is available in Markdown format from GitHub: [fourier3.md](https://github.com/cpjobling/EG-247-Resources/tree/master/week6/fourier3.md).

The GitHub repository [EG-247 Resources](https://github.com/cpjobling/EG-247-Resources)
also contains the source code for all the Matlab/Simulink
examples and the Laboratory Exercises.

## Agenda

*Last time*

* Exponents and Euler's Equation
* The Exponential Fourier series
* Symmetry in Exponential Fourier Series
* Example

*This Time*

* Line spectra
* Power in periodic signals
* Steady-state response of an LTI system to a periodic signal

## Scope and Background Reading

This session concludes our introduction to Fourier Series.

Last time we saw that we could exploit the complex exponential $e^{j\omega t}$
to redefine trigonometric Fourier Series into the Exponential Fourier Series and
in so doing we eliminate one integration and at the same time simplify the
calculation of the coefficients of the Fourier series.

In this session we show how the Exponential form of the Fourier Series leads us
to the ability to present waveforms as line spectra, simplifies the calculation
of power for systems with harmonics and leads in the limit as the $T$ approaches
infinity to the Fourier Transform.

----

The material in this presentation and notes is based on Chapter 7 (Starting at
Section 7.10) of [Steven T. Karris, Signals and Systems: with Matlab Computation
and Simulink Modelling, 5th
Edition.](http://site.ebrary.com/lib/swansea/docDetail.action?docID=10547416)
from the Required Reading List. Some clarification was needed and I used
Chapter 4 of [Benoit Boulet, Fundamentals of Signals and
Systems](http://site.ebrary.com/lib/swansea/docDetail.action?docID=10228195)
from the Recommended Reading List for this.

# Line Spectra

## Line Spectra

When the Exponential Fourier series are known is is useful to plot the amplitude
and phase of the harmonics on a frequency scale.

The next slide shows the spectrum of the Exponential Fourier Series calculated for the square wave.

----

![Spectrum of the Exponential Fourier Series for a Square Wave](pictures/efs_sqw.png)

## Line Spectra for Trig. FS

If we take the results for the Exponential Fourier Series and gather terms, the
amplitudes for the Trig. Fourier Series are given by:

$$a_0 = 2C_0$$

$$a_1 = (C_k + C_{-k})$$

$$b_k = j(C_k - C_{-k})$$

Applying this to the previous result we get the next slide

----

![Line spectra for trig. FS](pictures/line-spec.png)

## Example 1

Compute the exponential Fourier series for the waveform shown below and plot its
line spectra.

![Example 1](pictures/pulse_train.png)

## Solution

The recurrent rectangular pulse is used extensively in digital communication
systems. To determine how faithfully such pulses will be transmitted, it is
necessary to know the frequency components.

**What do we know?**

* The pulse duration is $T/w$.
* The recurrence interval $T$ is $w$ times the pulse duration.
* $w$ is the ratio of pulse repetition time to the pulse duration &ndash;
normally called the *duty cycle*.

## Coefficients of the Exponential Fourier Series?

Given

$$C_k = \frac{1}{2\pi}\int_{-\pi}^{\pi} f(t)e^{-jk(\omega t)}\,d(\omega t)$$

* Is the function **even** or **odd**?
* Does the signal have **half-wave symmetry**?
* What are the consequences of symmetry on the form of the coefficients $C_k$?
* What function do we actually need to integrate to compute $C_k$?

## Answers

Given

$$C_k = \frac{1}{2\pi}\int_{-\pi}^{\pi} f(t)e^{-jk(\omega t)}\,d(\omega t)$$

* Is the function **even** or **odd**? **even** $f(t) = f(-t)$!
* Does the signal have **half-wave symmetry**? No!
* What are the consequences of symmetry on the form of the coefficients $C_k$?
**$C_k$ will be real values. Trig. equivalent no sine terms.**
* What function do we actually need to integrate to compute $C_k$?

----

We only need
to integrate between the limits $-\pi/w \to \pi/w$

$$C_k = \frac{1}{2\pi}\int_{-\pi/w}^{\pi/w} Ae^{-jk(\omega t)}\,d(\omega t) =
\frac{A}{2\pi}\int_{-\pi/w}^{\pi/w} e^{-jk(\omega t)}\,d(\omega t) $$

## DC Component?

Let $k = 0$ then perform the integral

<div class="notes">
## DC component!

$$C_0 = \left.\frac{A}{2\pi}\,t\,\right|_{-\pi/w}^{\pi/w} =
\frac{A}{2\pi}\left(\frac{\pi}{w}+\frac{\pi}{w}\right)$$

or

$$C_0 = \frac{A}{w}$$
</div>

## Harmonic coefficients?

Integrate for $k\ne 0$

<div class="notes">
## Harmonic coefficients!

$$C_k = \left.\frac{A}{-jk2\pi}\,e^{-jk(\omega t)}\,\right|_{-\pi/w}^{\pi/w} =
\frac{A}{k\pi}\left(\frac{e^{jk\pi/w}-e^{-jk\pi/w}}{j2}\right) =
\frac{A}{k\pi}\sin\left(\frac{k\pi}{w}\right)$$

$$C_k = \frac{A}{w}\frac{sin\left(k\pi/w\right)}{k\pi/w}$$
</div>

## Exponential Fourier Series?

<div class="notes">
## Exponential Fourier Series!

$$f(t)=\sum_{k=-\infty}^{\infty}\;\frac{A}{w}\,\frac{\sin\left(k\pi/w\right)}{k\pi/w} e^{-k\omega t}$$
</div>
## Results

$$C_0 = \frac{A}{w}$$

$$C_k = \frac{A}{w}\frac{sin\left(k\pi/w\right)}{k\pi/w}$$

$$f(t)=\sum_{k=-\infty}^{\infty}\;\frac{A}{w}\,\frac{\sin\left(k\pi/w\right)}{k\pi/w} e^{-k\omega t}$$


## Effect of pulse width on frequency spectra

* Recall pulse width = $T/w$

## w = 2

$\omega = 1$ rad/s; $w = 2$; $T = 2\pi$ s; $T/w = \pi$ s.

![Sinc function for $w=5$](pictures/sinc2.png)

## w = 5

$\omega = 1$ rad/s; $w = 5$; $T = 2\pi$ s; $T/w = 2\pi/5$ s.

![Sinc function for $w=5$](pictures/sinc5.png)

## w = 10

$\omega = 1$ rad/s; $w = 10$; $T = 2\pi$ s; $T/w = \pi/5$ s.

![Sinc function for $w=10$](pictures/sinc10.png)

## Observations

* As the width of the pulse **reduces** the width of the frequency spectra needed
to fully describe the signal **increases**
* more bandwidth is needed to transmit the pulse.

<div class="notes">
**Note**

Text book seems to get the wrong results. Karris plots $\sin(wx)/(wx)$ rather
than $\sin(x/w)/(x/w)$ in producing the diagrams shown in Figs. 7.36&mdash;7-38.

However, if you view $\sin(wx)/wx$ as in indication of the bandwidth needed to
transmit a pulse of width $T/w$ the plots Karris gives make more sense.
</div>

## Example 2

Use the result of Example 1 to compute the exponential Fourier series of the
impulse train $\delta(t\pm 2\pi k)$ shown below

![Example 2](pictures/impulse_train.png)

## Solution

To solve this we take the previous result and choose amplitude (height) $A$ so
that area of pulse is unity. Then we let width go to zero while maintaining the
area of unity. This creates a train of impulses $\delta(t\pm 2\pi k)$.

$$C_n  = \frac{1}{2\pi}$$

and, therefore

$$f(t) = \frac{1}{2\pi}\sum_{k=-\infty}^{\infty} e^{jk\omega t}$$

Try it!

<div class="notes">

From the previous result,

$$C_n = \frac{A}{w}.\frac{\sin(k\pi/w)}{k\pi/w}$$

and the pulse width was defined as $T/w$, that is

$$\frac{T}{w}=\frac{2\pi}{w}$$

Let us take the previous impulse train as a recurrent pulse with amplitude

$$A = \frac{1}{T/w} = \frac{1}{2\pi/w} = \frac{w}{2\pi}.$$

#### Pulse with unit area

The area of each pulse is then

$$\frac{2\pi}{w}\times\frac{w}{2\pi} = 1$$

and the pulse train is as shown on the next slide:

----

![Pulses with unit area](pictures/unit_area_pulses.png)

#### New coefficients

The coefficients of the Exponential Fourier Series are now:

$$C_n = \frac{w/2\pi}{w}\frac{\sin(k\pi/w)}{k\pi/w} =
\frac{1}{2\pi}\frac{\sin(k\pi/w)}{k\pi/w}$$

and as $\pi/w \to 0$ each recurrent pulse becomes a unit impulse, and the pulse
train reduces to a unit impulse train.

----

Also, recalling that

$$\lim_{x\to 0} \frac{sin x}{x} = 1$$

the coefficients reduce to

$$C_n = \frac{1}{2\pi}$$

That is all coefficients have the same amplitude and thus

$$f(t) = \frac{1}{2\pi}\sum_{n=-\infty}^{\infty} e^{jk\omega t}$$

</div>

## Spectrum of Unit Impulse Train

The line spectrum of a sequence of unit impulses $\delta(t \pm kT)$ is shown
below:

![Spectrum of unit pulse train](pictures/impulse_spectrum.png)

## Another Interesting Result

Consider the pulse train agin:

![Another interesting result](pictures/pulse_train.png)

What happens when the pulses to the left and right of the centre pulse become
less and less frequent? That is what happens when $T \to \infty$?

## Well?

* As $T\to \infty$ the fundamental frequency $\omega \to 0$
* We are then left with just one pulse centred around $t=0$.
* The frequency difference between harmonics also becomes smaller.
* Line spectrum becomes a continuous function.

This result is the basis of the *Fourier Transform* which is coming next.

# Power in Periodic Signals

## Power in Periodic Signals

In your previous courses you may have come across the definitions of Signal
Energy, Average Signal Power and Root Mean Square Power:

$$E = \int_0^T |f(t)|^2 dt$$

$$P_{\mathrm{av}} = \frac{1}{T}\int_0^T |f(t)|^2 dt$$

$$P_{\mathrm{RMS}} = \sqrt{\frac{1}{T}\int_0^T |f(t)|^2 dt}$$

## Parseval's Theorem

[Parseval's Theorem](http://en.wikipedia.org/wiki/Parseval's_theorem) states
that the total average power of a periodic signal $f(t)$ is equal to the sum
of the average powers of all its harmonic components.

----

The power in the $k$th harmonic $C_ke^{jk\omega t}$ is given by

$$P_k = \frac{1}{T}\int_0^T\left|C_ke^{jk\omega t}\right|^2\,dt =
\frac{1}{T}\int_0^T\left|C_k\right|^2\,dt=\left|C_k\right|^2$$

Since $P_k = P_{-k}$, the total power of the $k$th harmonic is $2P_k$.

Parseval's theorem states that

$$P = \frac{1}{T}\int_0^T \left|f(t)\right|^2\,dt =
\sum_{k=-\infty}^{\infty}\left|C_k\right|^2.$$

## RMS Power

By a similar argument:

$$P_{\mathrm{RMS}} = \sqrt{\frac{1}{T}\int_0^T \left|f(t)\right|^2\,dt} =
\sqrt{\sum_{k=-\infty}^{\infty}\left|C_k\right|^2}.$$


## Example 3

Compute the average power of a pulse train for which the pulse width is $T/2$
(duty cycle 50%). Use the previous result:

$$C_n = \frac{A}{w}.\frac{\sin(k\pi/w)}{k\pi/w}$$

as your starting point.

<div class="notes">

### Solution 3

$w = 2$ so:

$$C_n = \frac{A}{2}.\frac{\sin(k\pi/2)}{k\pi/2}$$

Write down an expression for $P$ using Parseval's Theorem


#### P

$$P = \sum\limits_{k =  - \infty }^\infty  {{{\left| {{C_k}} \right|}^2}}  =
\sum\limits_{k =  - \infty }^\infty  {{{\left| {\frac{A}{2}{\mathop{\rm
sinc}\nolimits} \frac{{k\pi }}{2}} \right|}^2}}  = {A^2}\left( {\frac{1}{4} +
2\sum\limits_{k = 1}^\infty  {{{\left| \frac{1}{4}{{\mathop{\rm sinc}\nolimits}
\frac{{k\pi }}{2}} \right|}^2}} } \right)$$

sinc$(k\pi/2) = 0$ for $k$ even ($k=0,2,4,6,\ldots$) so...?

#### P for k odd

$$P = {A^2}\left( {\frac{1}{4} + \frac{1}{2}\sum\limits_{k = 1,3,5, \ldots
}^\infty  {{{\left| {{\mathop{\rm sinc}\nolimits} \frac{{k\pi }}{2}}
\right|}^2}} } \right) = {A^2}\left( {\frac{1}{4} + \frac{1}{2}\sum\limits_{k =
1,3,5, \ldots }^\infty  {{{\left| {\frac{{\sin \frac{{k\pi }}{2}}}{{\frac{{k\pi
}}{2}}}} \right|}^2}} } \right)$$

$\sin(k\pi/2) = 1$ for $k$ odd ($k=1,3,5,7,\ldots$) so...?

#### P after eliminating sine

$$P = {A^2}\left( {\frac{1}{4} + \frac{2}{{{\pi ^2}}}\sum\limits_{k = 1,3,5,
\ldots }^\infty  {\left[ {1 + \frac{1}{9} + \frac{1}{{25}} +  \ldots } \right]}
} \right) = {A^2}\left( {\frac{1}{4} + \frac{2}{{{\pi ^2}}}\left[ {\frac{{{\pi
^2}}}{8}} \right]} \right)$$

$$P = \frac{A^2}{2}$$

#### Check P from f(t)

$$P = \frac{1}{2\pi}\int_{-\pi/2}^{\pi/2}|f(t)|^2\,d\omega t =
\frac{1}{2\pi}\int_{-\pi/2}^{\pi/2}|A|^2\,d\omega t =
\frac{A^2}{2\pi}\left(\frac{\pi}{2}+\frac{\pi}{2}\right) = \frac{A^2}{2}.$$

</div>

## Power Spectrum

The *power spectrum* of signal is the sequence of average powers in each complex
harmonic: $|C_k|^2$. For real periodic signals
the power spectrum is a real even sequence as $|C_{-k}|^2 = |C_k^*|^2 =
|C_k|^2$.

----

This is the power spectrum for a pulse with width $T/8$.

![Power spectrum](pictures/power.png)

<div class="notes">
Note that most of the power is concentrated at DC and in the first seven
harmonic components. That is in the frequency range $[-14\pi/T,+14\pi/T]$ rad/s.
</div>

## Total Harmonic Distortion

Suppose that a signal that is supposed to be a pure sine wave of amplitude A is
distorted as shown below

![Total harmonic distortion](pictures/thd.png)


This can occur in the line voltages of an industrial plant that makes heavy use
of nonlinear loads such as electric arc furnaces, solid state relays, motor
drives, etc (E.g. Tata Steel!)

## THD Defined

Clearly, some of the harmonics for $k\ne \pm 1$ are nonzero. One way to
characterize the distortion is to compute the ratio of average power in all the
harmonics that "should not be present", that is for $k > 1$, to the total
average power of the distorted sine wave. The square-root of this ratio is
called the *total harmonic distortion* (THD) of the signal.

----

If the signal is real and based on a sine wave (that is *odd*), then $C_0=0$ and

$$f_{\mathrm{RMS}}=\sqrt{\sum_{k=1}^{\infty}2|C_k|^2}$$

and we can define the THD as the ratio of the RMS value for all the harmonics
for $K>1$ (the distortion) to the RMS of the fundamental which is
$\sqrt{2\left|C_1\right|^2}:$

$${\text{THD}} = 100\sqrt {\frac{{\sum\limits_{k = 2}^\infty  {{{\left| {{C_k}}
\right|}^2}} }}{{{{\left| {{C_1}} \right|}^2}}}}\% $$

## Computation of THD

![Computation of THD](pictures/thd_ps.png)

# Steady-State Response of an LTI System to a Periodic Signal

## Steady-State Response of an LTI System to a Periodic Signal

The response of an LTI system with impulse response $h(t)$ to a complex
exponential signal $e^{st}$ is the same complex exponential multiplied by a
complex gain: $y(t) = H(s)e^{st}$, where:

$$H(s)=\int_{-\infty}^{\infty}h(\tau)e^{-st}\,d\tau.$$

In particular, for $s = j\omega$, the output is simply
$y(t)=H(j\omega)e^{j\omega t}$.

The complex functions $H(s)$ and $H(j\omega)$ are called the system's *transfer
function* and *frequency response*, respectively.

## By superposition

The output of an LTI system to a periodic function with period $T$ represented
by a Fourier series is given by:

$$y(t)=\sum_{k=-\infty}^{\infty} C_kH(jk\omega_0)e^{jk\omega_0 t}$$

where $\omega_0 = T/2\pi$ is the fundamental frequency.

Thus $y(t)$ is a Fourier series itself with coefficients $D_k$:

$$D_k = C_k H(jk\omega_0)$$

## Implications of this important result

The effect of an LTI system on a periodic input signal is to modify its Fourier
series through a multiplication by its frequency response evaluated at the
harmonic frequencies.

## Illustration

This picture below shows the effect of an LTI system on a periodic input in the
frequency domain.

![Illustration - system operating as a filter](pictures/filter.png)

## Filtering

A consequence of the previous result is that we can design a system that has a
desirable frequency spectrum $H(jk\omega_0)$ that retains certain frequencies
and cuts off others.

We will return to this idea later.

## End of Part 3

*Summary*

* Line spectra
* Power in periodic signals
* Steady-state response of an LTI system to a periodic signal

*Next Time*

* The Fourier Transform

## Home work

Compute the exponential Fourier series of a full-wave requified sinusoid. Give
the power spectrum for this signal and estimate the total harmonic distortion
for the first 7 harmonics.

## Lab Work

In the lab we will continue to explore Fourier Series and their
applications
