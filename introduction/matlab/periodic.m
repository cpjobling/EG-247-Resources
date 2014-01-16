%% A Periodic signal (square wave)
t = linspace(0, 1, 500);
plot(t, square(2 * pi * 5 * t));
ylim([-2, 2]);
grid()
title('A Periodic Signal')
xlabel('Time t (s)')
ylabel('Amplitude')

