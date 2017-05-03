%% FFT Example 2
% The triangular pulse is obtained with
x = linspace(-1,1,100);
y = [linspace(0,1,50) linspace(1,0,50)];
plot(x,y)
%% and the FFT is obtained with
stem(x, fftshift(fft(y)))
%% The inverse FFT is obtained with
stem(x, ifft(fft(y)))
