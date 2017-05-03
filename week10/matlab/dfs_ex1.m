clear all
L = 5; N = 20; k = [-N/2:N/2]; % Sq wave parameters
xn = [ones(1,L), zeros(1,N-L)]; % Sq wave x[n]
% Plot 3 cycles of sq wave
stem([xn,xn,xn])
axis([0,60,-0.5,1.5])
title('Three periods of x[n]')
xlabel('n'), ylabel('xtilde')
%% 
% Compute and plot Discrete Fourier Series $X(k)$ of $x[n]$

Xk = dfs(xn, N);                        % DFS
magXk = abs([Xk(N/2+1:N) Xk(1:N/2+1)]); % DFS magnitude
subplot(2,2,1); stem(k,magXk); axis([-N/2,N/2,-0.5,5.5])
xlabel('k'), ylabel('X[k])')
title('DFS of Sq. Wave: L=5, N=20')

%% 
% $$L=5, N= 40$$

L = 5; N = 40; k = [-N/2:N/2]; % Sq wave parameters
xn = [ones(1,L), zeros(1,N-L)]; % Sq wave x[n]Xk = dfs(xn, N);                        % DFS
Xk = dfs(xn, N);                        % DFS
magXk = abs([Xk(N/2+1:N) Xk(1:N/2+1)]); % DFS magnitude
subplot(2,2,2); stem(k,magXk); axis([-N/2,N/2,-0.5,5.5])
xlabel('k'), ylabel('X[k])')
title('DFS of Sq. Wave: L=5, N=40')
%% 
% $$L=5, N= 60$$

L = 5; N = 60; k = [-N/2:N/2]; % Sq wave parameters
xn = [ones(1,L), zeros(1,N-L)]; % Sq wave x[n]Xk = dfs(xn, N);                        % DFS
Xk = dfs(xn, N);                        % DFS                       % DFS
magXk = abs([Xk(N/2+1:N) Xk(1:N/2+1)]); % DFS magnitude
subplot(2,2,3); stem(k,magXk); axis([-N/2,N/2,-0.5,5.5])
xlabel('k'), ylabel('X[k])')
title('DFS of Sq. Wave: L=5, N=60')
%% 
% $$L=7, N= 60$$

L = 7; N = 60; k = [-N/2:N/2]; % Sq wave parameters
xn = [ones(1,L), zeros(1,N-L)]; % Sq wave x[n]Xk = dfs(xn, N);                        % DFS
Xk = dfs(xn, N);                        % DFS
magXk = abs([Xk(N/2+1:N) Xk(1:N/2+1)]); % DFS magnitude
subplot(2,2,4); stem(k,magXk); axis([-N/2,N/2,-0.5,7.5])
xlabel('k'), ylabel('X[k])')
title('DFS of Sq. Wave: L=7, N=60')