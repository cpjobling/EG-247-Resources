%% EFS_SQW
% Calculates the Exponential Fourier for a Square Wave with Odd Symmetry
%
clear all 
% 
%% Set up parameters
syms t A; 
%% Set up problem
f = 1000;         % Hz
T0 = 1/f;          % s
omega_0 = 2*pi/T0; % rad/s
%% Specify which harmonics we want
k_max = 11; 
%% Define f(t)
%
% !!!IMPORTANT!!!: the signal definition must cover [0 to T0] 
%
ft = A*(heaviside(t)-heaviside(t-T0/2)) - A*(heaviside(t-T0/2)-heaviside(t-T0)); 
%% Compute EFS
[Ck, w] = FourierSeries(ft, T0, k_max);
Ck
%% Reconstruct f(t) from expontial functions
Ft = 0;
for k=1:length(Ck)
    Ft = Ft + Ck(k)*exp(j*w(k)*t);
end
Ft = vpa(Ft,4)
%% plot the numerical results from Matlab calculation 
% Convert symbolic to numeric result
Ck_num = subs(Ck,A,1);
Ck_num = vpa(Ck_num, 4);
%% plot
% note we need to convert to double
subplot(211)
stem(w/(2*pi),abs(double(Ck_num)), 'o-'); 
title('Exponential Fourier Series for Square Waveform with Odd Symmetry')
xlabel('f (Hz)'); 
ylabel('|C_k|'); 
%%
subplot(212)
stem(w/(2*pi),angle(double(Ck_num)), 'o-'); 
xlabel('f (rad/sec)'); 
ylabel('\angle C_k [Hz]'); 

