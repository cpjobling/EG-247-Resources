%% Example 5 Part 3 from Session on DT Models
% Step response of a transfer function
% 
% Prepared for EG-247 Signals and Systems by Dr Chris P. Jobling
%% Problem
% The difference equation describing the input-output relationship of a DT system 
% with zero initial conditions, is:
% 
% $$y[n] - 0.5 y[n-1] + 0.125 y[n-2] = x[n] + x[n -1]$$
% 
% Part 3 Compute: The DT step response
%% Solution
% Numerator
% 
% $$z^2+z$$

Nz = [1 1 0]
%% 
% Denominator
%%
syms z
Dz = (z^2 - 0.5*z + 0.125)*(z - 1);
%%
collect(Dz)
%%
Dz = sym2poly(Dz)
%% Poles and residues
%%
[r,p,k] = residue(Nz,Dz)
%% Response
%%
Ts = 1 % sampling time
z = tf('z', Ts); % define z in symbolic form
Hz = (z^2 + z)/(z^2 - 0.5*z + 0.125)
yn = step(Hz, 15)
stem([0:15], yn)
grid
title('Example 5 - Part 3')
xlabel('n')
ylabel('Step response y[n]')
%% Response as stepwise continuous y(t)
%%
step(Hz,15)
grid
title('Example 5 - Part 3 - As Analogue Signal')
xlabel('nTs [s]')
ylabel('Step response y(t)')
axis([0,15,0,3.5])