(* Mathematica script: Exact B(P) (Bubble integral with external momentum P), epsilon expansion, and large Lambda expansion *)
(* Using Greek notation (epsilon, Lambda, Omega, Gamma, Pi, P, etc.) *)

(* 1. Define spacetime dimension with epsilon: d = 4 - 2*epsilon *)
d = 4 - 2*epsilon;

(* Solid angle in d dimensions: Omega_d = 2 * Pi^(d/2) / Gamma(d/2) *)
Omega[d_] := (2 * Pi^(d/2)) / Gamma[d/2];

Print["=================================================="];
Print["Step 1: Exact Feynman parameter representation for B(P)"];
Print["B(P) = int_0^1 dx int_0^Lambda k^(d-1) / (k^2 + Delta)^2 dk"];
Print["where Delta = m^2 + x*(1-x)*P^2"];
Print["=================================================="];

(* Delta with Feynman parameter x and external momentum P *)
deltaExpr = m^2 + x*(1-x)*P^2;

(* Inner k integral over [0, Lambda] in d dimensions for exponent 2 *)
innerIntegralB = (Lambda^d / (d * deltaExpr^2)) * Hypergeometric2F1[2, d/2, 1 + d/2, -Lambda^2 / deltaExpr];

(* Full B(P) with solid angle and Feynman parameter integration over {x, 0, 1} *)
exactBP = Omega[d] * Integrate[innerIntegralB, {x, 0, 1}, Assumptions -> {Lambda > 0, m > 0, P > 0, d > 0}];

Print["\n[Result 1] Exact B(P) expression (in terms of Feynman parameter integral over Hypergeometric2F1):"];
Print[FullSimplify[exactBP]];


Print["\n=================================================="];
Print["Step 2: Series expansion in epsilon around epsilon -> 0"];
Print["=================================================="];

(* Expand exactBP around epsilon -> 0 *)
expandedEpsBP = Series[exactBP, {epsilon, 0, 1}];
normalEpsBP = Normal[expandedEpsBP];

Print["\n[Result 2] B(P) expression expanded in epsilon (up to O(epsilon^1)):"];
Print[FullSimplify[normalEpsBP]];

(* Take the limit epsilon -> 0 *)
limitEpsZeroBP = Limit[normalEpsBP, epsilon -> 0];

Print["\n[Result 3] Limit epsilon -> 0 of the epsilon-expanded B(P):"];
Print[FullSimplify[limitEpsZeroBP]];


Print["\n=================================================="];
print["Step 3: Expansion in large Lambda"];
Print["=================================================="];

(* Expand the exact expression for large Lambda *)
largeLambdaExactBP = Asymptotic[exactBP, {Lambda, Infinity, 2}];

Print["\n[Result 4] Large Lambda expansion of the exact B(P):"];
Print[FullSimplify[largeLambdaExactBP]];

(* Expand the epsilon-limit expression for large Lambda *)
largeLambdaLimitEpsBP = Asymptotic[limitEpsZeroBP, {Lambda, Infinity, 2}];

Print["\n[Result 5] Large Lambda expansion of B(P) after taking epsilon -> 0:"];
Print[FullSimplify[largeLambdaLimitEpsBP]];

Print["\n================================================== final summary done. =================================================="];
