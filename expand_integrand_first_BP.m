(* Mathematica script: B(P) evaluated by taking limit epsilon -> 0 inside the integrand before integrating *)
(* Using Greek notation (epsilon, Lambda, Omega, Gamma, Pi, P, etc.) *)

(* 1. Define spacetime dimension with epsilon: d = 4 - 2*epsilon *)
d = 4 - 2*epsilon;

(* Solid angle in d dimensions: Omega_d = 2 * Pi^(d/2) / Gamma(d/2) *)
Omega[d_] := (2 * Pi^(d/2)) / Gamma[d/2];
measure[d_] := Omega[d] / (2 * Pi)^d;

Print["=================================================="];
Print["Method: Take limit epsilon -> 0 inside the integrand first"];
Print["=================================================="];

(* Feynman denominator Delta = m^2 + x*(1-x)*P^2 *)
deltaExpr = m^2 + x*(1-x)*P^2;

(* The full integrand expression before integration: *)
(* measure[d] * Lambda^d / (d * deltaExpr^2) * Hypergeometric2F1[2, d/2, 1 + d/2, -Lambda^2 / deltaExpr] *)
integrand = measure[d] * (Lambda^d / (d * deltaExpr^2)) * Hypergeometric2F1[2, d/2, 1 + d/2, -Lambda^2 / deltaExpr];

Print["\n[Step 1] Expanding the integrand for small epsilon (epsilon -> 0)..."];
integrandEps = Series[integrand, {epsilon, 0, 0}];
integrandNormal = Normal[integrandEps];

Print["Simplified integrand at leading order in epsilon:"];
Print[FullSimplify[integrandNormal]];

Print["\n[Step 2] Integrating over Feynman parameter x from 0 to 1..."];
(* Integrate the epsilon-expanded integrand over x *)
finalBP = Integrate[integrandNormal, {x, 0, 1}, Assumptions -> {Lambda > 0, m > 0, P > 0}];

Print["\n[Result 1] B(P) after taking epsilon -> 0 inside and integrating:"];
Print[FullSimplify[finalBP]];

Print["\n=================================================="];
Print["Step 3: Expansion in large Lambda of the resulting expression"];
Print["=================================================="];

largeLambdaBP = Asymptotic[finalBP, {Lambda, Infinity, 2}];
Print["\n[Result 2] Large Lambda expansion:"];
Print[FullSimplify[largeLambdaBP]];

Print["\n================================================== done. =================================================="];
