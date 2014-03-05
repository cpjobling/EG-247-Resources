%% Exponentials 
%% Plots $e^omega t$ to help in the visualization
% of the Exponential Fourier Series
%
% Prepared for EG-247 by 
% C.P. Jobling
%% The decaying exponentail
t=linspace(-1,2,1000);
figure
plot(t,exp(t),t,exp(0.*t),t,exp(-t))
axis([-1,2,-1,8])
title('exp(at) -- a real')
xlabel('t (s)')
ylabel('exp(t) and exp(-t)')
legend('exp(t)','exp(0)','exp(-t)')
grid
hold off
