%% The rectangular pulse can be produced like so
x = [linspace(-2,-1,50) linspace(-1,1,100) linspace(1,2,50)];
y = [linspace(0,0,50) linspace(1,1,100) linspace(0,0,50)];
%% and the fft is produced as
stem(x, abs(fft(y)))
%% unwind 
stem(x, fftshift(fft(y)))
%% The inverse FFT is obtained with
stem(x, ifft(fft(y)))