%% Explore spectra of rectangular pulse as a function of duty cycle 
%
% Prepared for EG-247 by 
% C.P. Jobling
%% Duty cicle 50%
eta = 1/2;
t0 = 1;
T = 2*t0/eta;
%%
figure
k = -8:8;
stem(k.*(2*pi/T),(2*t0*sin(k.*(2*pi*t0/T))./(k.*(2*pi*t0/T))))
%% 
% Add envelope
hold on
omega_0 = 2*pi/T;
omega = linspace(-8*omega_0,8*omega_0,1000);
envelope = 2*t0*sin(omega.*t0)./(omega.*t0);
plot(omega,envelope,'r:')
grid
title('Duty cycle 50%')
xlabel('\omega [rad/s]')
ylabel('T C_k')
hold off
%% Duty cicle 12.5%
eta = 1/8;
t0 = 1;
T = 2*t0/eta;
%% 
figure
k = -32:32;
stem(k.*(2*pi/T),(2*t0*sin(k.*(2*pi*t0/T))./(k.*(2*pi*t0/T))))
%% 
% Add envelope
hold on
omega_0 = 2*pi/T;
omega = linspace(-32*omega_0,32*omega_0,1000);
envelope = 2*t0*sin(omega.*t0)./(omega.*t0);
plot(omega,envelope,'r:')
grid
title('Duty cycle 12.5%')
xlabel('\omega [rad/s]')
ylabel('T C_k')
hold off