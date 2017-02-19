%% Waves and Symmetry
%
% Prepared for EG-247 Signals and Systems
% by Chris Jobling
%
%% Square wave
%
t = [-3*pi,-2*pi,-2*pi,-2*pi,-pi,-pi,-pi,0,0,0,pi,pi,pi,2*pi,2*pi,2*pi,3*pi];
f = [-1,-1,0,1,1,0,-1,-1,0,1,1,0,-1,-1,0,1,1];
plot(t,f)
axis([-10,10,-1.5,1.5])
grid
title('Square waveform')

%% Shifted square wave
t = [-3*pi,-2*pi,-2*pi,-2*pi,-pi,-pi,-pi,0,0,0,pi,pi,pi,2*pi,2*pi,2*pi,3*pi];
f = [-1,-1,0,1,1,0,-1,-1,0,1,1,0,-1,-1,0,1,1];
plot(t-pi/2,f)
axis([-10,10,-1.5,1.5])
grid
title('Shifted square waveform')

%% Sawtooth waveform
%
t = [-3*pi,-2*pi,-2*pi,-2*pi,-pi,0,0,0,pi,2*pi,2*pi,2*pi,3*pi];
f = [0,1,0,-1,0,1,0,-1,0,1,0,-1,0];
plot(t,f)
axis([-10,10,-1.5,1.5])
grid
title('Sawtooth waveform')

%% Triangular waveform
%
t = [-5*pi/2,-2*pi,-3*pi/2,-pi,-pi/2,0,pi/2,pi,3*pi/2,2*pi,5*pi/2];
f = [-1,0,1,0,-1,0,1,0,-1,0,1]
plot(t,f)
axis([-10,10,-1.5,1.5])
grid
title('Triangular waveform')

%% Fundamental
t = linspace(0,4*pi,100);
plot(t,sin(t))
grid
axis([0,4*pi,-1.5,1.5])
title('Fundamental')
%% Second harmonic
t = linspace(0,4*pi,100);
plot(t,sin(2*t),t,sin(t),'r:')
grid
axis([0,4*pi,-1.5,1.5])
title('Second Harnonic')
%% Third harmonic
t = linspace(0,4*pi,100);
plot(t,sin(3*t),t,sin(t),'r:')
grid
axis([0,4*pi,-1.5,1.5])
title('Third Harmonic')
