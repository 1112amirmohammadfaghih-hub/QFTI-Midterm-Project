(* Mathematica script: Analytic continuation using ϵ = 1 + δ (where δ > 0) *)
(* Order: 1. Set ϵ = 1 + δ, 2. Take Λ -> ∞ limit, 3. Expand in small δ *)
(* Using direct Greek notation (δ, ϵ, Λ, Ω, π, etc.) *)

ϵ = 1 + δ;
d = 4 - 2*ϵ; (* This makes d = 4 - 2(1 + δ) = 2 - 2δ *)

Ω[dim_] := (2 * Pi^(dim/2)) / Gamma[dim/2];
measure[dim_] := Ω[dim] / (2 * Pi)^dim;

Print["=================================================================="];
Print["ANALYTIC CONTINUATION: Setting ϵ = 1 + δ (δ > 0)"];
Print["=================================================================="];

(* Exact radial integral for T with cutoff Λ in d = 2 - 2δ dimensions *)
rawT = Integrate[k^(d - 1) / (k^2 + m^2), {k, 0, Λ}, Assumptions -> {Λ > 0, m > 0, δ > 0, δ < 1}];
exprT = measure[d] * rawT;

Print["\n[Step 1] Exact T expression with ϵ = 1 + δ (d = 2 - 2δ):"];
Print[FullSimplify[exprT]];

Print["\n[Step 2] Taking Λ -> Infinity limit for positive δ..."];
limitLambdaInf = Limit[exprT, Λ -> Infinity, Assumptions -> {δ > 0, m > 0}];
Print[FullSimplify[limitLambdaInf]];

Print["\n[Step 3] Expanding around δ -> 0..."];
seriesDelta = Series[limitLambdaInf, {δ, 0, 1}];
normalDelta = Normal[seriesDelta];
Print[FullSimplify[normalDelta]];

Print["\n=================================================================="];
