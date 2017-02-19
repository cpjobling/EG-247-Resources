function [a0, ai, bi, w] = TrigFourierSeries(ft, T0, k_max) 
% function [a0, ai, bi, w] = TrigFourierSeries(ft, T0, k_max) 
% 
% symbolically calculate the Trigonometric Fourier Series, and return the 
% numerical results 
% 
% ft: the time domain signal within one period; 
% it must have definition over [0, T0] 
% it must be a symbolic function of t % 
% T0: the period of the signal 
% k_max: the highest harmonic to be computed
 
syms t 
 
% zero'th coefficent (DC component)
A0 = (1/pi)*int(ft,t,0,T0);
for k = 1:k_max

 % Fourier series 
 Ai(k) = (1/pi)*int(ft*cos(2*pi*k*t/T0),t,0,T0);
 Bi(k) = (1/pi)*int(ft*sin(2*pi*k*t/T0),t,0,T0);
 % change the symbolic value to numerical value 
 ai(k) = subs(Ai(k)); 
 bi(k) = subs(Bi(k));
 % angular frequency 
 w(k) = k*2*pi/T0; 
end 
a0 = subs(A0);
 
