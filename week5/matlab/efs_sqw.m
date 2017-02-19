%% EFS_SQW
% Calculates the Exponential Fourier for a Square Wave with Odd Symmetry
%
clear all
%
%% Set up parameters
syms t A;

tau = 1;
T0 = 2*pi; % w = 2*pi*f -> t = 2*pi/omega
k_vec = [-5:5];

%% Define f(t)
%
% !!!IMPORTANT!!!: the signal definition must cover [0 to T0]
%
xt = A*(heaviside(t)-heaviside(t-T0/2)) - A*(heaviside(t-T0/2)-heaviside(t-T0));
%% Compute EFS
[X, w] = FourierSeries(xt, T0, k_vec)
%% plot the numerical results from Matlab calculation
% Convert symbolic to numeric result
Xw = subs(X,A,1);
%% plot
subplot(211)
stem(w,abs(Xw), 'o-');
title('Exponential Fourier Series for Square Waveform with Odd Symmetry')
xlabel('\Omega_0 (rad/sec)');
ylabel('|c_k|');
subplot(212)
stem(w,angle(Xw), 'o-');
xlabel('\Omega_0 (rad/sec)'); 
ylabel('\angle c_k [radians]');
