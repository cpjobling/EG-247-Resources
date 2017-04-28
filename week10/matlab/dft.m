function [ Xm ] = dft( xn, N )
% Computes Discrete Fourier Transform
% -----------------------------------
% [Xm]  = dft(xn, N)
% Xm = DFT coeff. array over 0 <= m <= N-1
% xn = N-point finite-duration sequence
%  N = length of DFT
%
n = [0:1:N-1]          % row vector for n
m = [0:1:N-1]          % row vector for m
WN = exp(-j*2*pi/N)    % Wn factor
nm = n'*m              % creates an N by N matrix of nm values
WNnm = WN .^ nm        % DFT matrix
Xm = xn * WNnm         % row vector of DFT coefficients