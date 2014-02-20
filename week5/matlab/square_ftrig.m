%% Calculation of Fourier coefficients for Square Wave
%
%
% Prepared for EG-247 Signals and Systems
% by Chris Jobling
syms t n A pi
%% DC component
a0 = 1/(2*pi)*(int(A,t,0,pi)+int(-A,t,pi,2*pi))
%% First harmonics cosines and sines
a1 = 1/pi*(int(A*cos(t),t,0,pi)+int(-A*cos(t),t,pi,2*pi))
b1 = 1/pi*(int(A*sin(t),t,0,pi)+int(-A*sin(t),t,pi,2*pi))
%% Second harmomics
a2 = 1/pi*(int(A*cos(2*t),t,0,pi)+int(-A*cos(2*t),t,pi,2*pi))
b2 = 1/pi*(int(A*sin(2*t),t,0,pi)+int(-A*sin(2*t),t,pi,2*pi))
%% Third harmonic
a3 = 1/pi*(int(A*cos(3*t),t,0,pi)+int(-A*cos(3*t),t,pi,2*pi))
b3 = 1/pi*(int(A*sin(3*t),t,0,pi)+int(-A*sin(3*t),t,pi,2*pi))
%% Fifth, seventh, ninth, eleventh harmonic
% Having determined that cosine tems are zero (squarewave is an odd function)
% and also that signal has half-wave symmetry so even terms are also zero
% we can just calculate the coefficients of the 5th, 7th, 9th and 11th harmonics
b5 = 1/pi*(int(A*sin(5*t),t,0,pi)+int(-A*sin(5*t),t,pi,2*pi))
b7 = 1/pi*(int(A*sin(7*t),t,0,pi)+int(-A*sin(7*t),t,pi,2*pi))
b9 = 1/pi*(int(A*sin(9*t),t,0,pi)+int(-A*sin(9*t),t,pi,2*pi))
b11 = 1/pi*(int(A*sin(11*t),t,0,pi)+int(-A*sin(11*t),t,pi,2*pi))
%%
% Reconstruct f(t) from harmonic sine functions
ft = subs(b1*sin(t) + b3*sin(3*t) + b5*sin(5*t) + b7*sin(7*t) + b9*sin(9*t) + b11*sin(11*t),A,1.0);
%%
% print using 4 sig digits
ft_num = vpa(ft, 4)
%%
% plot result
ezplot(ft)
hold on
t = [-3*pi,-2*pi,-2*pi,-2*pi,-pi,-pi,-pi,0,0,0,pi,pi,pi,2*pi,2*pi,2*pi,3*pi];
f = [-1,-1,0,1,1,0,-1,-1,0,1,1,0,-1,-1,0,1,1];
plot(t,f,'r-')
grid
title('Square Wave Reconstructed from Sinewaves')

