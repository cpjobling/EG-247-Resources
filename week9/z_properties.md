# Table of Properties of the Z-Transform

| No. | **Property** | $f[n]$ | $F(z)$ |
|----:|----------|--------|--------------|
| 1.   | Linearity | $af_1[n]+bf_2[n]+\cdots$ | $a_1F_1(j\omega)+a_2F_2(j\omega)+\cdots+a_nF_n(j\omega)$ |
| 2.   | Shift of $x[n]u_0[n]$ | $f[n-m]u_0[n-m]$ | $z^{-m}F(z)$ |
| 3.  | Time and frequency scaling | $f(\alpha t)$ | $$\frac{1}{|\alpha|}F\left(j\frac{\omega}{\alpha}\right)$$ | time compression is frequency expansion and *vice versa* |
| 4.  | Time shifting | $$f(t-t_0)$$ | $$e^{-j\omega t_0}F(j\omega)$$ | A time shift corresponds to a phase shift in frequency domain |
| 5.  | Frequency shifting | $$e^{j\omega_0 t}f(t)$$ | $$F(j\omega-j\omega_0)$$ | Multiplying a signal by a complex exponential results in a frequency shift. |
| 6.  | Time differentiation | $$\frac{d^n}{dt^n}\,f(t)$$ | $$(j\omega)^nF(j\omega)$$ | |
| 7.  | Frequency differentiation | $$(-jt)^n f(t)$$ | $$\frac{d^n}{d\omega^n}F(j\omega)$$ | |
| 8.  | Time integration | $$\int_{-\infty}^{t}f(\tau)d\tau$$ | $$\frac{F(j\omega)}{j\omega}+\pi F(0)\delta(\omega)$$ | |
| 9.  | Conjugation | $$f^*(t)$$ | $$F^*(-j\omega)$$ | |
| 10. | Time convolution | $$f_1(t)*f_2(t)$$ | $$F_1(j\omega) F_2(j\omega)$$ | Compare with Laplace Transform | |
| 11. | Frequency convolution | $$f_1(t)f_2(t)$$ | $$\frac{1}{2\pi}F_1(j\omega)*F_2(j\omega)$$ | This has application to amplitude modulation as shown in Boulet pp 182&mdash;183. |
| 12. | Area under $f(t)$ | $$\int_{-\infty}^{\infty} f(t)\,dt = F(0)$$ | | Way to calculate DC (or average) value of a signal |
| 13. | Area under $F(j\omega)$ | $$f(0) = \frac{1}{2\pi}\int_{-\infty}^{\infty}F(j\omega)\,d\omega$$ |  |
| 14. | Energy-Density Spectrum | $$E_{[\omega_1,\omega_2]}:=\frac{1}{2\pi}\int_{\omega_1}^{\omega_2}|F(j\omega)|^2\,d\omega.$$ | |
| 15. | Parseval's theorem | $$\int_{-\infty}^{\infty}|f(t)|^2\,dt=\frac{1}{2\pi}\int_{-\infty}^{\infty}|F(j\omega)|^2\,d\omega.$$ | | Definition RMS follows from this |

<table>
<thead>
<tr><td>3</td><td>Left shift</td><td>$f[n-m]$</td><td>$$z^{-m}F(z)+\sum_{n=0}^{m
-1}f[n-m]z^{-n}$$</td></tr>
<tr><td>4</td><td>Right shift</td><td>$f[n+m]$</td><td>$$z^{m}F(z)+\sum_{n=-m}^{
-1}f[n+m]z^{-n}$$</td></tr>
<tr><td>5</td><td>Multiplication by
$a^n$</td><td>$a^nf[n]$</td><td>$$F\left(\frac{z}{a}\right)$$</td></tr>
<tr><td>6</td><td>Multiplication by $e^{-nsT_s}$</td><td>$e^{-nsT_s}f[n]$</td><t
d>$$F\left(e^{sT_s}z\right)$$</td></tr>
<tr><td>7</td><td>Multiplication by
$n$</td><td>$nf[n]$</td><td>$$-z\frac{d}{dz}F(z)$$</td></tr>
<tr><td>8</td><td>Multiplication by $n^2$</td><td>$n^2f[n]$</td><td>$$-z\frac{d}
{dz}F(z)+z^2\frac{d^2}{dz^2}F(z)$$</td></tr>
<tr><td>9</td><td>Summation in
time</td><td>$$\sum_{m=0}^{n}f[m]$$</td><td>$$\frac{z}{z-1}F(z)$$</td></tr>
<tr><td>10</td><td>Time
convolution</td><td>$f_1[n]*f_2[n]$</td><td>$F_1(z)F_2(z)$</td></tr>
<tr><td>11</td><td>Frequency
convolution</td><td>$f_1[n]f_2[n]$</td><td>$$\frac{1}{{j2\pi }}\oint
{x{F_1}(v){F_2}\left( {\frac{z}{v}} \right)} {v^{ - 1}}dv$$</td></tr>
<tr><td>12</td><td>Initial value theorem</td><td
colspan="2">$$f[0]=\lim_{z\to\infty}F(z)$$</td></tr>
<tr><td>13</td><td>Final value theorem</td><td
colspan="2">$$\lim_{n\to\infty}f[n]=\lim_{z\to 1}(z-1)F(z)$$</td></tr>
</tbody>
</table>

<p>For proofs refer to Section 9.2 of Karris.</p>
