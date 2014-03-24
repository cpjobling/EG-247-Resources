%% Filters Lab
%
% Based on a script by David Dorran.
% The original script is available at <http://dadorran.wordpress.com>.
% Search for "filtering matlab demo".
%
% Adapted for EG-247 Signals and Systems
% by Chris P. Jobling
%
%% Basic parameters
% We will be designing a digital filter and plotting frequency spectra
% using a digital technique called the Fast Fourier Transform. So we need
% to define our sampling times, etc.
%
% Note we are doing this in advance of presenting sampling theory!
Ts = 0.001;   % sampling time
fs = 1/Ts;    % sampling frequency in Hz
ws = 2*pi*fs; % sampling frequency in rad/s
%% Signal with noise
% generate the noisy signal which will be filtered
f0 = 12;      % Hz
t = 0:Ts:1.23; 
x = cos(2*pi*f0*t)
x(end) = []; % removes last element
%% 
% Additive noise is simulated by band-passing a random signal between
% $0.6\omega_s$ and $0.7\omega_s$
[b a] = butter(2,[0.6 0.7],'bandpass');
filtered_noise = filter(b,a,randn(1, length(x)*2));
x = (x + 0.5*filtered_noise(500:500+length(x)-1))/length(x)*2;
%%
plot(x)
title('Noisy signal')
xlabel('Samples');
ylabel('Amplitude')
%% Frequency spectrum
% Plot magnitude spectrum of the signal.
% In interpreting this plot note that the DFT bin number is
% related to the number of samples in the original
% signal which happens to be 1230 in this case.
% 
% Also, the frequency range is normaized to 0-$\omega_s$.
X_mags = abs(fft(x));
figure(10)
plot(X_mags)
xlabel('DFT Bins')
ylabel('Magnitude')
%% 
% We now plot the first half of DFT (normalised frequency)
% after converting the bin number to its corresponding frequency.
% Note 1 corresponds to half the sampling frequency.
figure(10)
num_bins = length(X_mags);
plot([0:1/(num_bins/2 -1):1], X_mags(1:num_bins/2))
xlabel('Normalised frequency (\pi rads/sample)')
ylabel('Magnitude')
%% 
% If we prefer, we can also plot the DFT in Hz.
%
% Note I've plotted a line at f0 as a verification of this result.
figure(11)
plot((fs/2)*[0:1/(num_bins/2 -1):1], X_mags(1:num_bins/2),[f0,f0],[0,0.5])
xlabel('Frequency (Hz)')
ylabel('Magnitude')
%% Butterworth filter
% Design a second order filter using a butterworth design technique.
% The first argument is the order of the filter
% The second argument is the cut-off frequency Wn normalized
% to half the sampling frequency. That is 0 < Wn < 1 where $1 =
% \omega_s/2$.
% The third argument is the type of filter.
%
% See the documentation for more information 'doc butter'.
%%
% In the spectrum we obtained previously, the noise occurs between
% 0.5 and 0.7 on the noramized frequency scale, so we choose 0.3 as Wn.
[b a] = butter(2, 0.3, 'low')
%%
%plot the frequency response (normalised frequency)
H = freqz(b,a, floor(num_bins/2));
figure(10)
hold on
plot([0:1/(num_bins/2 -1):1], abs(H),'r');
%%
% You should examine the filter response to confirm that the cut-off
% frequency (when magnitude H(jw) = 0.707) is 0.3.
%Redesign the filter using a higher order filter
%%
%filter the signal using the b and a coefficients obtained from
%the butter filter design function
x_filtered = filter(b,a,x);
%%
%plot the filtered signal
figure(2)
plot(x_filtered,'r')
title('Filtered Signal - Using Second Order Butterworth')
xlabel('Samples');
ylabel('Amplitude')
%% Design a higher order filter
[b2 a2] = butter(20, 0.3, 'low')
%%
%Plot the magnitude spectrum and compare with lower order filter
H2 = freqz(b2,a2, floor(num_bins/2));
figure(10)
hold on
plot([0:1/(num_bins/2 -1):1], abs(H2),'g');
%%
%filter the noisy signal and plot the result
x_filtered2 = filter(b2,a2,x);
figure(3)
plot(x_filtered2,'g')
title('Filtered Signal - Using 20th Order Butterworth')
xlabel('Samples');
ylabel('Amplitude')
%% Band reject filter
%Use a band reject filter in place of a low pass filter
[b_stop a_stop] = butter(20, [0.5 0.8], 'stop');
%%
%plot the magnitude spectrum
H_stopband = freqz(b_stop,a_stop, floor(num_bins/2));
figure(10)
hold on
plot([0:1/(num_bins/2 -1):1], abs(H_stopband),'c');
%%
%plot filtered signal
x_filtered_stop = filter(b_stop,a_stop,x);
figure(4);
plot(x_filtered_stop,'c')
title('Filtered Signal - Using Stopband')
xlabel('Samples');
ylabel('Amplitude')
%% Matlab's filter design 
%Use matlabs built-in buttord function to get the optimum order to meet a specification
[N Wn] = buttord(0.1, 0.5, 5, 40)
%%
%use the N and Wn values obtained above to design the filter in the usual way
[b3 a3] = butter(N, Wn, 'low');
%%
%plot the magnitude spectrum
H3 = freqz(b3,a3, floor(num_bins/2));
figure(10);
hold on
plot([0:1/(num_bins/2 -1):1], abs(H2),'k');
figure(10)
%%
%filter the signal and plot the ouput of the filter
x_filtered3 = filter(b3,a3,x);
figure(5);
plot(x_filtered3,'k')
title(['Filtered Signal - Using ' num2str(N) ' th Order Butterworth'])
xlabel('Samples');
ylabel('Amplitude')
%% Other Filter Types
% comparison with other filter design techniques (chebyshev and elliptical)
[b_butter a_butter] = butter(4, 0.2, 'low');
H_butter = freqz(b_butter, a_butter);
 
[b_cheby a_cheby] = cheby1(4, 0.5, 0.2, 'low');
H_cheby = freqz(b_cheby, a_cheby);
 
[b_ellip a_ellip] = ellip(4, 0.5, 40, 0.2, 'low');
H_ellip = freqz(b_ellip, a_ellip);
%%
%plot each filter to compare 
figure(11)
norm_freq_axis = [0:1/(512 -1):1];
plot(norm_freq_axis, abs(H_butter))
hold on
plot(norm_freq_axis, abs(H_cheby),'r')
plot(norm_freq_axis, abs(H_ellip),'g')
legend('Butterworth', 'Chebyshev', 'Elliptical')
xlabel('Normalised Frequency');
ylabel('Magnitude')
%%
%plot in dB for verification that spec is met
figure(12);
plot(norm_freq_axis, 20*log10(abs(H_butter)))
hold on
plot(norm_freq_axis, 20*log10(abs(H_cheby)),'r')
plot(norm_freq_axis, 20*log10(abs(H_ellip)),'g')
legend('Butterworth', 'Chebyshev', 'Elliptical')
xlabel('Normalised Frequency ');
ylabel('Magnitude (dB)')
%% GUI for filter design
% Matlab provides a filter design tool. Use it to design
% and test a low-pass butterworth filter with sampling frequency equal to your
% student number whose cut-off frequency (in Hz) is
% equal to the nearest whole number to your student number times 0.2 and whose stop band 
% the nearest whole number to your student number times 0.5. 
% The filter should have 3dB in the pass band and 60 dB in the stop band.
%
% Save the result as lab9.mat and submit this for assessment along with a script lab9.m that demonstrates
% that the filter has the correct pass band, stop band and cut-off frequency behaviour.
fdatool