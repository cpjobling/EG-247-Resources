%% Week 3: Solution 7
syms s;
%%
R1 = 200*10^3; 
R2 = 40*10^3;
R3 = 50*10^3;

C1 = 25*10^(-9);
C2 = 10*10^(-9);
%%
den = R1*((1/R1+ 1/R2 + 1/R3 + s*C1)*(s*R3*C2) + 1/R2);
simplify(den)
% 
% Result is: 100*s*((7555786372591433*s)/302231454903657293676544 + 1/20000) + 5
%%
% Simplify coefficient of s^2
a = 100*7555786372591433/302231454903657293676544
% Simplify coefficient of s
b = 100/20000
%
denG = [a, b, 5];
numG = -1;
%% Plot
w = 1:10:10000;
Gs = -1./(a*w.^2 - 5.*j.*b.*w + 5);
%
semilogx(w, abs(Gs))
xlabel('Radian frequency w (rad/s')
ylabel('|Vout/Vin|')
title('Magnitude Vout/Vin vs. Radian Frequency')
grid
