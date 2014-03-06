%% FTEX1 - example of using fourier and ifourier in Matlab
%
% Example 1: Use Matlab to confirm the Fourier transform pair:
%    
% $$e^{-\frac{1}{2}t^2}\Leftrightarrow \sqrt{2\pi}e^{-\frac{1}{2}\omega^2}$$
%
syms t v w x;
ft = exp(-t^2/2);
Fw = fourier(ft)
%%
pretty(Fw)
%% 
% Check by computing the inverse using ifourier
ft = ifourier(Fw)
