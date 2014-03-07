%% Calculation of Fourier coefficients for Square Wave
%
%
% Prepared for EG-247 Signals and Systems
% by Chris Jobling
syms t n A pi

n = [1:11];
%% DC component
half_a0 = 1/(2*pi)*(int(A,t,0,pi)+int(-A,t,pi,2*pi))
%% Compute harmonics
ai = 1/pi*(int(A*cos(n*t),t,0,pi)+int(-A*cos(n*t),t,pi,2*pi))
bi = 1/pi*(int(A*sin(n*t),t,0,pi)+int(-A*sin(n*t),t,pi,2*pi))
%%
% Reconstruct f(t) from harmonic sine functions
ft = half_a0;
for k=1:length(n)
    ft = ft + ai(k)*cos(k*t) + bi(k)*sin(k*t)
end
ft
%% Make numeric
ft_num = subs(ft,A,1.0)
%%
% print using 4 sig digits
ft_num = vpa(ft_num, 4)
%%
% plot result
ezplot(ft_num)
hold on
%% plot original signal
% (we could use |heaviside| for this as well)
%
t = [-3,-2,-2,-2,-1,-1,-1,0,0,0,1,1,1,2,2,2,3]*pi;
f = [-1,-1,0,1,1,0,-1,-1,0,1,1,0,-1,-1,0,1,1];
plot(t,f,'r-')
grid
title('Square Wave Reconstructed from Sinewaves')
hold off

