%% Using MATLAB to Solve Laplace Transforms
%
% Inspired by Steven Karris, Signals and Systems: With MATLAB Computing and Simulink 
% Modelling, 5th Edition, Orchard Publications, 2012. 
% Ebook: <http://site.ebrary.com/lib/swansea/docDetail.action?docID=10547416 Karris, Signals and Systems>
%
%% The Laplace Transform
% MATLAB provides functions for computing Laplace Transforms in the
% Symbolic Toolbox. 
% 
% View (and read!) the documentation for |laplace|
doc laplace
%% Tranform Tables
% Let's start our exploration by verifying some simple transforms from the
% tables
syms s t f(t) a n;
%% 
% Dirac Delta
% $$\delta(t)$$
delta(t) = dirac(t);
laplace(delta(t))
%%
% Unit Step
% $$u_0(t)$$
u0(t) = heaviside(t);
laplace(u0(t))
%% Unit Ramp 
% $$u_1(t)$$
u1(t) = t*u0(t);
laplace(u1(t))
%% Parabolic function
% $$u_2(t)$$
u2(t) = t^2*u0(t);
laplace(u2(t))
%% General power of t 
% $$u_n(t)$$
un(t) = (t^n)*u0(t);
laplace(un(t))
%% What is gamma?
% See the development in Section 2.3.3 of the textbook
% $$\Gamma (n + 1) = n!$$
%
factorial(5) == gamma(5 + 1) % In MATLAB 1 == TRUE
%%
laplace((t^5)*u0(t))
