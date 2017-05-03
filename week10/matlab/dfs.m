function [ Xk ] = dfs( xn, N )
% Computes Discrete Fourier Series
% -----------------------------------
% [Xk]  = dfs(xn, N)
% Xk = DFS coeff. array over 0 <= k <= N-1
% xn = N-point finite-duration sequence
%  N = fundamental period of DFS
%
n = [0:1:N-1];          % row vector for n
k = [0:1:N-1];          % row vector for k
WN = exp(-j*2*pi/N);    % Wn factor
nk = n'*k;              % creates an N by N matrix of nk values
WNnk = WN .^ nk;        % DFS matrix
Xk = xn * WNnk;         % row vector of DFS coefficients
