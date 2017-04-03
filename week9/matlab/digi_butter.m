wc = 2*pi*20e3
%%
Hs = tf(wc^2,[1 wc*sqrt(2), wc^2])
%%
bode(Hs,{1e4,1e8})
grid
%%
fs = 25.2e6/(2*pi)
%%
Ts = 1/fs
%%
Hz = c2d(Hs, Ts)
%%
step(Hz)