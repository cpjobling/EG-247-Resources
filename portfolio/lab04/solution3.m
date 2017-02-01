%% Solution for Week 3: Session 1: Example 3
% In the lecture we showed that after simplification for Example 3
%
% $$V_{\mathrm{out}}=\frac{2s(s+3)}{s^3 + 8s^2 + 10s + 4}$$
%
% We will use MATLAb to factorize the denominator $D(s)$ of the equation
% into a linear and a quadratic factor.
%
%% Find roots of D(s)
p = [1, 8, 10, 4];
roots(p)
%% Find quadratic form
syms s t
y = expand((s + 0.7146 - 0.3132j)*(s + 0.7146 + 0.3132j))
%% Simplify coefficient of s
3573/2500
%% Simplify constant term
3043737/5000000
%% Plot result
t=0:0.01:10;
Vout = 1.36.*exp(-6.57.*t)+0.64.*exp(-0.715.*t).*cos(0.316.*t)-1.84.*exp(-0.715.*t).*sin(0.316.*t);
plot(t, Vout); grid
title('Plot of Vout(t) for the circuit of Example 3')
ylabel('Vout(t) V'),xlabel('Time t s')
