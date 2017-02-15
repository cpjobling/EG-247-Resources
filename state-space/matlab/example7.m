%% Transfer function from State-Space Model
%
% For EG-247 Signals and Systems
% by Chris Jobling
%
%% Example 7
%
% Give the transfer function for Example 6 assuming that the output 
% $y(t) = v_c(t)$ and find the step response of the circuit.
%
%% Solution
%
% if $y(t) = v_c(t)$
%
% $${\bf{C}} = [\begin{array}{*{20}{c}}
% 0&1
% \end{array}]$$
%
% and
%
% $$d = 0$$
%
syms t s
C = [0, 1]; d = 0;
G = C*inv(s*eye(2)-A)*B + d
%% Step response
%
U = laplace(heaviside(t));
vc = ilaplace(G*U)