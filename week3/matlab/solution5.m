%% Example 5: Verification of Solution
syms s;

z1 = 13*s + 8/s;
z2 = 5*s + 10;
z3 = 20 + 16/s;

z = z1 + z2 * z3 /(z2 + z3)
%%
z10 = simplify(z)
%%
pretty(z10)
%% Admittance
y10 = 1/z10;
pretty(y10)
