% Introduction to Fourier Series
%
% Prepared for EG-247 Signals and Systems
% by Chris Jobling
%
%% Illustrates Development of a Signal from Harmonics
t=linspace(0,2*pi,1000);
fundamental = sin(t);
second_harmonic = 0.75*sin(2*t);
third_harmonic = 0.5*sin(3*t);
signal = fundamental + second_harmonic + third_harmonic;
%% Signal
area(t,signal)
hold on
%% First Harmonic
fig = plot(t,fundamental,'r-')
%% Second Harmonic
plot(t,second_harmonic,'g-.')
%% Second Harmonic
plot(t,third_harmonic,'m:')
%%
plot(t,signal),grid
title('Summation of a fundamental, second and third harmonic')
xlabel('Time (t) s')
hold off
