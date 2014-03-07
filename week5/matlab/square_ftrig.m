%% Calculation of Fourier coefficients for Square Wave
%
%
% Prepared for EG-247 Signals and Systems
% by Chris Jobling
%% Initialize problem
syms t n A pi
%% Set up problem
f = 1000;         % Hz
T = 1/f;          % s
omega_0 = 2*pi/T; % rad/s
%% Define harmonics
n = [1:11];
%% DC component
half_a0 = (1/T)*(int(A,t,0,T/2)+int(-A,t,T/2,T))
%% Compute harmonics
ai = (1/T)*(int(A*cos(n*omega_0*t),t,0,T/2)+int(-A*sin(n*omega_0*t),t,T/2,T))
bi = (1/T)*(int(A*sin(n*omega_0*t),t,0,pi)+int(-A*sin(n*omega_0*t),t,T/2,T))
%% Reconstruct f(t) from harmonic sine functions
ft = half_a0;
for k=1:length(n)
    ft = ft + ai(k)*cos(k*omega_0*t) + bi(k)*sin(k*omega_0*t);
end
ft
%% Make numeric
ft_num = subs(ft,A,1.0);
% print using 4 sig digits
ft_num = vpa(ft_num, 4)
%% plot result
ezplot(ft_num,[0,2*T])
hold on
%% plot original signal
% (we could use |heaviside| for this as well)
%
t = [-3,-2,-2,-2,-1,-1,-1,0,0,0,1,1,1,2,2,2,3]*T;
f = [-1,-1,0,1,1,0,-1,-1,0,1,1,0,-1,-1,0,1,1];
plot(t,f,'r-')
grid
title('Square Wave Reconstructed from Sinewaves')
hold off

