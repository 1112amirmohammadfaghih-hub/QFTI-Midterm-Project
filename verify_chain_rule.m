(* Fix variable names in verification script *)

dim = 4 - 2*epsilon;
OmegaD[d_] := (2 * Pi^(d/2)) / Gamma[d/2];

rawValT = Integrate[k^(dim - 1) / (k^2 + m^2), {k, 0, Lambda}, Assumptions -> {Lambda > 0, m > 0}] /. D -> dim;
tExpr = (1 / (2*Pi)^dim) * OmegaD[dim] * rawValT;

rawValB0 = Integrate[k^(dim - 1) / (k^2 + m^2)^2, {k, 0, Lambda}, Assumptions -> {Lambda > 0, m > 0}] /. D -> dim;
b0Expr = (1 / (2*Pi)^dim) * OmegaD[dim] * rawValB0;

asympT = Asymptotic[tExpr, {Lambda, Infinity, 2}];
asympB0 = Asymptotic[b0Expr, {Lambda, Infinity, 2}];

rhsAsymp = - (1 / (2 * m)) * D[asympT, m];

Print["Asymptotic - d(T)/dm^2:"];
Print[FullSimplify[rhsAsymp]];

Print["\nAsymptotic B(0):"];
Print[FullSimplify[asympB0]];
