% Define sample points
n = -15:18;
% Make space for the signal
xn = zeros(size(n));

% Compute the signal x[n]
for i = 1:length(xn)
    xn(i) = x(n(i));
end

% Plot the result
stem(n,xn)
axis([-15, 18, 0, 6])
title('Stem Plot for a Discrete Signal')
xlabel('Sample n')
ylabel('Signal x[n]')
grid


