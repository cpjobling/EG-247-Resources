# Table of Properties of the Z-Transform

| No. | **Property** | $f[n]$ | $F(z)$ |
|----:|----------|--------|--------------|
| 1.   | Linearity | $af_1[n]+bf_2[n]+\cdots$ | $aF_1(z)+bF_2(z)+\cdots$ |
| 2.  | Shift of $x[n]u_0[n]$ | $f[n-m]u_0[n-m]$ | $z^{-m}F(z)$ |
| 3.  | Left shift | $f[n-m]$ | $$z^{-m}F(z)+\sum_{n=0}^{m-1}f[n-m]z^{-n}$$ |
| 4.  | Right shift | $f[n+m]$ | $$z^{m}F(z)+\sum_{n=-m}^{-1}f[n+m]z^{-n}$$  |
| 5.  | Multiplication by $a^n$ | $a^nf[n]$ | $$F\left(\frac{z}{a}\right)$$ |
| 6.  | Multiplication by $e^{-nsT_s}$ | $e^{-nsT_s}f[n]$ | $$F\left(e^{sT_s}z\right)$$ |
| 7.  | Multiplication by $n$ | $nf[n]$ | $$-z\frac{d}{dz}F(z)$$ |
| 8.  | Multiplication by $n^2$ | $n^2f[n]$ | $$-z\frac{d}{dz}F(z)+z^2\frac{d^2}{dz^2}F(z)$$ |
| 9.  | Summation in time | $$\sum_{m=0}^{n}f[m]$$ | $$\frac{z}{z-1}F(z)$$ |
| 10. | Time convolution | $f_1[n]*f_2[n]$ | $F_1(z)F_2(z)$ |
| 11. | Frequency convolution | $f_1[n]f_2[n]$ | $$\frac{1}{{j2\pi }}\oint
{x{F_1}(v){F_2}\left( {\frac{z}{v}} \right)} {v^{ - 1}}dv$$ |
| 12. | Initial value theorem |  | $$f[0]=\lim_{z\to\infty}F(z)$$ |
| 13. | Final value theorem |  | $$\lim_{n\to\infty}f[n]=\lim_{z\to 1}(z-1)F(z)$$ |


For proofs refer to Section 9.2 of Karris.
