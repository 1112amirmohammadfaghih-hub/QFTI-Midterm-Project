(* Mathematica script: B(P) evaluated by taking limit epsilon -> 0 inside the integrand first *)
(* Using Greek notation (ϵ, Λ, Ω, Γ, π, P, etc.) *)

(* 1. Define spacetime dimension with epsilon: d = 4 - 2*ϵ *)
d = 4 - 2*ϵ;

(* Solid angle in d dimensions: Ω_d = 2 * π^(d/2) / Γ(d/2) *)
Ω[d_] := (2 * π^(d/2)) / Gamma[d/2];
measure[d_] := Ω[d] / (2 * π)^d;

Print["=================================================="];
Print["Method: Take limit ϵ -> 0 inside the integrand first"];
Print["=================================================="];

(* Feynman denominator Δ = m^2 + x*(1-x)*P^2 *)
Δ = m^2 + x*(1-x)*P^2;

(* The full integrand expression before integration: *)
integrand = measure[d] * (Λ^d / (d * Δ^2)) * Hypergeometric2F1[2, d/2, 1 + d/2, -Λ^2 / Δ];

Print["\n[Step 1] Expanding the integrand for small epsilon (ϵ -> 0)..."];
integrandEps = Series[integrand, {ϵ, 0, 0}];
integrandNormal = Normal[integrandEps];

Print["Simplified integrand at leading order in ϵ:"];
Print[FullSimplify[integrandNormal]];

Print["\n[Step 2] Integrating over Feynman parameter x from 0 to 1..."];
finalBP = Integrate[integrandNormal, {x, 0, 1}, Assumptions -> {Λ > 0, m > 0, P > 0}];

Print["\n[Result 1] B(P) after taking ϵ -> 0 inside and integrating:"];
Print[FullSimplify[finalBP]];

Print["\n=================================================="];
Print["Step 3: Expansion in large Λ"];
Print["=================================================="];

largeLambdaBP = Asymptotic[finalBP, {Λ, Infinity, 2}];
Print["\n[Result 2] Large Λ expansion:"];
Print[FullSimplify[largeLambdaBP]];

Print["\n================================================== done. =================================================="];
