%% EG-247 Signals and Systems: Lab 2 Elementary Signals
%
% This script file demonstrates the use of the |heaviside| and |dirac|
% functions. To run the code select the commands in the cells.
%
% This is also an example of the use of the publishing feature of MATLAB.
%
%% The Unit Step Function
%
% In the notes we define the unit step function as
%
% $${u_0}(t) = \left\{ {\begin{array}{*{20}{c}}
% {0\quad t < 0}\\
% {1\quad t > 0}
% \end{array}} \right.$$
%
% In MATLAB the unit step is defined using the |heaviside| function
doc heaviside
%%
% We can thus define and plot the unit step $u_0(t)$ with the command
syms t;
heaviside(t);
ezplot(ans,[-1,1]),grid
%%
% If we are only interested in the value of the function at a particular
% instant of time we can pass a number as the argument:
[heaviside(-1),heaviside(0),heaviside(1)]
%% Note that |heaviside(0)| returns the value $1/2$ which is not
% mathematically correct. The unit step function $u_o(t)$ is undefined at
% $t=0$.
%%
% The basic signal operations work as you'd expect
A = 2; T = 2;
v1 = A * heaviside(t - T);
ezplot(v1, [-1, 4]), grid
%% Part 1
% To validate Figure 1.8 in the textbook Karris (page 1-4) use the |heaviside|
% and |ezplot| functions to plot each of the following:
%
% # $-Au_0(t)$
% # $-Au_0(t-T)$
% # $-Au_0(t+T)$
% # $Au_0(-t)$
% # $Au_0(-t+T)$
% # $Au_0(-t-T)$
% # $-Au_0(-t)$
% # $-Au_0(-t+T)$
% # $-Au_0(-t-T)$
%% Part 2
% Use the |heaviside| and |ezplot| functionshow that $u_0(t) - u_0(t - 1)$
% represents the rectangular pulse shown in
% Figure 1.9 (a) in the textbook.
%% Part 3
% Use the |heaviside| and |ezplot| functions to validate equations
% 1.13, 1.14, 1.17 and 1.18 in the textbook.
%% The Ramp Function
% The integral of the *unit step* function is the *ramp function*
%
% $$u_1(t) = \int_{-\infty}^{t} u_0(\tau)d\tau$$
%
% Gives
%
% $${u_1}(t) = \left\{ {\begin{array}{*{20}{c}}
% {0\quad t < 0}\\
% {t\quad t > 0}
% \end{array}} \right. = t{u_0}(t)$$
%
% To verify this result:
syms tau
int(heaviside(tau),-inf, t)
%%
% Plot the ramp function
ezplot(t * heaviside(t), [-1,5]), grid
%
%% Part 4
% Use |ezplot| to plot $u_2(t)$ and $u_3(t)$ as defined on Page 1-10 of the
% textbook.
%% The Dirac Delta Function
% $\delta(t)$ is the derivative of $u_0(t)$
diff(heaviside(t),t)
%%
% It's not easy to plot the dirac delta function. We have to cheat a little
td = [-1,0,1]; delta = [0,1,0];
stem(td,delta)
%% Part 5
% Use Matlab to solve Examples 1.8 and 1.9 from the textbook.
% Don't Forget to Save Your Work!
