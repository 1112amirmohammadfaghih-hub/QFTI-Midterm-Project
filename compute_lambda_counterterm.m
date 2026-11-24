(* Script to compute delta_lambda counterterm and B(P) - B(0) convergent difference *)

dim = 4 - 2*epsilon;
OmegaD[d_] := (2 * Pi^(d/2)) / Gamma[d/2];
measure[d_] := OmegaD[d] / (2 * Pi)^d;

DeltaExpr = m^2 + x*(1-x)*P^2;
innerB = (Lambda^dim / (dim * DeltaExpr^2)) * Hypergeometric2F1[2, dim/2, (2 + dim)/2, -Lambda^2/DeltaExpr];
rawB = Integrate[innerB, {x, 0, 1}, Assumptions -> {Lambda > 0, m^2 > 0, P > 0, dim > 0}] /. D -> dim;
bCutoff = measure[dim] * rawB;

(* B(0) is B evaluated at P = 0 *)
b0 = bCutoff /. P -> 0;

asympB0 = Asymptotic[b0, {Lambda, Infinity, 2}];
Print["Asymptotic B(0):"];
Print[FullSimplify[asympB0]];

(* Delta lambda counterterm from Gamma^(4)(0) = lambda condition *)
(* Gamma^(4)(0) = lambda + delta_lambda - (lambda^2 / 2) * 3 * B(0) *)
(* Imposing Gamma^(4)(0) = lambda gives delta_lambda = (3 * lambda^2 / 2) * B(0) *)
deltaLambda = (3 * lambda^2 / 2) * asympB0;
Print["\nDelta lambda counterterm:"];
Print[FullSimplify[deltaLambda]];
