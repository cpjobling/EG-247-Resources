% Example 3.1 - Real distinct roots

Ns = [3, 2];
Ds = [1, 3, 2];
% Residues function gives PFE
[r,p,k] = residue(Ns, Ds)

% Solution with Symbolic Toolbox
syms t s;

Fs = (3*s + 2)/(s^2 + 3*s + 2);

ft = ilaplace(Fs)