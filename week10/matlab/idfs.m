function [ xn ] = idfs( Xk, N )
% Computes Inverse Discrete Fourier Series
% ----------------------------------------
% [xn]  = idfs(xn, N)
% xn = One period of periodic signal over 0 <= n <= N-1
% Xk = DFS coeff. array over 0 <= k <= N-1
%  N = fundamental period of Xk
%
n = [0:1:N-1];          % row vector for n
k = [0:1:N-1];          % row vector for k
WN = exp(-j*2*pi/N);    % Wn factor
nk = n'*k;              % creates an N by N matrix of nk values
WNnk = WN .^ (-nk);     % IDFS matrix
xn = (Xk * WNnk)/N;     % row vector of DFS coefficients
