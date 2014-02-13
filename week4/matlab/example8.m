%% Computing the Matrix Exponential with Laplace
%
% Provided to EG-247 Signals and Systems
% by Chris Jobling
%
% It can be shown that
%
% $$\mathcal{L}e^{\bf{A}t} = \left(s\bf{I}-A\right)^{-1}$$
%
% and this gives us another way to find $e^{\bf{A}t}$.
%% Example 8
%
% Use Laplace transforms to find the state transition matrix for Example 6.
%
%% Solution
%
syms s t
A = [-4, -4; 3/4, 0];
phi_s = inv(s*eye(2)-A)
%%
phi_t = ilaplace(phi_s)