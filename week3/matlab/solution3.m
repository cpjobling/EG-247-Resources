%% Solution for Week 3: Session 1: Example 3
% In the lecture we showed that after simplification for Example 3
%
% $$V_{\mathrm{out}}=\frac{2s(s+3)}{s^3 + 8s^2 + 10s + 4}$$
% 
% We will use MATLAB to factorize the denominator $D(s)$ of the equation
% into a linear and a quadratic factor.
% 
%% Find roots of D(s)
p = [1, 8, 10, 4];
roots(p)
%% Find quadratic form
syms s t
y = expand((s - r(2))*(s - r(3)))
%% Simplify coefficients of s
y = sym2poly(y)
%% Plot result
t=0:0.01:10;
Vout = 1.36.*exp(r(1).*t)+0.64.*exp(real(r(2)).*t).*cos(imag(r(2)).*t)-1.84.*exp(real(r(3)).*t).*sin(-imag(r(3)).*t);
plot(t, Vout); grid
title('Plot of Vout(t) for the circuit of Example 3')
ylabel('Vout(t) V'),xlabel('Time t s')
%% Alternative solution using transfer functions
Vout = tf(2*conv([1, 0],[1, 3]),[1, 8, 10, 4])
%%
impulse(Vout)