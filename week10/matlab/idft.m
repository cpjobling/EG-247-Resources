function [ xn ] = idft( Xk, N )
% Computes Inverse Discrete Fourier Transform
% -------------------------------------------
% [xn]  = idft(Xk, N)
% xn = N-point sequence over 0 <= n <= N-1
% Xk = DFT coeff. array over 0 <= k <= N-1
%  N = length of DFT
%
n = [0:1:N-1];          % row vector for n
k = [0:1:N-1];          % row vector for k
WN = exp(-j*2*pi/N);    % Wn factor
nk = n'*k;              % creates an N by N matrix of nk values
WNnk = WN .^ (-nk);     % DFT matrix
xn = (Xk * WNnk)/N;     % row vector for IDFT values

