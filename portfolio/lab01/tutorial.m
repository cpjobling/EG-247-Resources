%% Tutorial: Basic Matlab Functions for Representing Signals
% In this tutorial, you will learn how to use several MATLAB functions that 
% are frequently used to construct and represent signals. Although there are no 
% problems to be worked in this tutorial, you should duplicate all the examples 
% in MATLAB to give yourself practice with the commands.
%% Discrete-time (DT) Signals
% In general, signals will be represented in a row or column vector, depending 
% on the context. All vectors are represented in MATLAB are indexed starting with 
% 1, i.e. |y(1)| is the first element of the vector |y|. If these indices do not 
% correspond to those in your application, you an create an additional index vector 
% to properly keep track of the signal index. For example, to represent the discrete-time 
% (DT) signal:
% 
% $$$x[n] = \left\{ {\begin{array}{*{20}{c}} {2n,}&{ - 3 \le n \le 3,}\\ 
% {0,}&{{\rm{otherwise}}} \end{array}} \right.$$
% 
% You could first use the colon operator to define the index vector for the 
% non-zero samples of |x[n]|, and then define the vector |x| containing the values 
% of the signal at each of these time indices:
%%
n = [-3:3];
x = 2*n; 
%% 
% Note we have used semicolons at the end of each command to suppress unnecessary 
% echoing of the results.
% 
% To see the result, just type the variable name:

n
%% 
% ||
% 
% You can plot this signal by typing |stem(n,x)|. If you want to examine 
% the signal over a wider range of indices, you will need to extend both |n| and 
% |x|. For instance, if you want to plot the signal over $5\le n \le 5$, you can 
% extend the index vector n, then add additional elements to x for these new samples:

n = [-5:5]; 
x = [0 0 x 0 0]; 
%% 
% If you want to greatly extend the range of the signal, you may find it 
% helpful to use the function |zeros|. For instance, if you wanted to include 
% the region $-100 \le n \le 100$, after you had already extended |x| to include 
% $-5 \le n \le 5$ as shown above, you could type:

n = [-100:100];
x = [zeros(1,95), x, zeros(1,95)]; 
%% 
% Suppose you want to define $x_1[n]$ to be the discrete-tiem unit impulse 
% function and $x_2[n]$ to be a time advanced version of $x_1[n]$, i.e. $x_1[n] 
% = \delta[n]$ and $x_2[n]=\delta[n+2]$. You could represent these signals in 
% MATLAB by typing

nx1 = [0:10];
x1 = [1, zeros(1,10)];
%%
nx2 = [-5:5];
x2 = [zeros(1,3) 1 zeros(1,7)]; 
%% 
% You could then plot these signals by using |stem(nx1,x1)| and |stem(nx2,x2)|. 
% If you did not define the index vectors and simply typed |stem(x1)| and |stem(x2)| 
% you would make plots of the signals $\delta[n-1]$ and $\delta[n-4]$ and not 
% of the desired signals. The index vector will also be useful for keeping track 
% of the time origin of a vector when you work with more advanced exercises later.
%% Continuous-Time (CT) Signals
% We will explore two methods for representing continuous-time signals in MATLAB. 
% One method is to use the _Symbolic Math Toolbox_. You can also represent continuous-time 
% signals with vectors containing closely spaced samples of the signal in time. 
% In these labs exercises, the closely-spaced samples representing continuous-time 
% signals will always explicitly specify the time spacing to use to guarantee 
% an accurate representation of the signal. Vectors of closely-spaced time indices 
% can be created in a number of ways. Two simple menthods are to use the colon 
% operator with the optional step argument, and to use the |linspace| function. 
% For example, if you wanted to create a vector that covered the interval $-5 
% \le t \le 5$ in steps of $0.1$ seconds you could use |t=[-5:0.1:5]| or |t=linspace(-5,5,101)|.
%% Sinusoids and complex exponentials
% Sinusoids and complex exponentials are important signals in the study of linear 
% systems. MATLAB provides several functions that are useful for defining such 
% signals, especially if you have already defined either a discrete-time or continuous-time 
% index vector. For instance, if you wanted to form a vector to represent $x(t) 
% = \sin(\pi t/4)$ for $-5 \le t \le 5$, you could use the vector |t| defined 
% in the previous paragraph and type |x = sin(pi*t/4)|. Note that when the argument 
% to |sin| (or many other MATLAB functions such as |cos| or |exp|) is a vector, 
% the function returns a vector of the same size where each element of the output 
% vector is the function applied to the corresponding element of the imput vector.
% 
% You can use the |plot| command to plot your approximation to the continuous-time 
% function $x(t)$. Unlike |stem|, |plot| connects adjacent elements with a straight 
% line, so that when the time index is finely sampled, the straight lines are 
% a close approximation to the plot of the original continuous-time signal. For 
% this example you can generate such a plot by typing |plot(t,x)|. In general, 
% you will want to use |stem| to plot short discrete-time sequemnces, and |plot| 
% for sampled approximations of continuous-time signals or for very long discrete-time 
% signals where the number of stems grows unwieldy.
% 
% Discrete-time sinusoids and complex exponentials can also be generated 
% using |cos|, |sin| and |exp|. For example, to respresent the discrete-time signal 
% 
% $$x[n]=e^{j(\pi/8)n}$$ 
% 
% for $0\le n \le 32$ you would type:
%%
n = [0:32];
x = exp(j*(pi/8)*n);
%% 
% The vector |x| now contains the complex values of the signal $x[n]$ over 
% the interval $0\le n \le 32$. To plot complex signals, you can plot either the 
% real and imaginary parts, or magnitude and angle, separately.

stem(n,real(x))
%%
stem(n,imag(x))
%%
stem(n,abs(x))
%%
stem(n,angle(x)) 
%% 
% For the last example, note that value returned by angle is the phase of 
% the complex number in radians.To convert to degrees, type |stem(n,angle(x)*(180/pi))|.
% 
% Term-by-term vector operations MATLAB also alows you to add, subtract, 
% multiply and divide, scale and exponentiate signals. As lomg as the vectors 
% representing the signals have the same time-origins and the same number of elements. 
% E.g.,

x1 = sin((pi/4)*[0:15]); 
%%
x2 = cos((pi/7)*[0:15]); 
%% 
% you can perform the following term-by-term operations:

y1 = x1 + x2;
%%
y1 = x1 - x2;
%%
y1 = x1 .* x2;
%%
y1 = x1 ./ x2;
%%
y1 = 2 * x1;
%%
y1 = x1.^3; 
%% 
% Note that for multiplying, dividing and exponentiating on a term-by-term 
% basis you must precede the operator with a period '.', i.e. use the |.*| operator 
% rather than just |*| for term-by-term multiplication. MATLAB interprets the 
% |*| operator without a period to be matrix multiplication operator, not term-by-term 
% multiplication. For example if you try to multiply |x1| by |x2| using |*|, you 
% will get an error message:
%%
x1*x2
%% 
% This is because matrix multiplication requires that the number of columns 
% in the first argument match the number of rows in the second argumemt, which 
% is not true for two $1\times 5$ vectors |x1| and |x2|. You must also use |./| 
% and |.^| when operating on vectors term-by-term, since |/| and |^| are also 
% matric operations in MATLAB.
% 
% The print command allows you to |print| the current plot. You should type 
% help |print| to understand how it works on your system, as it will vary according 
% to the operating system and configuration of the computer you are using.
%% Labelling plots 
% MATLAB also includes sveral commands to help you to label plots appropriately, 
% as well as print them out. The title command places its argument over the current 
% plot as a title. The commands xlabel and ylabel allow you to label the axes 
% of your grapg, making kt clear what has been plotted. Every graph you generate 
% should have a title, as well as labels for both axes. For example, consider 
% again a plot of the following signal and index vector:
%%
n = [0:32];
x = exp(j*(pi/8)*n);
stem(n,angle(x)); 
%% 
% You could label your graph by typing

title('Phase of exp(j*(pi/8)*n)')
xlabel('n (samples)')
ylabel('Phase of x[n] (radians)')
%% M-files
% Another important feature of MATLAB is the ability to write M-files. There 
% are two types of M-files: functions and command scripts. A command script is 
% a text file of MATLAB commands whose filename ends in |.m| in the current directory 
% or elsewhere on your |MATLABPATH|. If you type the name of this file (without 
% the |.m|), the commands contained in the file will be executed. Using these 
% scripts will make it much easier to do the exercises in these labs. Many exercises 
% will require you to process several signals in a similar or identical way. If 
% you do not use scripts, you will have to retype all the commands again. If you 
% do the first probelm using a script, you can process all the subsequent signals 
% in the exercise by copying the script and editing it to process the new signal.
% 
% For example, suppose you had the following script |prob1.m| (see the resources 
% <http://prob1.m prob1.m>) to plot the discrete time signal $x_1[n] = \cos(\pi 
% n/4)$ and computer its mean over the interval $0 \le n \le 16$:
%%
% prob1.m 
n = [0:16]; 
x1 = cos(pi*n/4); 
y1 = mean(x1); 
stem(n,x1) 
title('x1 = cos(pi/4*n)') 
xlabel('n (samples)') 
ylabel('x1[n]') 
%% 
% If you then wanted to do the same for $x_2[n]=sin(\pi n/4)$, you could 
% copy |prob1.m| to |prob2.m|, then edit slightly to get:
%%
% prob2.m
n = [0:16]; 
x2 = sin(pi*n/4); 
y2 = mean(x2); 
stem(n,x2) 
title('x2 = sin(pi/4*n)') 
xlabel('n (samples)') 
ylabel('x2[n]') 
%% 
% You can then type |prob2| to run these commands and generate the desired 
% plot and compute the average value of the new signal. Instead of retyping all 
% 7 lines, you only had to edit about a dozen characters. We strongly encourage 
% you to use scripts in working through these laboratories, with a separate script 
% for each exercise, even each part of an exercise. Scripts also make debugging 
% your work easier, as you can fix one mistake and re-run the modified sequence 
% of commands. To encourage you to use scripts, we will ask you to attach your 
% solutions to each lab exercise to the lab portfolio as scripts. You must do 
% this in order to claim your marks.
% 
% MATLAB has another useful feature in that by adding some simple commands 
% as comments to your scripts, they can be _published_ as web pages, PDFs or word 
% documents, and the published documents will include all the graphs produced 
% in the run. You can add sub-sections and even mathematical notation. See |help 
% publish| for more details. Note comments are indicated in MATLAB by |%|. Anything 
% after |%| is ignored by MATLAB, but can contribute to the documentation of your 
% work.
%% Functions
% An M-file implementing a function is a text file ending in |.m| whose first 
% word is function. The rest of the first line of the file specifies the names 
% of the input and output arguments of the function. For example the following 
% M_file implements a function called |foo| which accepts an input |x| and returns 
% |y| and |z|, which are equal to |2*x| and |(5/9)*(x-32)|, respectively (see 
% <http://foo.m foo.m>):
% 
% |    function [y,z] = foo(x) |
% 
% |    % [y,z] = foo(x) accepts a numerical argument x and |
% 
% |    % returns two arguments y and z, where y = 2*x and |
% 
% |    % z = (5/9)*(x-32) |
% 
% |    y = 2*x; |
% 
% |    z = (5/9)*(x-32);|
% 
% |    end|
% 
% Two sample calls to |foo| are shown below:
%%
[y,z] = foo(-40)
%%
[y,z] = foo(212)
%% Conclusion 
% The commands described in this tutorial are by no means the complete set you 
% will need for this laboratory, but are instead meant to get you started using 
% MATLAB for signals and systems. Future lab exercises will assume that you are 
% comfortable using the commands discussed here, and that yiu are able to learn 
% about oyther mathematical functions in MATLAB by using either the manual or 
% the help and doc functions. Specialized functions for signal processing will 
% often be introduced in their own tutorials in later lab exercises. If you are 
% really stuck, you should work through the general MATLAB tutorial.