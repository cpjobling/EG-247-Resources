%% Example 4 from Session on Inverse Z-Transform
%
% Example of long division to find sequence for inverse z-transform
%
% Prepared for EG-247 Signals and Systems
% by Dr Chris P. Jobling
%
%% Problem
%
% Use the long division method to determine $f[n]$ for $n = 0,\,1,\,\mathrm{and}\,2$, given that
% 
% $$F(z) = \frac{1 + z^{-1} + 2z^{-2} + 3z^{-3}}{(1 - 0.25z^{-1})(1 - 0.5z^{-1})(1 - 0.75z^{-1})}$$
% 
%
%% Solution
%
syms z n
sym_den = collect((z - 0.25)*(z - 0.5)*(z - 0.75))
den = sym2poly(sym_den);
num = [1, 1, 2, 3];
% inverse z-transform
%% Plot Sequence
fn = dimpulse(num,den,3)
%% Plot
dimpulse(num,den,16), grid
hold on
stem(fn,'r')
title('Discrete Time Step/Lollipop Plot for Example 4');
ylabel('f[n]')
xlabel('Sequence number n')
hold off