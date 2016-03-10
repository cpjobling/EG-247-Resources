%% Lab Exercise 14 - Convolution
% Plot convolution of a piecewise linear function.
%
% Prepared for EG-247 by Chris P. Jobling
syms h tau t
h(t) = (-t + 1)*(heaviside(t)-heaviside(t-1));
u(t) = heaviside(t)+heaviside(t-1);
%% First segment
% Integration from 0 to t:
conv1 = int(1*(-tau + 1),tau,0,t)
%% Second segment
% Integration from t - 1 to 1:
conv2 = int(1*h(tau),tau,t-1,1)
%% Plot
t1 = linspace(0,1,100);
x = -(t1.*(t1 - 2))./2;
t2 = linspace(1,2,100);
y = (t2 - 2).^2./2;
plot(t1,x,t2,y)
grid
