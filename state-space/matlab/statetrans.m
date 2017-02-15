% STATETRANS - find the state transmission matrix using the symbolic toolbox
%
% A small piece of code can be used to find the state transition matrix $\exp(At)$ 
% given the coefficient matrix $A$, using MATLAB's Symbolic Toolbox.
%
% Source Vivek Saxena
% <http://viveks.wikidot.com/using-matlab-to-find-the-state-transition-matrix>
function [phi] = statetrans(A)
   t = sym('t');
   phi = expm(A * t);
end