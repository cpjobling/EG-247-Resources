%% FFT Example 1
% The rectangular pulse is obtained with
x = [linspace(−2,−1,100) linspace(−1,1,100) linspace(1,2,100)];
y = [linspace(0,0,100) linspace(1,1,100) linspace(0,0,100)];
plot(x,y)
% and the FFT is produced with
plot(x, fft(y))
%The Inverse FFT is produced with
plot(x,ifft(fft(y)))
