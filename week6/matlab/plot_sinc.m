%% Plot the sinc function
% 
% Plots: 
% 
% $$sinc(u) = \frac{\sin \pi u}{\pi u},\; u \in \mathbb{R}$$
%
% Prepared for EG-247 Signals and Systems by
% Chris P. Jobling
%
x = linspace(-5,5,1000);
plot(x,sin(pi.*x)./(pi.*x))
grid
title('Graph of sinc function')
ylabel('sinc(u)')
xlabel('u')

