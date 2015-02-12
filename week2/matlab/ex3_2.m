% Example 2 - Cubic
syms s t;
factor(s^3 + 12*s^2 + 44*s + 48)


F2 = (3*s^2 + 4*s + 5)/(s^3 + 12*s^2 + 44*s + 48);
f2 = ilaplace(Fs)
