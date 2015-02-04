
# The Inverse Laplace Transform

Dr Chris Jobling ([c.p.jobling@swansea.ac.uk](mailto:c.p.jobling@swansea.ac.uk))

Digital Technium 123

Office Hours: 12:00-13:00 Mondays

You can view the notes for this presentation in [HTML](http://cpjobling.github.io/EG-247-Resources/week2/inverse_laplace.html
  ) and [PDF](http://cpjobling.github.io/EG-247-Resources/week2/inverse_laplace.pdf).

The source code of this presentation is available in Markdown format from GitHub: [Introduction.md](https://github.com/cpjobling/EG-247-Resources/tree/master/week2/inverse_laplace.md).

The GitHub repository [EG-247 Resources](https://github.com/cpjobling/EG-247-Resources)
also contains the source code for all the Matlab/Simulink
examples and the Laboratory Exercises.

## Definition

The formal definition of the Inverse Laplace Transform is

$$\mathcal{L}^{-1}\left\{ F(s) \right\} = \frac{1}{2\pi
j}\int_{\sigma-j\omega}^{\sigma+j\omega} f(t)e^{st}ds$$

but this is difficult to use in practice because it requires contour integration
using complex variable theory.

----

For most engineering problems we can instead refer to **Tables of Properties**
and **Common Transform Pairs** to look up the *Inverse Laplace Transform*

(Or, if we are not taking an exam, we can use a computer or mobile device.)

## Partial Fraction Expansion

Quite often the Laplace Transform we start off with is a *rational polynomial*
in $s$.

$$F(s) = \frac{N(s)}{D(s)} = \frac{b_ms^m + b_{m-1}s^{m-1}+b_{m-2}s^{m-2}+
\cdots +b_{1}s+b_{0}}{a_ns^n + a_{n-1}s^{n-1}+a_{n-2}s^{n-2}+ \cdots
+a_{1}s+a_{0}}$$

The coefficients $a_k$ and $b_k$ are real for $k = 1, 2, 3, \ldots$

## Proper and Improper Rational Functions

* If $m <n$ $F(s)$ is said to be a *proper rational function*.
* If $m \ge n$ $F(s)$ is said to be an *improper rational function*

(Think [proper fractions](http://www.mathsisfun.com/proper-fractions.html) and
[improper fractions](http://www.mathsisfun.com/improper-fractions.html).)

## Zeros

* The *roots* of the numerator polymonial $N(s)$ are found by setting $N(s)=0$
* When $s$ equals one of the $m$ roots of $N(s)$ then $F(s)$ will be zero.
* Thus the roots of $N(s)$ are the **zeros** of $F(s)$.

## Poles

* The *roots* (*zeros*) of the denominator polynomial are found by setting $D(s)
= 0$.
* When $s$ equals one of the $n$ roots of $D(s)$ then $F(s)$ will be infinite
$F(s_r) = N(s_r)/0=\infty$).
* These are called the **poles** of $F(s)$.

(Imagine telegraph poles planted at the points on the $s$-plane where $D(s)$ is
zero.)

## A Further Simplifying Assumption

If $F(s)$ is *proper* then it is conventional to make the coefficient $s_n$ unity
thus:

$$F(s) = \frac{{N(s)}}{{D(s)}} = \frac{{1/{a_n}\left( {{b_m}{s^m} + {b_{m -
1}}{s^{m - 1}} + {b_{m - 2}}{s^{m - 2}} +  \cdots  + {b_1}s + {b_0}}
\right)}}{{{s^n} + \frac{{{a_{n - 1}}}}{{{a_n}}}{s^{n - 1}} + \frac{{{a_{n -
2}}}}{{{a_n}}}{s^{n - 2}} +  \cdots  + \frac{{{a_1}}}{{{a_n}}}s +
\frac{{{a_0}}}{{{a_n}}}}}$$

(I know it doesn't look simpler, but remember that the $a$s and $b$s are numbers
in practice!)


# Inverse Laplace Transform by Partial Fraction Expansion (PFE)

## PFE Cases

The poles of $F(s)$ can be real and distinct, real and repeated, complex
conjugate pairs, or a combination.

### Defining the problem

The nature of the poles governs the best way to tackle the PFE that leads to the
solution of the Inverse Laplace Transform. Thus, we need to structure our
presentation to cover one of the following cases:

* The case where $F(s)$ has distinct poles
* The case where $F(s)$ has complex poles
* The case where $F(s)$ has repeated poles
* The case where $F(s)$ is an improper rational polynomial

We will examine each case by means of a worked example. Please refer to Chapter
3 of Karris for full details.

## The case of the distinct poles

If the poles $p_1,\,p_2,\,p_3,\,\ldots,\, p_n$ are *distinct* we can factor the
denominator of F(s) in the form

$$F(s) = \frac{N(s)}{(s-p_1)(s-p_2)(s-p_3)\ldots(s-p_n)}$$

Next, using *partial fraction expansion*

$$F(s)=\frac{r_1}{s-p_1}+\frac{r_2}{s-p_2}+\frac{r_3}{s-p_3}+\cdots +
\frac{r_n}{s-p_n}$$

To evaluate the *residue* $r_k$, we multiply both sides by $(s-p_k)$ then let $s
\to p_k$

$$r_k = \lim_{s\to p_k}(s-p_k)F(s) = \left.(s-p_k)F(s)\right|_{s=p_k}$$

## Example 1

Use the PFE method to simplify $F_1(s)$ below and find the time domain function
$f_1(t)$ corresponding to $F_1(s)$

$$F_1(s) = \frac{2s+5}{s^2 + 5s + 6}$$

(Quick solution: [Wolfram|Alpha](http://www.wolframalpha.com/input/?i=inverse+la
place+transform+%282s+%2B+5%29%2F%28s%5E2+%2B+5s+%2B+6%29))

## Matlab Solution - Numerical

````matlab
Ns = [2, 5]; Ds = [1, 5, 6];
[r,p,k] = residue(Ns, Ds)

r =

    1.0000
    1.0000

p =

    -3.0000
    -2.0000


  k =

   []

````
----

Interpreted as:

$$F_1(s) = \frac{1}{s + 3} + \frac{1}{s + 2}$$

which because of the linearity property of the Laplace Transform and using
tables results in the *Inverse Laplace Transform*

$$f_1(t) = e^{-3t} + e^{-2t}$$

## Matlab solution - symbolic


````matlab
syms s t;
Fs = (2*s + 5)/(s^2 + 5*s + 6);
ft = ilaplace(Fs);
pretty(ft)

  exp(-2 t) + exp(-3 t)
````


## Example 2

Determine the Inverse Laplace Transform of

$$F_2(s) = \frac{3s^2+2s+5}{s^3 + 9s^s + 23s + 15}$$

(Quick solution: [Wolfram|Alpha](http://www.wolframalpha.com/input/?i=inverse+laplace+transform+%283s%5E2+%2B+2s+%2B+5%29%2F%28s%5E3+%2B+9s%5E2+%2B+23s+%2B+15%2
9))

## Solution 2

Because the denominator of $F_2(s)$ is a cubic, it will be difficult to
factorise without computer assistance so we use Matlab to factorise $D(s)$

````matlab
syms s;
factor(s^3 + 9*s^2 + 23*s + 15)

ans =

  (s + 3)*(s + 5)*(s + 1)
````

<div class="notes">
In an exam you'd be given the factors
</div>

----

We can now use the previous technique to find the solution which according to
Matlab should be

$$f_1(t) = \frac{3}{4}e^{-t} - \frac{13}{2}e^{-3t} + \frac{35}{4}e^{-5t}$$

## The case of the complex poles

Quite often the poles of $F(s)$ are complex and because the complex poles occur
as complex conjugate pairs, the number of complex poles is even. Thus if $p_k$
is a complex root of $D(s)$ then its complex conjugate $p_k^*$ is also a root of
$D(s)$.

You can still use the PFE with complex poles, as demonstrated in Pages
3-5&mdash;3-7 in the textbook. However it is easier to use the fact that complex
poles will appear as quadratic factors of the form $s^2 + as + b$ and then call
on the two transforms in the PFE


$$\frac{s}{(s - a)^2 + \omega^2} \Leftrightarrow e^{at}\sin\;\omega t$$

$$\frac{s + a}{(s - a)^2 + \omega^2} \Leftrightarrow e^{at}\cos\;\omega t$$


## Example 3

Rework Example 3-2 from the text book using quadratic factors.

Find the Inverse Laplace Transform of

$$F_3(s) = \frac{s + 3}{(s+1)(s^2 + 4s + 8)}$$

(Quick solution: [Wolfram|Alpha](http://www.wolframalpha.com/input/?i=inverse+laplace+transform+%28s%2B3%29%2F%28%28s+%2B+1%29%28s%5E2+%2B+4s+%2B+8%29%29)
&ndash; Shows that the computer is not always best!)

## Solution

We complete the square

$$s^2 + 4s + 8 = (s + 2)^2 + 4$$

Then comparing this with the desired form $(s - a)^2 + \omega^2$, we have $a =
-2$ and $\omega^2 = 4 \to \omega = \sqrt{4} = 2$.

----

To solve this, we need to find the PFE for the assumed solution:

$$F_3(s) = \frac{r_1}{s+1} + \frac{r_2s}{(s + 2)^2 + 4} + \frac{r_3(s+2)}{(s +
2)^2 + 4}$$

expecting the solution

$$f_3(t) = \frac{2}{5}e^{-t} + \frac{3}{10}\sin 2t - \frac{2}{5}\cos 2t$$

You can use trig. identities to simplify this further if you wish.



## The case of the repeated poles

When a rational polynomial has repeated poles

$$F(s) = \frac{N(s)}{(s - p_1)^m(s - p_2)\cdots(s - p_{n-1})(s-p_0)}$$

and the PFE will have the form:

$$\begin{array}{c}
F(s) = \frac{{{r_{11}}}}{{{{(s - {p_1})}^m}}} + \frac{{{r_{12}}}}{{{{(s -
{p_1})}^{m - 1}}}} + \frac{{{r_{13}}}}{{{{(s - {p_1})}^{m - 2}}}} +  \cdots  +
\frac{{{r_{1m}}}}{{(s - {p_1})}}\\
 + \frac{{{r_2}}}{{(s - {p_2})}} + \frac{{{r_3}}}{{(s - {p_3})}} +  \cdots  +
\frac{{{r_n}}}{{(s - {p_n})}}
\end{array}$$

The ordinary residues $r_k$ can be found using the rule used for distinct roots.

----

To find the residuals for the repeated term $r_{1k}$ we need to multiply both
sides of the expression by $(s+p_1)^m$ and take repeated derivatives as
described in detail in Pages 3-7&mdash;3-9 of the text book. This yields the
general formula

$$r_{1k}=\lim_{s\to
p_1}\frac{1}{(k-1)!}\frac{d^{k-1}}{ds^{k-1}}\left[(s-p_1)^mF(s)\right]$$

which in the age of computers is rarely needed.

## Example 4

Find the inverse Laplace Transform of

$$F_4(s) = \frac{s+3}{(s+2)(s+1)^2}$$

Note that the transform

$$te^{at} \Leftrightarrow \frac{1}{(s - a)^2}$$

will be useful.

(Quick solution: [Wolfram|Alpha](http://www.wolframalpha.com/input/?i=inverse+laplace+transform+%28s%2B3%29%2F%28%28s%2B2%29%28s+%2B+1%29%5E2%29))

## Solution

We will leave the solution that makes use of the residue of repeated poles
formula for you to study from the text book. In class we will illustrate the
slightly simpler approach also presented in the text.

For exam preparation, I would recommend that you use whatever method you find
most comfortable.

## The case of the improper rational polynomial

If $F(s)$ is an improper rational polynomial, that is $m \ge n$, we must first
divide the numerator $N(s)$ by the denomonator $D(s)$ to derive an expression of
the form

$$F(s) = k_0 + k_1s + k_2s^2 + \cdots + k_{m-n}s^{m-n} + \frac{N(s)}{D(s)}$$

and then $N(s)/D(s)$ will be a proper rational polynomial.

## Example 5 - and some new transform pairs.

$$F_6(s)= \frac{s^2 + 2s + 2}{s+1}$$

(Quick solution: [Wolfram|Alpha](http://www.wolframalpha.com/input/?i=inverse+laplace+transform+%28s%5E2+%2B+2s+%2B+2%29%2F%28s+%2B+1%29))

----

Dividing $s^2 + 2s + 2$ by $s + 1$ gives

$$F_6(s) = s + 1 + \frac{1}{s+1}$$

$$\frac{1}{s+1} \Leftrightarrow e^{-t}$$

$$1 \Leftrightarrow \delta(t)$$

$$s \Leftrightarrow ?$$

## What function of *t* has Laplace transform *s*?

Recall from Lesson 2:

$$\frac{d}{dt}u_0(t)=u_0'(t)=\delta(t)$$

and

$$\frac{d^2}{dt^2}u_0(t)=u_0''(t)=\delta'(t)$$

Also, by the time differentiation property

$$u_0''(t)=\delta'(t)\Leftrightarrow s^2\mathcal{L}u_0(t) - su_0(0) -
\left.\frac{d}{dt}u_0(t)\right|_{t=0} =  s^2\frac{1}{s} = s$$

## New Transform Pairs

$$s\Leftrightarrow \delta'(t)$$

$$\frac{d^n}{dt^n}\delta(t)\Leftrightarrow s^n$$

$$f_6(t) = e^{-t}+\delta(t)+\delta'(t)$$

## Matlab verification


````matlab
Ns = [1, 2, 2]; Ds = [1 1];
[r, p, k] = residue(Ns, Ds)

r =

    1


p =

    -1


k =

    1     1
````

----

````matlab
syms s;
F6 = (s^2 + 2*s + 2)/(s + 1);
f6 = ilaplace(F6)

f6 =

  exp(-t) + dirac(t) + dirac(t, 1)
````

## Homework

Do the end of the chapter exercises (Section 3.67) from the textbook. Don't look
at the answers until you have attempted the problems.

## Lab Work

In the lab, a week on Friday, we will explore the tools provided by Matlab for taking
Laplace transforms, representing polynomials, finding roots and factorizing
polynomials and solution of inverse Laplace transform problems.
