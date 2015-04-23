
# The Inverse Z-Transform

Dr Chris Jobling ([c.p.jobling@swansea.ac.uk](mailto:c.p.jobling@swansea.ac.uk))

Digital Technium 123

Office Hours: 12:00-13:00 Mondays

You can view the notes for this presentation in [HTML](http://cpjobling.github.io/EG-247-Resources/week10/i-z-transform.html
  ) and [PDF](http://cpjobling.github.io/EG-247-Resources/week10/i-z-transform.pdf).

  The source code of this presentation is available in Markdown format from GitHub: [i-z-transform.md](https://github.com/cpjobling/EG-247-Resources/tree/master/week10/i-z-transform.md).

The GitHub repository [EG-247 Resources](https://github.com/cpjobling/EG-247-Resources)
also contains the source code for all the Matlab/Simulink
examples and the Laboratory Exercises.


## Scope and Background Reading

This session we will talk about the Inverse Z-Transform and illustrate its use
through an examples class.

The material in this presentation and notes is based on Chapter 9 (Starting at
Section 9.6) of [Steven T. Karris, Signals and Systems: with Matlab Computation
and Simulink Modelling, 5th
Edition.](http://site.ebrary.com/lib/swansea/docDetail.action?docID=10547416)
from the **Required Reading List**.

## Agenda

* Inverse Z-Transform
* Examples using PFE
* Examples using Long Division
* Analysis in Matlab

## The Inverse Z-Transform

The inverse Z-Transform enables us to extract a sequence $f[n]$ from $F(z)$. It
can be found by any of the following methods:

* Partial fraction expansion
* The inversion integral
* Long division of polynomials

# Partial fraction expansion
## Partial fraction expansion

We expand $F(z)$ into a summation of terms whose inverse is known. These terms
have the form:

$$k,\;\frac{r_1 z}{z - p_1},\;\frac{r_1 z}{(z - p_1)^2},\;\frac{r_3 z}{z -
p_2},\ldots$$

where $k$ is a constant, and $r_i$ and $p_i$ represent the residues and poles
respectively, and can be real or complex [^1]

<div class="notes">
**Notes**

[^1]: If complex, the poles and residues will be in complex conjugate pairs

  $$\frac{r_{i} z}{z - p_i} + \frac{r_{i}^* z}{z - p_i^*}$$
</div>

## Step 1: Make Fractions Proper

* Before we expand $F(z)$ into partial fraction expansions, we must first
express it as a *proper* rational function.
* This is done by expanding $F(z)/z$ instead of $F(z)$
* That is we expand

$$\frac{F(z)}{z} = \frac{k}{z} + \frac{r_1}{z-p_1} + \frac{r_2}{z-p_2} +
\cdots$$

## Step 2: Find residues

* Find residues from

$$r_k = \lim_{z\to p_k}(z - p_k)\frac{F(z)}{z} = (z -
p_k)\left.\frac{F(z)}{z}\right|_{z=p_k}$$

## Step 3: Map back to transform tables form

* Rewrite $F(z)/z$:

$$z\frac{F(z)}{z} = F(z) = k + \frac{r_1z}{s-p_1} + \frac{r_2z}{s-p_2} +
\cdots$$

## Example 1

Karris Example 9.4: use the partial fraction expansion to compute the inverse
z-transform of

$$F(z) = \frac{1}{(1 - 0.5z^{-1})(1 - 0.75z^{-1})(1 - z^{-1})}$$


## Answer to Example 1

$$f[n] = 2\left(\frac{1}{2}\right)^n - 9\left(\frac{3}{4}\right)^n + 8$$

## Matlab solution

See [example1.m](https://github.com/cpjobling/EG-247-Resources/blob/master/week10/matlab/example1.m)

Uses Matlab functions:

* `collect` &ndash; expands a polynomial
* `sym2poly` &ndash; converts a polynomial into a numeric polymial (vector of
coefficients in descending order of exponents)
* `residue` &ndash; calculates poles and zeros of a polynomial
* `ztrans` &ndash; symbolic z-transform
* `iztrans` &ndash; symbolic inverse ze-transform
* `stem` &ndash; plots sequence as a "lollipop" diagram

## Stem ("Lollipop") Plot

![Solution to Example 1](pictures/example1.png)

## Example 2

Karris example 9.5: use the partial fraction expansion method to to compute the
inverse z-transform of

$$F(z) = \frac{12z}{(z+1)(z - 1)^2}$$


## Answer to Example 2

$$f[n] = 3(-1)^n + 6n - 3$$

## Matlab solution

See [example2.m](https://github.com/cpjobling/EG-247-Resources/blob/master/week10/matlab/example2.m)

Uses additional Matlab functions:

* `dimpulse` &ndash; computes and plots a sequence $f[n]$ for any range of
values of $n$

## Lollipop Plot

![Solution to Example 2](pictures/example2a.png)

## Staircase Plot

Simulates output of Zero-Order-Hold (ZOH) or Digital Analogue Converter (DAC)

![Solution to Example 2 as DAC Output](pictures/example2b.png)

## Example 3

Karris example 9.6: use the partial fraction expansion method to to compute the
inverse z-transform of

$$F(z) = \frac{z + 1}{(z-1)(z^2 + 2z + 2)}$$

## Answer to Example 3

$$f[n] = -0.5\delta[n] + 0.4 + \frac{(\sqrt{2})^n}{10}\cos \frac{3n\pi}{4} -
\frac{3(\sqrt{2})^n}{10}\sin \frac{3n\pi}{4}$$

## Matlab solution

See [example3.m](https://github.com/cpjobling/EG-247-Resources/blob/master/week10/matlab/example3.m)

## Lollipop Plot

![Solution to Example 3](pictures/example3a.png)

### Staircase Plot

![Solution to Example 3 as DAC Output](pictures/example3b.png)

# Inverse Z-Transform by the Inversion Integral
## Inverse Z-Transform by the Inversion Integral

The inversion integral states that:

$$f[n] = \frac{1}{{j2\pi }}\oint_C {F(z){z^{n - 1}}\,dz} $$

where $C$ is a closed curve that encloses all poles of the integrant.

This can (*apparently*) be solved by Cauchy's residue theorem!!

Fortunately (:-), this is beyond the scope of this module!

See Karris Section 9.6.2 (pp 9-29&mdash;9-33) if you want to find out more.

# Inverse Z-Transform by the Long Division
## Inverse Z-Transform by the Long Division

To apply this method, $F(z)$ must be a rational polynomial functuon, and the
numerator and denominator must be polynomials arranged in descending powers of
$z$.

## Example 4

Karris example 9.9: use the long division method to determine $f[n]$ for $n =
0,\,1,\,\mathrm{and}\,2$, given that

$$F(z) = \frac{1 + z^{-1} + 2z^{-2} + 3z^{-3}}{(1 - 0.25z^{-1})(1 - 0.5z^{-1})(1
- 0.75z^{-1})}$$

## Answer 4

$f[0] = 1$, $f[1] = 5/2$, $f[2] = 81/16$.

## Matlab

See [example4.m](https://github.com/cpjobling/EG-247-Resources/blob/master/week10/matlab/example4.m)

```matlab
sym_den =

z^3 - (3*z^2)/2 + (11*z)/16 - 3/32


fn =

    1.0000
    2.5000
    5.0625
    ....
```

## Combined Staircase/Lollipop Plot

![Combined Staircase/Lollipop Plot](pictures/example4.png)

## Methods of Evaluation of the Inverse Z-Transform

+-----------------------------+-------------------------------------------------+------------------------------------------------------+
| **Method**                  | **Advantages**                                  | **Disadvantages**                                    |
+=============================+=================================================+======================================================+
| Partial Fraction Expansion  | - Most familiar.                                | - Requires that $F(z)$ is a proper rational function.|
|                             | - Can use Matlab `residue` function.            |                                                      |
+-----------------------------+-------------------------------------------------+------------------------------------------------------+
| Inversion Integral          | - Can be used whether $F(z)$ is rational or not | - Requires familiarity with the *Residues theorem*   | |                             |                                                 |   of complex variable analysis.                      |
+-----------------------------+-------------------------------------------------+------------------------------------------------------+
| Long Division               | - Practical when only a small sequence of       | - Requires that $F(z)$ is a proper rational          |
|                             |   numbers is desired.                           | - Division may be endless.                           |
|                             | - Useful when z-transform has no closed-form    |                                                      |
|                             |   solution.                                     |                                                      |
|                             | - Can use Matlab `dimpulse` function to compute |                                                      |
|                             |   a large sequence of numbers.                  |                                                      |
+-----------------------------+-------------------------------------------------+------------------------------------------------------+

## Summary

* Inverse Z-Transform
* Examples using PFE
* Examples using Long Division
* Analysis in Matlab

*Next time*

* DT transfer functions, continuous system equivalents, and modelling DT systems
in Matlab and Simulink.

## Homework

Attempt the end of the chapter exercises 4-7 (Section 9.10) from Karris. Don't
look at the answers until you have attempted the problems.
