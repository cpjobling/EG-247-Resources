%% Example 1 from Session on Inverse Z-Transform
% Prepared for EG-247 Signals and Systems by Dr Chris P. Jobling
%% Problem
% Use the partial fraction expansion to compute the inverse z-transform of
% 
% $$F(z) = \frac{1}{(1 - 0.5z^{-1})(1 - 0.75z^{-1})(1 - z^{-1})}$$
%% Solution

syms z n
%% 
% The denominator of $F(z)$
%%
Dz = (z - 0.5)*(z - 0.75)*(z - 1);
%% 
% Multiply the three factors of Dz to obtain a polynomial
%%
Dz_poly = collect(Dz)
%% Make into a rational polynomial
% $$z^2$$
%%
num = [0, 1, 0, 0];
%% 
% $$$z^3 - 9/4 z^2 - 13/8 z - 3/8$$$
%%
den = sym2poly(Dz_poly) % 
%% Compute residues and poles
%%
[r,p,k] = residue(num,den);
%% Print results 
% |fprintf| works like the c-language function
%%
fprintf('\n')
fprintf('r1 = %4.2f\t', r(1)); fprintf('p1 = %4.2f\n', p(1));...
fprintf('r2 = %4.2f\t', r(2)); fprintf('p2 = %4.2f\n', p(2));...
fprintf('r3 = %4.2f\t', r(3)); fprintf('p3 = %4.2f\n', p(3));
%% Symbolic proof
% $$f[n] = 2\left(\frac{1}{2}\right)^n - 9\left(\frac{3}{4}\right)^n + 8$$
% 
% z-transform
%%
fn = 2*(1/2)^n-9*(3/4)^n + 8;
Fz = ztrans(fn)
%% 
% inverse Z-transform
%%
iztrans(Fz)
%% Sequence
%%
n = 1:15;
sequence = subs(fn,n);
stem(n,sequence)
title('Discrete Time Sequence f[n] = 2*(1/2)^n-9*(3/4)^n + 8');
ylabel('f[n]')
xlabel('Sequence number n')