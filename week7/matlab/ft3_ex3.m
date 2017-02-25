%% Example 3
%
% Prepared for EG-247 Signals and Systems by 
% Dr C.P. Jobling
%
syms t w
H = 10/(j*w + 4)
%%
Vin = fourier(3*exp(-2*t)*heaviside(t),t,w)
%%
Vout=simplify(H*Vin)
%%
vout = simplify(ifourier(Vout,w,t))
%% Plot result
ezplot(vout)
title('Solution to Example 2')
ylabel('v_{out}(t) [V]')
xlabel('t [s]')
grid 
