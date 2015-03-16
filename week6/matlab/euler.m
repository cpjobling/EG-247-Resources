%% Exponentials 
%% Plots $e^omega t$ to help in the visualization
% of the Exponential Fourier Series
%
% Prepared for EG-247 by 
% C.P. Jobling
%% The decaying exponential
t=linspace(0,4*pi,1000);
figure
plot(t,cos(t),t,sin(t))
hold on
% Real
plot([3*pi/4,2*pi+3*pi/4],[cos(3*pi/4),cos(2*pi+3*pi/4)],'o')
% Imaginary
plot([3*pi/4,2*pi+3*pi/4],[sin(3*pi/4),sin(2*pi+3*pi/4)],'o')
title('exp(j omega t)')
xlabel('omega t (rad)')
ylabel('cos(omega t) + jsin(omega t)')
grid
hold off
%% The phasor plot
figure
plot(cos(t),sin(t))
hold on
plot([cos(3*pi/4),cos(2*pi+3*pi/4)],[sin(3*pi/4),sin(2*pi+3*pi/4)],'o')
axis('square')
title('Phasor Plot')
ylabel('Imaginary')
xlabel('Real')
grid
hold off