(* Mathematica script: Exact T, expansion in epsilon (limit epsilon -> 0), and then large Lambda expansion *)
(* Using Greek notation (epsilon, Lambda, Omega, Gamma, Pi, etc.) *)

(* 1. Define spacetime dimension with epsilon: d = 4 - 2*epsilon *)
d = 4 - 2*epsilon;

(* Solid angle in d dimensions: Omega_d = 2 * Pi^(d/2) / Gamma(d/2) *)
Omega[d_] := (2 * Pi^(d/2)) / Gamma[d/2];

Print["=================================================="];
Print["Step 1: Exact radial integral for T"];
Print["T_exact = int_0^Lambda k^(d-1) / (k^2 + m^2) dk"];
Print["=================================================="];

(* Exact integral using Mathematica's Integrate *)
rawIntegral = Integrate[k^(d - 1) / (k^2 + m^2), {k, 0, Lambda}, Assumptions -> {Lambda > 0, m > 0}];
exactT = Omega[d] * rawIntegral;

Print["\n[Result 1] Exact T expression:"];
Print[FullSimplify[exactT]];


Print["\n=================================================="];
Print["Step 2: Series expansion in epsilon around epsilon -> 0"];
Print["=================================================="];

(* Expand exactT around epsilon -> 0 (keeping up to order epsilon^1 or epsilon^0) *)
expandedEps = Series[exactT, {epsilon, 0, 1}];
normalEps = Normal[expandedEps];

Print["\n[Result 2] T expanded in epsilon (up to O(epsilon^1)):"];
Print[FullSimplify[normalEps]];

(* Take the limit epsilon -> 0 (O(epsilon^0) term or full normal expression evaluated at epsilon = 0) *)
limitEpsZero = Limit[normalEps, epsilon -> 0];

Print["\n[Result 3] Limit epsilon -> 0 of the epsilon-expanded expression:"];
Print[FullSimplify[limitEpsZero]];


Print["\n=================================================="];
Print["Step 3: Expansion in large Lambda"];
Print["=================================================="];

(* Expand the exact expression (or the epsilon-expanded expression) for large Lambda *)
largeLambdaExact = Asymptotic[exactT, {Lambda, Infinity, 3}];

Print["\n[Result 4] Large Lambda expansion of the exact T:"];
Print[FullSimplify[largeLambdaExact]];

(* Alternatively, expand the epsilon-limit expression for large Lambda *)
largeLambdaLimitEps = Asymptotic[limitEpsZero, {Lambda, Infinity, 3}];

Print["\n[Result 5] Large Lambda expansion after taking epsilon -> 0:"];
Print[FullSimplify[limitEpsZero]];

Print["\n================================================== final summary done. =================================================="];
