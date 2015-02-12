%% Example 5 - non proper fraction
Ns = [1, 2, 2];
Ds = [1 1];
[r, p, k] = residue(Ns, Ds)

%% Symbolic toolbox solution
syms s;
F5 = (s^2 + 2*s + 2)/(s + 1);
f5 = ilaplace(F5)
