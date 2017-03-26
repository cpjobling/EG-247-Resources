%  Three Band Graphic EQ design and Simulink Controller  (MB 3/26/2013)

clear 
close all

fc = [31.5, 63, 125, 250, 500, 1000, 2000, 4000, 8000, 16000];
Q = 0.707;

f2 = fc*sqrt(1+1/(4*Q^2)) + fc/(2*Q); 

[B1,A1] = butter(8,0.06, 'low');
[B2,A2] = butter(8,[0.04 0.2]);
[B3,A3] = butter(8,0.165, 'high');

[H1,W1] = freqz(B1,A1,512);
[H2,W2] = freqz(B2,A2,512);
[H3,W3] = freqz(B3,A3,512);

subplot(211)
plot(W1/pi, abs(H1), W2/pi,abs(H2), W3/pi,abs(H3))
grid on
title('Freq Response of individual filters')
xlabel('Freq/Nyquist Freq')
ylabel('lin Mag')

absH = abs(H1)+abs(H2)+abs(H3);

%absH = 2*abs(H1)+2*abs(H2)+1.4*abs(H3);

subplot(212)
plot(W1/pi, 20*log10(absH))
axis([0 1 -10 10])
grid on
title('Freq Response of sum of filters')
xlabel('Freq/Nyquist Freq')
ylabel('20log Mag')

sim('Three_Band_EQ_Model')

