% Karris Example 10.1
% To successfully run this script you will need to download the scripts dft.m and
% idft.m and make them available on your MATLABPATH.
xn = [1, 2, 2, 1]
Xm = dft(xn,4)
%%
xn = idft(Xm,4)