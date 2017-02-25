%% Example 4
%
% Prepared for EG-247 Signals and Systems by 
% Dr C.P. Jobling
%
syms t w
%% Calcuate energy from time function
Vr = 3*exp(-2*t)*heaviside(t);
R = 1;
Pr = Vr^2/R
Wr = int(Pr,t,0,inf)
%% Calculate using Parseval's theorem
Fw = fourier(Vr,t,w)
%%
Fw2 = simplify(abs(Fw)^2)
%%
Wr=2/(2*pi)*int(Fw2,w,0,inf)