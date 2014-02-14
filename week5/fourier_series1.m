% Introduction to Fourier Series
%
% Prepared for EG-247 Signals and Systems
% by Chris Jobling
%
%% Illustrates Development of a Signal from Harmonics
t=linspace(0,2*pi,1000);
first_harmonic = sin(t);
second_harmonic = 0.75*sin(2*t);
third_harmonic = 0.5*sin(3*t);
signal = harmonic_1 + harmonic_2 + harmonic_3;
%% First Harmonic
fig = plot(t,harmonic_1,'r-')
hold on
%% Second Harmonic
plot(t,harmonic_2,'g-.')
%% Second Harmonic
plot(t,harmonic_3,'m:')
%% Signal
plot(t,harmonic_1+harmonic_2+harmonic_3,'k')
%%
area(t,signal)
hold off
