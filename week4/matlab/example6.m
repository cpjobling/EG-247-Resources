%% Solving State-Space System Time Responses in Matlab
% 
% For Modelling Systems in Statespace
% for EG-247 Signals and Systems
% by Chris Jobling
%
% Based on Example 5.10 of Steven T. Karris, Signals and Systems: With
% Matlab Computatiom and Simulink Modelling
%
%% Example 6
%
% For the RLC circuit shown in the notes, the initial conditions are $i_L(0^-)$=0, and $v_c(0^-)=0.5$ V. 
% Use the state variable method to compute $i_L(t)$ and $v_c(t)$.
%
% <html><img
% src="http://nbviewer.ipython.org/github/cpjobling/EG-247-Resources/blob/master/week4/pictures/example6.png"
% width="50%" title="RLC Circuit of Example 6" /></html>
% 
%
%% Sketch of solution
%
% See Example 5.10 for full solution.
%
% We chose $x_1=i_L$ and $x_2=v_c$ as our state variables which yields state equations
%
% $$\left[ {\begin{array}{*{20}{c}}
% {{{\dot x}_1}}\\
% {{{\dot x}_2}}
% \end{array}} \right] = \left[ {\begin{array}{*{20}{c}}
% { - 4}&{ - 4}\\
% {3/4}&0
% \end{array}} \right]\left[ {\begin{array}{*{20}{c}}
% {{x_1}}\\
% {{x_2}}
% \end{array}} \right] + \left[ {\begin{array}{*{20}{c}}
% 1\\
% 0
% \end{array}} \right]{u_0}(t)$$
%
syms t;
A = [-4, -4; 3/4, 0];
phi = expm(A*t);
pretty(phi)
%% Unforced response
% The state transition matrix is
%
% $$\phi (t) = \left[ {\begin{array}{*{20}{c}}
% { - \frac{1}{2}{e^{ - t}} + \frac{3}{2}{e^{ - 3t}}}&{ - 2{e^{ - t}} + 2{e^{ - 3t}}}\\
% { - \frac{3}{8}{e^{ - t}} + \frac{8}{8}{e^{ - 3t}}}&{ - \frac{3}{2}{e^{ - t}} - \frac{1}{2}{e^{ - 3t}}}
% \end{array}} \right]$$
%
% We multiply this by the initial condition matrix, to get the *unforced response* 
%
% $${{\bf{x}}_u}(t) = {e^{{\bf{A}}t}}\left[ {\begin{array}{*{20}{c}}
% 0\\
% {\frac{1}{2}}
% \end{array}} \right]$$
%
xu = phi*[0; 1/2];
pretty(xu)
%%
% $${{\bf{x}}_u}(t) = \left[ {\begin{array}{*{20}{c}}
% { - {e^{ - t}} + {e^{ - 3t}}}\\
% {\frac{3}{4}{e^{ - t}} - \frac{3}{4}{e^{ - 3t}}}
% \end{array}} \right]$$
%
%%  Forced response
%
% The forced response is trickier to compute by hand
%
% $${{\bf{x}}_f}(t) = \int_0^t {{e^{\bf{A}(t-\tau) }}B{u_0}(\tau )} d\tau $$
%
% but is easy with Matlab
syms tau
B = [4; 0];
xf = int(expm(A*(t-tau))*B*heaviside(tau),tau,0,t)
%%
% $${{\bf{x}}_f}(t) = \left[ {\begin{array}{*{20}{c}}
% {2{e^{ - t}} - 2{e^{ - 3t}}}\\
% {1 - \frac{3}{2}{e^{ - t}} + \frac{1}{2}{e^{ - 3t}}}
% \end{array}} \right]$$
%
%% Overall response
%
% The overall response is
%
% $${\bf{x}}(t) = {{\bf{x}}_u}(t) + {{\bf{x}}_f}(t)$$
%
x = xu + xf
%%
% $${\bf{x}}(t) = \left[ {\begin{array}{*{20}{c}}
% {{e^{ - t}} - {e^{ - 3t}}}\\
% {1 - \frac{3}{4}{e^{ - t}} + \frac{1}{4}{e^{ - 3t}}}
% \end{array}} \right]$$
%
% So
%
% $$x_1 = i_L = e^{-t}+e^{-3t}$$
%
% and
%
% $$x_2 = v_c = 1 - 0.75e^{-t} + 0.25e^{-3t}$$
%
% Which agrees with the text book.
%% Quick solution
%
% As a four-liner
syms t tau;
A = [-4, -4; 3/4, 0]; B = [4; 0]; x0 = [0; 1/2];
x = expm(A*t)*x0 + int(expm(A*(t-tau))*B*heaviside(tau),tau,0,t);
il = x(1), vc = x(2)