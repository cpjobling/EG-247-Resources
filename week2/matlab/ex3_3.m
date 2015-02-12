% Example 3.3 - Quadratic factors

syms s t;
factor(s^3 + 5*s^2 + 12*s + 8)

p = [1 4 8]
roots_p = roots(p)

syms a w t s;
Fs = (s + 3)/(s^3 + 5*s^2 + 12*s + 8)
ft = ilaplace(Fs)