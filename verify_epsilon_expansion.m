(* Numerical verification of epsilon-expanded expressions *)

dim = 4 - 2*epsilon;
OmegaD[d_] := (2 * Pi^(d/2)) / Gamma[d/2];

rawValT = Integrate[k^(dim - 1) / (k^2 + m^2), {k, 0, Lambda}, Assumptions -> {Lambda > 0, m > 0}] /. D -> dim;
tExpr = (1 / (2*Pi)^dim) * OmegaD[dim] * rawValT;

rawValB0 = Integrate[k^(dim - 1) / (k^2 + m^2)^2, {k, 0, Lambda}, Assumptions -> {Lambda > 0, m^2 > 0}] /. D -> dim;
b0Expr = (1 / (2*Pi)^dim) * OmegaD[dim] * rawValB0;

epsT = Series[tExpr, {epsilon, 0, 1}];
epsB0 = Series[b0Expr, {epsilon, 0, 1}];

rhsEps = - (1 / (2 * m)) * D[Normal[epsT], m];
b0Norm = Normal[epsB0];

val1 = N[rhsEps /. {Lambda -> 10, m -> 1, epsilon -> 0.001}];
val2 = N[b0Norm /. {Lambda -> 10, m -> 1, epsilon -> 0.001}];

Print["Numeric value of -dT/dm^2 (eps expanded): ", val1];
Print["Numeric value of B(0) (eps expanded):       ", val2];
