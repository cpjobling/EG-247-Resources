%% Example 8
%
% (To read the Mathematics in the comments, *publish* this script.)
% 
% Recast Example 7 as a Simulink problem, but for simplicity use parameters 
% $R_1 = R_2 = R_3 = 1\; \Omega$, and $C_1 = C_2 = 1\;\mathrm{F}$. 
%
% Calculate the step response using transfer functions and check with Simulink.
%
% From a previous analysis the transfer function is:
%
% $$G(s) = \frac{V_\mathrm{out}}{V_\mathrm{in}} = \frac{-1}{R_1\left[(1/R_1 + 1/R_2 + 1/R_3 + sC_1)(sR_3C_2) + 1/R_2\right]}$$
%
% so substituting the component values we get:
%
% $$G(s) = \frac{V_\mathrm{out}}{V_\mathrm{in}} = \frac{-1}{s^2 + 3s + 1}$$
%
% We can find the step response by letting $v_\mathrm{in}(t) = u_0(t)$ so that
% $V_\mathrm{in}(s)=1/s$ then 
%
% $$V_\mathrm{out}(s) = \frac{-1}{s^2 + 3s + 1}.\frac{1}{s}$$
% 
% We can solve this by partial fraction expansion and inverse Laplace transform
% as is done in the text book with the help of Matlab's |residue| function.
%
% Here, however we'll use the LTI block that was introduced in the lecture.
%%
% Define the circuit as a transfer function
G = tf([-1],[1 3 1])
%% 
% step response is then:
step(G)
% Simples!
%% 
% Let's go a bit further by finding the frequency response:
bode(G)
