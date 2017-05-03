xn = [ 1, 2, 3, 2.5, 1.5, 0.5,...
    -0.5, -1.5, -2.5, -0.5,...
    0.25, 1.25, 2, 1.5, 1, 0.5];

subplot(2,1,1),stem([0:15],xn),xlabel('n'),ylabel('x[n]'),title('Discrete Time Sequence')

Xm = dft(xn,16);

subplot(2,1,2),stem([0:15],abs(Xm)),xlabel('m'),ylabel('|X[m]|'),title('Discrete Frequency Sequence')

