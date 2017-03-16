function [Ck, w] = FourierSeries(ft, T0, k_max) 
% function [Ck, w] = FourierSeries(ft, T0, k_max) 
% 
% symbolically calculate the coefficients of the Exponential Fourier Series, 
% and return the symbolic results 
% 
% ft: the time domain signal within one period; 
% it must have definition over [0, T0] 
% it must be a symbolic function of t
% T0: the period of the signal 
% k_max: the index of the highest harmonic to be calculated 

syms t 

% Fourier series 
k_vec = -k_max:k_max;
Ck = int(ft*exp(-j*2*pi*k_vec*t/T0), t, 0, T0)/T0;
% angular frequency 
w = k_vec*2*pi/T0; 