%% Example 1 Part 2 from Session on DT Models
%
% Impulse response of a transfer function
%
% Prepared for EG-247 Signals and Systems
% by Dr Chris P. Jobling
%
%% Problem
%
% The difference equation describing the input-output relationship of a DT system with zero initial conditions, is:
%
% $$y[n] - 0.5 y[n-1] + 0.125 y[n-2] = x[n] + x[n -1]$$
% 
% Part 2 Compute: The DT impulse response $h[n]$
%% Solution
% Numerator
Nz = [0 1 1] % $z + 1$
%%
% Denominator
Dz = [1 -0.5 0.125] % $z^2 - 0.5 z - 0.125$
%% Poles and residues
[r,p,k] = residue(Nz,Dz)
%% Response
Hz = tf([1 1 0],Dz,1)
hn = impulse(Hz, 15)
stem([0:15], hn)
grid
title('Example 1 - Part 2')
xlabel('n')
ylabel('Impulse response h[n]')
%% Response as stepwise continuous y(t)
impulse(Hz,15)
grid
title('Example 1 - Part 2 - As Analogue Signal')
xlabel('nTs [s]')
ylabel('Impulse response h(t)')
