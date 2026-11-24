(* Script to expand dimExpr separately in small epsilon and large Lambda *)

(* Define dimExpr as the exact radial integral expression in D dimensions with D = 4 - 2*epsilon *)
rawIntegral = Integrate[k^(D - 1) / (k^2 + m^2), {k, 0, Lambda}, Assumptions -> {Lambda > 0, m > 0, D > 0}];
dimExpr = rawIntegral /. D -> 4 - 2*epsilon;

OmegaD[d_] := (2 * Pi^(d/2)) / Gamma[d/2];
measure[d_] := OmegaD[d] / (2 * Pi)^d;
fullExpr = measure[4 - 2*epsilon] * dimExpr;

(* 1. Expand in small epsilon (around epsilon -> 0) *)
epsExpanded = Series[fullExpr, {epsilon, 0, 1}];
Print["--- 1. Expanded in small epsilon ---"];
Print[FullSimplify[Normal[epsExpanded]]];

(* 2. Expand in large Lambda (around Lambda -> Infinity) *)
lambdaExpanded = Asymptotic[fullExpr, {Lambda, Infinity, 2}];
Print["--- 2. Expanded in large Lambda ---"];
Print[FullSimplify[lambdaExpanded]];
