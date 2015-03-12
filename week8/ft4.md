
# Introduction to Filters

Dr Chris Jobling
([c.p.jobling@swansea.ac.uk](mailto:c.p.jobling@swansea.ac.uk))<br />Digital
Technium 123<br />Office Hours: Thursdays 14:00-15:00

You can view the notes for this presentation in [HTML format](http://nbviewer.ip
ython.org/github/cpjobling/EG-247-Resources/blob/master/week8/ft4.ipynb) and
print using your Brower's print function. The source code of this presentation
is available as an interactive [IPython
notebook](http://ipython.org/notebook.html) from GitHub:
<https://github.com/cpjobling/EG-247-Resources>. The GitHub repository also
contains the source code for all the Matlab/Simulink examples.

## Scope and Background Reading

This session is Based on the section **Filtering** from Chapter 5 of f [Benoit
Boulet, Fundamentals of Signals and
Systems](http://site.ebrary.com/lib/swansea/docDetail.action?docID=10228195)
from the **Recommended Reading List**.

This material is an introduction to analogue filters. You will find much more
in-depth coverage on Pages 11-1&mdash;1-48 of Karris.

## Agenda

* Frequency Selective Filters
* Ideal low-pass filter
* Butterworth low-pass filter
* High-pass filter
* Bandpass filter

## Introduction

* Filter design is an important application of Fourier transform
* Filtering is a rich topic often taught in graduate courses so we give only an
introduction.
* Our introduction *will* illustrate the usefulness of the frequency domain
viewpoint.
* We will explore how filters can shape the spectrum of a signal.

Other applications of the Fourier transform are sampling theory (introduced next
week) and modulation.

## Frequency Selective Filters

An ideal frequency-selective filter is a system that let's the frequency
components of a signal through undistorted while components at other components
are completely cut off.

* The range of frequencies which are let through belong to the **pass Band**
* The range of frequencies which are cut-off by the filter are called the
**stopband**
* A typical scenario where filtering is needed is when noise $n(t)$ is added to
a signal $x(t)$ but that signal has most of its energy outside the bandwidth of
a signal.

### Typical filtering problem

<img src="files/pictures/filter1.png">

### Signal

<img src="files/pictures/filter2.png">

### Out-of Bandwidth Noise 

<img src="files/pictures/filter3.png">

### Signal plus Noise

<img src="files/pictures/filter4.png">

### Filtering

<img src="files/pictures/filter5.png">

### Motivating example


    from IPython.display import YouTubeVideo
    # A demonstartion of digital filtering in Matlab
    # Video credit: David Dorran
    YouTubeVideo('vfH5r4cKukg')





        <iframe
            width="400"
            height=300"
            src="http://www.youtube.com/embed/vfH5r4cKukg"
            frameborder="0"
            allowfullscreen
        ></iframe>
        



Direct link to [YouTube](http://www.youtube.com/watch?v=vfH5r4cKukg&feature=shar
e&list=PLJ8LTUMGG9U4vAGind2_Bh4TUfgg1y0F4&index=2).

For script see: [Filter Design Using Matlab
Demo](http://dadorran.wordpress.com/2013/10/18/filter-design-using-matlab-demo/)

## Ideal Low-Pass Filter

An ideal low pass filter cuts-off frequencies higher than its *cutoff
frequency*, $\omega_c$.

$${H_{{\rm{lp}}}}(\omega ) = \left\{ {\begin{array}{*{20}{c}}
{1,}&{|\omega |{\kern 1pt} \, < {\omega _c}}\\
{0,}&{|\omega |{\kern 1pt} \, \ge {\omega _c}}
\end{array}} \right.$$

### Frequency response

<img src="files/pictures/ideal_lpf.png">

### Impulse response

$${h_{{\rm{lp}}}}(t) = \frac{{{\omega _c}}}{\pi }{\mathop{\rm sinc}\nolimits}
\left( {\frac{{{\omega _c}}}{\pi }t} \right)$$

<img src="files/pictures/sinc.png">

### Filtering is Convolution

The output of an LTI system with impulse response

$$h(t) \Leftrightarrow H(\omega)$$

subject to an input signal

$$x(t) \Leftrightarrow X(\omega)$$

is given by

$$y(t) = h(t)*x(t) \Leftrightarrow Y(\omega) = H(\omega)X(\omega)$$

### Issues with the "ideal" filter

This is the step response:

<img src="files/pictures/step_r.png">

(reproduced from Boulet Fig. 5.23 p. 205)

Ripples in the impulse resonse would be undesireable, and because the impulse
response is non-causal it cannot actually be implemented.





## Butterworth low-pass filter

N-th Order Butterworth Filter

$$\left| {{H_B}(\omega )} \right| = \frac{1}{{{{\left( {1 + {{\left(
{\frac{\omega }{{{\omega _c}}}} \right)}^{2N}}} \right)}^{\frac{1}{2}}}}}$$

**Remarks**

* DC gain is $|H_B(j0)|=1$
* Attenuation at the cut-off frequency is $|H_B(j\omega_c)|=1/\sqrt{2}$ for any
$N$

More about the Butterworth filter: [Wikipedia
Article](http://en.wikipedia.org/wiki/Butterworth_filter)

### Example 1: Second-order BW Filter

The second-order butterworth Filter is defined by is Charecteristic Equation
(CE):

$$p(s) = s^2 + \omega_c\sqrt{2}s+\omega_c^2 = 0^*$$

Calculate the roots of $p(s)$ (the poles of the filter transfer function) in
both Cartesian and polar form.

----

**Note**: This has the same characteristic as a control system with damping
ratio $\zeta = 1/\sqrt{2}$ and $\omega_n = \omega_c$!

### Example 2

Derive the differential equation relating the input $x(t)$ to output $y(t)$ of
the 2nd-Order Butterworth Low-Pass Filter with cutoff frequency $\omega_c$.

### Example 3

Determine the frequency response $H_B(\omega)=Y(\omega)/X(\omega)$

### Magnitude of frequency response of a 2nd-order Butterworth Filter

<img src="files/pictures/blpmfr.png">

Generated with [butter2_ex.m](files/matlab/butter2_ex.m)

### Bode-plot of a 2nd-order Butterworth Filter

<img src="files/pictures/butter_bode.png">

Matlab:
```matlab
wc = 100;
H = tf(wc^2,[1, wc*sqrt(2), wc^2])
bode(H)
```

Generated with [butter2_ex.m](files/matlab/butter2_ex.m)

### Example 4

Determine the impulse response of the butterworth filter.

You will find this Fourier transform pair useful:

$$e^{-at}\sin\omega_0 t\;u_0(t) \Leftrightarrow \frac{\omega_0}{(j\omega +
a)^2+\omega_0^2}$$

### Impulse response

<img src="files/pictures/butter_imp.png">

Matlab:
```matlab
impulse(H)
```

Generated with [butter2_ex.m](files/matlab/butter2_ex.m)

### Step response of of a 2nd-order Butterworth Filter

<img src="files/pictures/butter_step.png">

Matlab:
```matlab
step(H)
```
Generated with [butter2_ex.m](files/matlab/butter2_ex.m)

## High-pass filter

An ideal highpass filter cuts-off frequencies lower than its *cutoff frequency*,
$\omega_c$.

$${H_{{\rm{hp}}}}(\omega ) = \left\{ {\begin{array}{*{20}{c}}
{0,}&{|\omega |{\kern 1pt} \, \le {\omega _c}}\\
{1,}&{|\omega |{\kern 1pt} \, > {\omega _c}}
\end{array}} \right.$$

### Frequency response

<img src="files/pictures/ideal_hpf.png">

### Responses

**Frequency response**

$$H_{\mathrm{hp}}(\omega)=1-H_{\mathrm{lp}}(\omega)$$

**Impulse response**

$$h_{\mathrm{hp}}(t)=\delta(t)-h_{\mathrm{lp}}(t)$$

### Example 5

Determine the frequency response and impulse response of a 2nd-order butterworth
highpass filter

### Magnitude of frequency response of a 2nd-order Butterworth High-Pass Filter

<img src="files/pictures/bhpmfr.png">

Generated with [butter2_ex.m](files/matlab/butter2_ex.m)

## Band-pass filter

An ideal bandpass filter cuts-off frequencies lower than its first *cutoff
frequency* $\omega_{c1}$, and higher than its second *cutoff frequency*
$\omega_{c2}$.

$${H_{{\rm{bp}}}}(\omega ) = \left\{ {\begin{array}{*{20}{c}}
{1,}&{{\omega _{c1}} < \,|\omega |\, < {\omega _{c2}}}\\
{0,}&{{\rm{otherwise}}}
\end{array}} \right.$$

<img src="files/pictures/bbpmfr.png">

### Bandpass filter design

A bandpass filter can be obtained by multiplying the frequency responses of a
lowpass filter by a highpass filter.

$$H_{\mathrm{bp}}(\omega) = H_{\mathrm{hp}}(\omega)H_{\mathrm{lp}}(\omega)$$

* The highpass filter should have cut-off frequency of $\omega_{c1}$

* The lowpass filter should have cut-off frequency of $\omega_{c2}$

## Summary

* Frequency Selective Filters
* Ideal low-pass filter
* Butterworth low-pass filter
* High-pass filter
* Bandpass filter

*Next Session* &ndash; sampling theory

## Lab Work

In the lab, on Monday, we will look at frequency response analysis and
filtering.
