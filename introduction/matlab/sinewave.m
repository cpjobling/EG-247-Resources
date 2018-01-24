%% Sinusoid Example from Lecture 1
%  Here's the code to compute and plot the sinusoidal signal
% $3 \cos(2\pi \cdot 2t - 3\pi/4)$

%% Define t
t = linspace(0, 1, 100);
%% Define x
x = 3 * cos(2*pi*2*t - 3*pi/4);
%% Plot result
plot(t,x)
title('A Sinusoidal Signal')
xlabel('Time t (s)')
ylabel('Amplitude')
grid