ToneFreq=1800;
Fs=44100;
Ts=1/Fs;
t=0:Ts:1-Ts;
N = length(t)
Tone=sin(2*pi*ToneFreq*t);
sound(Tone,Fs)
%% Fourier Transform:
X = fftshift(fft(Tone));
%% Frequency specifications:
dF = Fs/N;                      % hertz
f = -Fs/2:dF:Fs/2-dF;           % hertz
%% Plot the spectrum:
figure;
plot(f,abs(X)/N);
axis([-3000,3000,0,0.6])
xlabel('Frequency (in hertz)');
title('Magnitude Response');