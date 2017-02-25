%% Lab Exercise 11 - Convolution
% Plot convolution of a piecewise linear function.
%
% Prepared for EG-247 by Chris P. Jobling
syms h tau t
%%
% rename heaviside function
u0(t)=heaviside(t)
%%
% define piecewise linear signals
h(t) = (-t + 1)*(u0(t)-u0(t-1));
%%
u(t) = u0(t)-u0(t-1);
%% First segment
% Integration from 0 to t:
conv1 = int(1*(-tau + 1),tau,0,t)
%% Second segment
% Integration from t - 1 to 1:
conv2 = int(1*h(tau),tau,t-1,1)
%% Plot
% note we use the results of the computations as equations for the plots.
t1 = linspace(0,1,100);
x = -(t1.*(t1 - 2))./2;
t2 = linspace(1,2,100);
y = (t2 - 2).^2./2;
plot(t1,x,t2,y)
grid
