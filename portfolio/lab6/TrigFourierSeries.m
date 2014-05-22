function [a0, ak, bk, w] = TrigFourierSeries(ft, T0, k_max) 
% function [a0, ai, bi, w] = TrigFourierSeries(ft, T0, k_max) 
% 
% symbolically calculate the Trigonometric Fourier Series, and
% return the coeffients a0, ak, and bk.
%
% Note for speed we use the Exponential Fourier series
% and then reconstruct the ak and bk terms from Ck.
% 
% ft: the time domain signal within one period; 
% it must have definition over [0, T0] 
% it must be a symbolic function of t % 
% T0: the period of the signal 
% k_max: the highest harmonic to be computed
 
syms t 
 
[Ck, w] = FourierSeries(ft, T0, k_max)
zero_index = floor(length(Ck)/2)+1;

a0 = Ck(zero_index)/2
for k = 1:k_max
  ak(k) = Ck(zero_index + k) + Ck(zero_index - k)
  bk(k) = j*(Ck(zero_index + k) - Ck(zero_index - k))
  % angular frequency 
  w(k) = k*2*pi/T0;
end
 
