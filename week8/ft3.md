
# Fourier Transforms for Circuit and LTI Systems Analysis

Dr Chris Jobling ([c.p.jobling@swansea.ac.uk](mailto:c.p.jobling@swansea.ac.uk))

Digital Technium 123

Office Hours: 12:00-13:00 Mondays

You can view the notes for this presentation in [HTML](http://cpjobling.github.io/EG-247-Resources/week7/ft3.html
  ) and [PDF](http://cpjobling.github.io/EG-247-Resources/week7/ft3.pdf).

  The source code of this presentation is available in Markdown format from GitHub: [ft2.md](https://github.com/cpjobling/EG-247-Resources/tree/master/week7/ft3.md).

The GitHub repository [EG-247 Resources](https://github.com/cpjobling/EG-247-Resources)
also contains the source code for all the Matlab/Simulink
examples and the Laboratory Exercises.

## Scope and Background Reading

This session we will apply what we have learned about Fourier transforms to some
typical cicuit problems. After a short introduction, this session will be an
examples class.

The material in this presentation and notes is based on Chapter 8 of [Steven T. Karris, Signals and Systems: with Matlab Computation
and Simulink Modelling, 5th
Edition.](http://site.ebrary.com/lib/swansea/docDetail.action?docID=10547416)
from the **Required Reading List**. I also used [Benoit Boulet,
Fundamentals of Signals and
Systems](http://site.ebrary.com/lib/swansea/docDetail.action?docID=10228195)
from the **Recommended Reading List**.

## Agenda

* The system function
* Examples

# The System Function

## System response from system impulse response

Recall that the convolution integral of a system with impulse response $h(t)$
and input $u(t)$ is

$$h(t)*u(t)=\int_{-\infty}^{\infty}h(t-\tau)u(\tau)\,d\tau.$$

We let

$$g(t) = h(t)*u(t)$$

Then by the time convolution property

$$h(t)*u(t) = g(t) \Leftrightarrow G(\omega) = H(\omega).U(\omega)$$

## The System Function

We call $H(\omega)$ the *system function*.

We note that the system function $H(\omega)$ and the impulse response $h(t)$
form the Fourier transform pair

$$h(t) \Leftrightarrow H(\omega)$$


## Obtaining system response

If we know the impulse resonse $h(t)$, we can compute the system response $g(t)$
of any input $u(t)$ by multiplying the Fourier transforms of $H(\omega)$ and
$U(\omega)$ to obtain $G(\omega)$. Then we take the inverse Fourier transform of
$G(\omega)$ to obtain the response $g(t)$.

1. Transform $h(t) \to H(\omega)$
2. Transform $u(t) \to U(\omega)$
3. Compute $G(\omega) = H(\omega).U(\omega)$
4. Find $\mathcal{F}^{-1}\left\{G(\omega)\right\} \to g(t)$

## Example 1

Karris example 8.8: for the linear network shown below, the impulse response is
$h(t)=3e^{-2t}$. Use the Fourier transform to compute the response $y(t)$ when
the input
$$u(t)=2[u_0(t)-u_0(t-3)].$$
Verify the result with Matlab.

![Example 1](pictures/example1.png)

## Matlab verification

See [ft3_ex1.m](matlab/ft3_ex1.m)

```matlab
Result:

    y = 3*heaviside(t) - 3*heaviside(t - 3) + ...
    3*heaviside(t - 3)*exp(6 - 2*t) ...
    - 3*exp(-2*t)*heaviside(t)
```

Which after gathering terms gives

$$y(t) = 3(1 - 3e^{-2t})u_0(t) - 3(1 - 3e^{-2(t-3)})u_0(t-3)$$

And here's a plot:

----


![Solution for example 1](pictures/ft3_ex1.png)

## Example 2

Karris example 8.9: for the circuit shown below, use the Fourier transfrom
method, and the system function $H(\omega)$ to compute $V_L(t)$. Assume
$i_L(0^-)=0$. Verify the result with Matlab.

![Example 2](pictures/example2.png)

## Matlab verification

See [ft3_ex2.m](matlab/ft3_ex2.m)

```matlab
Result:

    vout = -5*exp(-3*t)*heaviside(t)*(2*exp(t) - 3)
```

Which after gathering terms gives

$$v_{\mathrm{out}} = 5\left(3e^{-3t} - 2e^{-2t}\right)u_0(t)$$

And here's a plot:

----

![Solution for example 2](pictures/ft3_ex2.png)

## Example 3

Karris example 8.10: for the linear network shown below, the input-output
relationship is:

$$\frac{d}{dt}v_{\mathrm{out}}+4v_{\mathrm{out}}=10v_{\mathrm{in}}$$

where $v_{\mathrm{in}}=3e^{-2t}$. Use the Fourier transform method, and the
system function $H(\omega)$ to compute the output $v_{\mathrm{out}}$. Verify the
result with Matlab.

![Example 3](pictures/example3.jpg)

## Matlab verification

See [ft3_ex3.m](files/matlab/ft3_ex3.m)

```matlab
Result:

    15*exp(-4*t)*heaviside(t)*(exp(2*t) - 1)
```

Which after gathering terms gives

$$v_{\mathrm{out}}(t) = 15\left(e^{-2t} - e^{-4t}\right)u_0(t)$$

And here's a plot:

----

![Solution of example 3](pictures/ft3_ex3.png)

## Example 4

Karris example 8.11: the voltage across a 1 $\Omega$ resistor is known to be
$V_{R}(t)=3e^{-2t} u_0(t)$. Compute the energy dissipated in the resistor for
$0<t < \infty$, and verify the result using Parseval's theorem. Verify the
result with Matlab.

![Example 4](pictures/example4.png)

----

Note from [tables of integrals](http://en.wikipedia.org/wiki/Lists_of_integrals)

$$\int\frac{1}{a^2 + x^2}\,dx = \frac{1}{a}\arctan\frac{x}{a}+C.$$

## Matlab verification

See [ft3_ex4.m](files/matlab/ft3_ex4.m)

```matlab
Result:

    Wr = (51607450253003931*pi)/72057594037927936 = 2.25
```

## Homework

Attempt the end of the chapter exercises 7-11 (Section 8.10) from Karris. Don't
look at the answers until you have attempted the problems.

## Lab Work

We will verify the results and examine the frequency responses of selected
examples from this session.
