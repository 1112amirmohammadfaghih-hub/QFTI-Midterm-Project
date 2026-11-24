(* Mathematica script: Exact B(0) (Bubble integral), expansion in epsilon (limit epsilon -> 0), and then large Lambda expansion *)
(* Using Greek notation (epsilon, Lambda, Omega, Gamma, Pi, etc.) *)

(* 1. Define spacetime dimension with epsilon: d = 4 - 2*epsilon *)
d = 4 - 2*epsilon;

(* Solid angle in d dimensions: Omega_d = 2 * Pi^(d/2) / Gamma(d/2) *)
Omega[d_] := (2 * Pi^(d/2)) / Gamma[d/2];

Print["=================================================="];
Print["Step 1: Exact radial integral for B(0) (Bubble integral at zero external momentum)"];
Print["B_exact = int_0^Lambda k^(d-1) / (k^2 + m^2)^2 dk"];
Print["=================================================="];

(* Exact integral using Mathematica's Integrate for B(0) *)
rawIntegralB = Integrate[k^(d - 1) / (k^2 + m^2)^2, {k, 0, Lambda}, Assumptions -> {Lambda > 0, m > 0}];
exactB = Omega[d] * rawIntegralB;

Print["\n[Result 1] Exact B(0) expression:"];
Print[FullSimplify[exactB]];


Print["\n=================================================="];
Print["Step 2: Series expansion in epsilon around epsilon -> 0"];
Print["=================================================="];

(* Expand exactB around epsilon -> 0 *)
expandedEpsB = Series[exactB, {epsilon, 0, 1}];
normalEpsB = Normal[expandedEpsB];

Print["\n[Result 2] B(0) expanded in epsilon (up to O(epsilon^1)):"];
Print[FullSimplify[normalEpsB]];

(* Take the limit epsilon -> 0 *)
limitEpsZeroB = Limit[normalEpsB, epsilon -> 0];

Print["\n[Result 3] Limit epsilon -> 0 of the epsilon-expanded B(0):"];
Print[FullSimplify[limitEpsZeroB]];


Print["\n=================================================="];
print["Step 3: Expansion in large Lambda"];
Print["=================================================="];

(* Expand the exact expression for large Lambda *)
largeLambdaExactB = Asymptotic[exactB, {Lambda, Infinity, 3}];

Print["\n[Result 4] Large Lambda expansion of the exact B(0):"];
Print[FullSimplify[largeLambdaExactB]];

(* Expand the epsilon-limit expression for large Lambda *)
largeLambdaLimitEpsB = Asymptotic[limitEpsZeroB, {Lambda, Infinity, 3}];

Print["\n[Result 5] Large Lambda expansion of B(0) after taking epsilon -> 0:"];
Print[FullSimplify[largeLambdaLimitEpsB]];

Print["\n================================================== final summary done. =================================================="];
