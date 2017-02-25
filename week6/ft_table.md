# Table of Common Fourier Transform Pairs

|No. | **Name** | $f(t)$ | $F(\omega)$ | **Remarks** |
|---:|----------|--------|-------------|-------------|
| 1. | Dirac delta | $\delta(t)$ | 1 | Constant energy at *all* frequencies. |
| 2. | Time sample | $\delta(t-t_0)$ | $e^{j\omega t_0}$ |  |
| 3. | Phase shift | $e^{j\omega t_0}$ | $2\pi\delta(\omega - \omega_0)$ |  |
| 4. | *Signum*  | $\operatorname{sgn}(x)$ | $$\frac{2}{j\omega}$$ | also known as sign function |
| 5. | Unit step | $u_0(t)$ | $$\frac{1}{j\omega}+\pi\delta(\omega)$$ |  |
| 6. | Cosine | $\cos \omega_0 t$ | $\pi\left[\delta(\omega-\omega_0)+\delta(\omega+\omega_0)\right]$ |  |
| 7. | Sine | $\sin \omega_0 t$ | $j\pi\left[\delta(\omega-\omega_0)-\delta(\omega+\omega_0)\right]$ |  |
| 8. | Single pole | $e^{-at}u_0(t)$ | $$\frac{1}{j\omega + a}$$ | $a \gt 0$ |
| 9. | Double pole | $te^{-at}u_0(t)$ | $$\frac{1}{(j\omega + a)^2}$$ | $a\gt 0$ |
| 10. | Complex pole (cosine component) | $e^{-at}\cos\omega_0 t\;u_0(t)$ | $$\frac{j\omega + a}{((j\omega + a)^2+\omega^2}$$ | $a\gt 0$ |
| 11. | Complex pole (sine component) | $e^{-at}\sin \omega_0 t\;u_0(t)$ | $$\frac{\omega}{((j\omega + a)^2+\omega^2}$$ | $a\gt 0$ |
| 12. | Gating function (*aka* $\operatorname{rect}(T)$) | $A\left[u_0(t + T)-u_0(t -T)\right]$ | $$2AT\frac{\sin\omega T}{\omega T}$$ |  |
