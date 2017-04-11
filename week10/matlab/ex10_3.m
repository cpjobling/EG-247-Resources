%% Karris Example 10.3
%% Example 10.3
% Use MATLAB to compute the magnitude of the frequency components of the following 
% descrete time function.

xn = [1 1.5 2 2.3 2.7 3 3.4 4.1 4.7 4.2 3.8 3.6 3.2 2.9 2.5 1.8];
Xm = dft(xn,length(xn));
magXm = abs(Xm)
xn = idft(Xm,length(Xm))