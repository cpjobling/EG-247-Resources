%% Using MATLAB to Solve Inverse Laplace Transform Problems
%
% Inspired by Steven Karris, Signals and Systems: With MATLAB Computing and Simulink 
% Modelling, 5th Edition, Orchard Publications, 2012. 
% Ebook: <http://site.ebrary.com/lib/swansea/docDetail.action?docID=10547416 Karris, Signals and Systems>
%
% In this lab exercise we will demonstrate the definition and use of rational polynomials for the representation of 
% Laplace transforms, the use of the |residue| function to compute the residues of partial fraction expansions 
% using a worked example from the notes. We also demonstrate the use of the |ilaplace| function to solve inverse 
% Laplace transform problems. 
%
% We will conclude this exercise by asking you to use using the |ilaplace| function to find the inverse Laplace 
% transform for two typical non-trivial problems. 
%
% This next command opens the documentation for the |ilaplace| function. You may wish to leave this open for consulation
% as you work through these exercises.
doc ilaplace
%% Residues
% If you need to find the residues of a partial fraction expansion of a
% rational polynomial
%
% $$ F(s) = \frac{N(s)}{D(s)}$$
%
% you can use the |residue| function. For example, the residues of
% 
% $$F(s) = \frac{3s + 2}{s^2 + 3s + 2}$$
%
% are:
Ns = [3, 2];
Ds = [1, 3, 2];
[r,p,k]=residue(Ns,Ds)
%%
% This is interpreted as
% 
% $$F(s) = \frac{4}{s + 2} - \frac{1}{s + 1}$$
%% Plotting Inverse Laplace Transforms
% If we have the function in time domain we can plot it using a sequence like:
t = linspace(0,4.5,1000);
ft = 4.*exp(-2.*t)-exp(-1.*t);
plot(t,ft)
%%
% If the function is symbolic, we can use |ezplot|
syms s t;
ft = ilaplace(4/(s + 2) - 1/(s + 1))
ezplot(ft,[0,4.5])
%% The Inverse Laplace Function
% As illustrated above, the inverse laplace transform function
% is |ilaplace|
doc ilaplace
%%
% If we use the symbolic toolbox, we do not need to compute the residuals
% ourselves. The solution is available straight from $F(s)$
%
Fs = (3*s + 2)/(s^2 + 3*s + 2);
ft = ilaplace(Fs)
ezplot(ft,[0,4.5])
%% Factorising higher-order polynomials
% When computing Inverse Laplace Transforms of rational polynomials
% of order 3 or higher by hand, it is useful to be able to factorize the
% denominator using a computer.
% 
% Matlab provides two ways to do this using |roots| and |factor|.
% 
% The first is a numerical root finder, it needs the polynomial to have
% been defined as a row vector of the numerical coefficients in descending
% powers of s:
Ds1 = [1, 12, 44, 48];
roots(Ds)
%%
% The second is a symbolic function:
Ds2 = s^3 + 12*s^2 + 44*s + 48;
factor(Ds2)
%%
% As before though the solution is available to use directly in MATLAB
Ns2 = 3*s^2 + 2*s + 5;
Fs2 = Ns2/Ds2
pretty(Fs2)
%%
ft2 = ilaplace(Fs2)
pretty(ft2)
%% Complex Poles
% The |residue| function can deal with complex roots
[r,p,k] = residue([1, 3],[1, 5, 12, 8])
%%
% However, intepretation is tricky. The function |factor| returns quadratic
% factors
factor(s^3 + 5*s^2 + 12*s + 8)
%% 
% If we need the complex roots we can use:
roots([1, 4, 8])
%% |ilaplace| can cope with complex roots too!
Fs3 = (s + 3)/(s^3 + 5*s^2 + 12*s + 8);
ft3 = ilaplace(Fs3)
ezplot(ft3,[0,5])
%% Repeated Roots? - no problem!
%
% Find the inverse Laplace Transform of
%
% $$F_4(s) = \frac{s + 3}{(s + 2)^(s + 1)^2}$$
Fs4 = (s + 3)/((s + 2)*(s + 1)^2);
ft4=ilaplace(Fs4)
ezplot(ft4,[0,10])
%% 
% Check this result
Ns = [1, 3]; % Numerator
expand((s + 1)^2) % Expands (s + 1)^2 to s^2 + 2*s + 1;
d1 = [1, 2, 1]; % Coefficients of (s + 1)^2 =  s^2 + 2*s + 1 term in D(s)
d2 = [0, 1, 2]; % Coefficients of (s + 2) term in D(s)
Ds = conv(d1,d2); % Polynomial multiplication: gives expanded D(s)
[r,p,k] = residue(Ns,Ds)
%% Exercise 1
% Solve and plot the inverse Laplace Transform of
%
% $$F_5(s) \frac{s^2 + 3s + 1}{(s + 1)^3(s + 2)^2}$$
%% Exercise 2
% use the function |collect| to expand |(s + 1)^3 * (s + 2)^2| to
% a polynomial. Use this result and |residue| to verify the result of
% example 1.
%% Non-proper rational polynomials
%% Exercise 3
% Compute and (if possible) plot the Inverse Laplace Transform of
%
% $$F_6(s) = \frac{s^2 + 2s + 2}{s + 1}$$
%
% Use the |residue| function to validate the result.
%% Homework
% Use the tools developed in this lab to solve and plot the Inverse Laplace
% Transforms for your own selection of 
% problems from each of Questions 1 to Question 5 in the End of Chapter
% Exercises (Section 3.6 in the Text Book)
