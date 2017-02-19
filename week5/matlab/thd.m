%% Example to illustrate THD

t = linspace(0,4*pi,1000);
f = zeros(size(t));
clear C_k

%% Coefficients of sine terms
bk = [1,0.4,0.1,0.05,0.01];

for k = 1:length(bk)
    f = f + bk(k).*sin(k*t);
end
%%
plot(t,f)
title('Distorted sine wave')
%% Compute power spectrum
figure
for k = 1:length(bk)
    C_k(k) = j.*bk(k)./2
end
C_k = [conj(flipdim(C_k,2)),0,C_k];
%%
stem([-k:k],abs(C_k).^2)
axis([-5,5,0.,0.3])
title('Power Spectrum for Distorted Sine Wave')
ylabel('Frequency \Omega_0 [rad/s]')
ylabel('|C_k|^2')
hold off
