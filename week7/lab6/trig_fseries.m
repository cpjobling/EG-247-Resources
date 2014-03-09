%% Calculation of Fourier coefficients for Square Wave
%
% Note the Fourier Series coefficients are computed using the period and
% fundamental frequency rather than the radian measures given in the
% lecture.
%
% Prepared for EG-247 Signals and Systems
% by Chris Jobling
%
clear all
%
%% Initialize problem
syms t n A
%% Set up problem
f = 1000;         % Hz
T0 = 1/f;          % s
omega_0 = 2*pi/T0; % rad/s
%% Define harmonics
k_max = 5;
%% Define f(t)
%
% !!!IMPORTANT!!!: the signal definition must cover [0 to T0] 
%
ft = A*(heaviside(t)-heaviside(t-T0/2)) - A*(heaviside(t-T0/2)-heaviside(t-T0)); 
%% Compute TFS
%
% Note that this can take considerable time (6 minutes or more) so be patient!
%
[a0, ak, bk, w] = TrigFourierSeries(ft, T0, k_max)
%% Reconstruct f(t) from harmonic sine functions
Ft = a0/2;
for k=1:k_max
    Ft = Ft + ak(k)*cos(w(k)*t) + bk(k)*sin(w(k)*t);
end
Ft
%% Make numeric
a0_num = subs(a0,A,1.0);
ak_num = subs(ak,A,1.0);
bk_num = subs(bk,A,1.0);
% print using 4 sig digits
a0_num = vpa(a0_num, 4)
ak_num = vpa(ak_num, 4)
bk_num = vpa(bk_num, 4)
%% plot result
ezplot(subs(Ft,A,1),[0,2*T0])
hold on
%% plot original signal
% (we could use |heaviside| for this as well)
%
t = [0,0,0,1/2,1/2,1/2,1/2,1,1,1,3/2,3/2,3/2,2,2,2]*T0;
f = [-1,0,1,1,1,0,-1,-1,0,1,1,0,-1,-1,0,1];
plot(t,f,'r')
grid
title('Square Wave Reconstructed from Sinewaves')
hold off

