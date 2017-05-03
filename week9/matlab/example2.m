%% Example 2 from Session on Inverse Z-Transform
%
% PFE for a z-transfer function when there are repeated poles.
%
% Prepared for EG-247 Signals and Systems
% by Dr Chris P. Jobling
%
%% Problem
%
% Use the partial fraction expansion to compute the inverse z-transform of
%
% $$F(z) = \frac{12z}{(z+1)(z - 1)^2}$$
%
%% Solution
%
syms z n
Fz = 12*z/((z + 1)*(z - 1)^2)
fn = iztrans(Fz)
%%
iztrans(fn)
Fz = simplify(Fz)
% inverse z-transform
%% Plot Sequence
den = sym2poly(collect((z + 1)*(z - 1)^2));
num = [12, 0];
n = 1:15;
fn = dimpulse(num,den,20);
%% Plot
stem(fn),grid
title('Discrete Time Sequence f[n] = 6*n + 3*(-1)^n - 3');
ylabel('f[n]')
xlabel('Sequence number n')
%% Also plots impulse response
dimpulse(num,den,20), grid
title('Discrete Time Step (ZOH Output) Plot: f[n] = 6*n + 3*(-1)^n - 3');
ylabel('f[n]')
xlabel('Sequence number n')
