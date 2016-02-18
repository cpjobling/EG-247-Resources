%% Lab Exercise 12
% State space model parameters
%
% Prepared for EG-247 by C.P. Jobling
%
%% RLC Model Parameters
% Note: I use Cap to avoid conflict with Output matrix C defined later
Cap = 4/3;   % F
R = 1;   % Ohm
L = 1/4; % H

%% State equations
A = [-R/L, -1/L; 1/Cap, 0]
B = [1/L; 0]
C = [0, 1]
D = 0

%% Transition matrix
syms t
phi_t = expm(A*t)

%% Initial conditions
x0 = [0; 1/2];

%% Unforced response
xu = phi_t * x0

%% Forced response
syms t tau
xf = phi_t * int(expm(-A*tau)*B*heaviside(tau),tau,0,t)
xf = simplify(xf)

%% State response
x = xu + xf

%% Output response
y = C*x + D*heaviside(t)

%% Plot
ezplot(y,[0,5]),grid
title('Step response Vc v Time for RLC circuit')
ylabel('Vc (V)')
xlabel('Time t (s)')
