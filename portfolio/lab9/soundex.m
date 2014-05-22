%% Basic Audio Data Manipulation
%
% Illustrates the basic audio file functions,
% and analysis plots.
%
%
% Audio file examples is music with vocal 2 from
% a collection made available for teaching by Dan Ellis
% of the Electrical Engineerin Department of Coumbia University.
% See: <http://www.ee.columbia.edu/~dpwe/sounds/>
%
% Script adapted for EG-247 Signals and Systems
% by Chris P. Jobling.
%
%% Read in the sound data
[x,Fs] = audioread('msmv2.wav');
% Fs is the sampling rate
% x is the data
length(x)
Fs
% i.e. 110250 samples = 5 seconds * 22050 samples/sec
%% Listen to it
soundsc(x,Fs);
%% Plot sample
plot(x)
%% Plot 50 cycles from middle of sample
stem([2000:2050],x(2000:2050))
%% Plot spectrum
deltaf=Fs/22050;
freq=-Fs/2:deltaf:Fs/2-deltaf;
plot(freq,abs(fftshift(fft(x,22050))),'linewidth',1)
xlabel('Analog Frequency (Hz)')
ylabel('Spectral Magnitude')
%% Look at the spectrogram (spectrum as a function of time)
figure
specgram(x,1024,Fs);
%% Filter
% Design a quick high-pass filter at 1000 Hz (relative to nyquist rate Fs/2)
[b,a] = ellip(8,1,50,1000/(Fs/2),'high');
% Pass it through the filter
df = filter(b,a,x);
%% See how spectrum has changed
figure
plot(freq,abs(fftshift(fft(df,22050))),'linewidth',1)
xlabel('Analog Frequency (Hz)')
ylabel('Spectral Magnitude')
%% See how the spectrogram is changed
figure
specgram(df,1024,Fs);
% Most of the energy below 1000 Hz has been removed
% Take a listen
soundsc(df,Fs);
% .. all the 'bass' is gone
% Write it out to a new soundfile
audiowrite('noBass.wav',df,Fs);
%% Close all figure windows
close all