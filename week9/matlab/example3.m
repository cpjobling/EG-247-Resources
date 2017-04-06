%% Example 3 from Session on Inverse Z-Transform
%
% PFE for a z-transfer function when there are complex poles.
%
% Prepared for EG-247 Signals and Systems
% by Dr Chris P. Jobling
%
%% Problem
%
% Use the partial fraction expansion to compute the inverse z-transform of
%
% $$F(z) = \frac{z + 1}{(z-1)(z^2 + 2z + 2)}$$
%
%% Solution
%
syms z n
Fz = (z + 1)/((z - 1)*(z^2 + 2*z + 2))
fn = iztrans(Fz)
pretty(fn)
%%
iztrans(fn)
Fz = simplify(Fz)
% inverse z-transform
%% Plot Sequence
den = sym2poly(collect((z - 1)*(z^2 + 2*z + 2)));
num = [1, 1];
n = 1:15;
fn = dimpulse(num,den,20);
%% Plot
stem(fn),grid
title('Discrete Time Sequence for Example 3');
ylabel('f[n]')
xlabel('Sequence number n')
%% Also plots impulse response
dimpulse(num,den,20), grid
title('Discrete Time Step Plot for Example 3');
ylabel('f[n]')
xlabel('Sequence number n')
