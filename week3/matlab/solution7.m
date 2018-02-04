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
% Simplify coefficient of s in denominator
format long
denG = sym2poly(ans)
%%
numG = -1;
%% Plot
% 
% For convenience, define coefficients $a$ and $b$:
a = denG(1);
b = denG(2);
%%
w = 1:10:10000;
%
% $$G(j\omega) = \frac{-1}{a\omega^2 - jb\omega + 5}$$
%
Gs = -1./(a*w.^2 - j.*b.*w + 5);
%
semilogx(w, abs(Gs))
xlabel('Radian frequency w (rad/s')
ylabel('|Vout/Vin|')
title('Magnitude Vout/Vin vs. Radian Frequency')
grid
