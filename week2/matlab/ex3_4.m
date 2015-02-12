%% Example 3.4 - Repeated Poles

syms s;

% Coefficients of the numberator $N(s)$ of $F(s)$
Ns = [1 3];
% Expands $(s + 1)^2$ to $(s^2 + 2s + 1)$
expand((s + 1)^2)
%% 

% Coefficients of $(s^2 + 2s + 1)$ in $D(s)$
d1 = [1 2 1];
% Coefficients of $(s + 2)$ in $D(s)$
d2 = [0 1 2];
% Multiplies d1 and d2 to express $D(s)$ of $F(s)$
% as a polynomial
Ds = conv(d1, d2)

% Find PFE
[r, p, k] = residue(Ns, Ds)

%% Solve using symbolic toolbox
syms s t;
Fs = (s + 3)/((s + 2)*(s + 1)^2);
ft = ilaplace(Fs)