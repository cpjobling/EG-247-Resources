# z-Transform Tables

|No. | **f[n]** | **F(z)** | **Region of Convergence** |
|---:|:--------:|:--------:|---------------------------|
| 1 | $$\delta[n]$$ | $$1$$ | |
| 2 | $$\delta[n-m]$$ | $$z^{-m}$$ | |
| 3 | $$a^nu_0[n]$$ | $$\frac{z}{z-a}$$ | $$|z| > a$$ |
| 4 | $$u_0[n]$$ | $$\frac{z}{z-1}$$ | $$|z| > 1$$ |
| 5 | $$(e^{-anT_s})u_0[n]$$ | $$\frac{z}{z-e^{-aT_s}}$$ | $$e^{-aT_s}z^{-1} < 1$$ |
| 6 | $$(\cos naT_s)u_0[n]$$ | $$\frac{z^2 - z\cos aT_s}{z^2 -2z\cos aT_s + 1}$$ | $$z| > 1$$ |
| 7 | $$(\sin naT_s)u_0[n]$$ | $$\frac{z\sin aT_s}{z^2 -2z\cos aT_s + 1}$$ | $$|z| > 1$$ |
| 8 | $$(a^n\cos naT_s)u_0[n]$$ | $$\frac{z^2 - az\cos aT_s}{z^2 -2az\cos aT_s + a^2}$$ | $$|z| > 1$$ |
| 9 | $$(a^n\sin naT_s)u_0[n]$$ | $$\frac{az\sin aT_s}{z^2-2az\cos aT_s + a^2}$$ | $$|z| > 1$$ |
| 10 | $$u_0[n]-u_0[n-m]$$ | $$\frac{z^m-1}{z^{m-1}(z-1)}$$ | |
| 11 | $$nu_0[n]$$ | $$\frac{z}{(z-1)^2}$$ | |
| 12 | $$n^2u_0[n]$$ | $$\frac{z(z+1)}{(z-1)^3}$$ | |
| 13 | $$[n+1]u_0[n]$$ | $$\frac{z^2}{(z-1)^2}$$ | |
| 14 | $$a^n n u_0[n]$$ | $$\frac{az}{(z-a)^2}$$ | |
| 15 | $$a^n n^2u_0[n]$$ | $$\frac{az(z+a)}{(z-a)^3}$$ | |
| 16 | $$a^n n[n+1]u_0[n]$$ | $$\frac{2az^2}{(z-a)^3}$$ | |
