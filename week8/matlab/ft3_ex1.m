%% Example 1
%
% Prepared for EG-247 Signals and Systems by 
% Dr C.P. Jobling
%
syms t w
U1 = fourier(2*heaviside(t),t,w)
%%
H = fourier(3*exp(-2*t)*heaviside(t),t,w)
%%
Y1=simplify(H*U1)
%%
y1 = simplify(ifourier(Y1,w,t))
%% Get y2
% substitute t-3 into t.
y2 = subs(y1,t,t-3)
%%
y = y1 - y2
%% Plot result
ezplot(y)
title('Solution to Example 1')
ylabel('y(y)')
xlabel('t [s]')
grid 
