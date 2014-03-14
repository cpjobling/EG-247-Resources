%% Example 2
%
% Prepared for EG-247 Signals and Systems by 
% Dr C.P. Jobling
%
syms t w
H = j*w/(j*w + 2)
%%
Vin = fourier(5*exp(-3*t)*heaviside(t),t,w)
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
