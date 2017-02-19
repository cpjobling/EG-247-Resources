%% Calculation of Fourier coefficients for Shifted Square Wave
%
% Exploiting half-wave symmetry
%
% Prepared for EG-247 Signals and Systems
% by Chris Jobling
%% Initialize problem
syms t n A pi
%% Define harmonics
n = [1:11];
%% DC component
half_a0 = 0
%% Compute harmonics - use half-wave symmetry
ai = 4/pi*int(A*cos(n*t),t,0,(pi/2))
bi = zeros(size(n))
%% Reconstruct f(t) from harmonic sine functions
ft = half_a0;
for k=1:length(n)
    ft = ft + ai(k)*cos(k*t) + bi(k)*sin(k*t);
end
ft
%% Make numeric
ft_num = subs(ft,A,1.0);
% print using 4 sig digits
ft_num = vpa(ft_num, 4)
%% plot result
ezplot(ft_num)
hold on
%% plot original signal
% (we could use |heaviside| for this as well)
%
t = [-3,-2,-2,-2,-1,-1,-1,0,0,0,1,1,1,2,2,2,3]*pi;
f = [-1,-1,0,1,1,0,-1,-1,0,1,1,0,-1,-1,0,1,1];
plot(t-pi/2,f,'r-')
axis([-10,10,-1.5,1.5])
grid
title('Shifted Square Waveform Reconstructed from Cosines')
hold off
