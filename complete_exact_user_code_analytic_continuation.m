(* Mathematica script: Complete 3-Part Workflow with Analytic Continuation ϵ = 1 + δ *)
(* Combining exact scripts: analytic_continuation_delta_eps1.m, part2_BP_analytic_continuation.m, part3_verify_analytic_continuation.m *)
(* Using direct Greek notation (δ, ϵ, Λ, Ω, π, P, etc.) *)

ϵ = 1 + δ;
d = 4 - 2*ϵ; (* Spacetime dimension d = 2 - 2δ *)

Ω[dim_] := (2 * Pi^(dim/2)) / Gamma[dim/2];
measure[dim_] := Ω[dim] / (2 * Pi)^dim;

Print["=================================================================="];
Print["PART 1: Tadpole Integral T with Analytic Continuation ϵ = 1 + δ"];
Print["=================================================================="];

rawT = Integrate[k^(d - 1) / (k^2 + m^2), {k, 0, Λ}, Assumptions -> {Λ > 0, m^2 > 0, δ > 0, δ < 1}];
exprT = measure[d] * rawT;

Print["\n[Step 1] Exact T expression with ϵ = 1 + δ (d = 2 - 2δ):"];
Print[FullSimplify[exprT]];

limitLambdaInfT = Limit[exprT, Λ -> Infinity, Assumptions -> {δ > 0, m^2 > 0}];
Print["\n[Step 2] Taking Λ -> Infinity limit for positive δ..."];
Print[FullSimplify[limitLambdaInfT]];

seriesDeltaT = Series[limitLambdaInfT, {δ, 0, 1}];
normalDeltaT = Normal[seriesDeltaT];
Print["\n[Step 3] Expanding around δ -> 0..."];
Print[FullSimplify[normalDataT = normalDeltaT]];


Print["\n=================================================================="];
Print["PART 2: Bubble Integral B(P) with Analytic Continuation ϵ = 1 + δ"];
Print["=================================================================="];

Δ = m^2 + x*(1-x)*P^2;
innerIntegralBP = (Λ^d / (d * Δ^2)) * Hypergeometric2F1[2, d/2, 1 + d/2, -Λ^2 / Δ];
exactBP = Ω[d] * Integrate[innerIntegralBP, {x, 0, 1}, Assumptions -> {Λ > 0, m^2 > 0, P >= 0, δ > 0, δ < 1}];
exprBP = measure[d] * exactBP;

Print["\n[Step 1] Exact B(P) expression with ϵ = 1 + δ:"];
Print[FullSimplify[exprBP]];

limitLambdaInfBP = Limit[exprBP, Λ -> Infinity, Assumptions -> {δ > 0, m^2 > 0, P >= 0}];
Print["\n[Step 2] Taking Λ -> Infinity limit for positive δ (keeping P)..."];
Print[FullSimplify[limitLambdaInfBP]];

seriesDeltaBP = Series[limitLambdaInfBP, {δ, 0, 1}];
normalDeltaBP = Normal[seriesDeltaBP];
Print["\n[Step 3] Expanding around δ -> 0 (Full B(P) result)..."];
Print[FullSimplify[normalDeltaBP]];

Print["\n[Step 4] Evaluating B(P) at P = 0 to recover B(0)..."];
b0FromBP = FullSimplify[normalDeltaBP /. P -> 0];
Print[b0FromBP];


Print["\n=================================================================="];
Print["PART 3: Verify -1/(2*m) * ∂T/∂m = B(0) with Analytic Continuation"];
Print["=================================================================="];

rawT3 = Integrate[k^(d - 1) / (k^2 + m^2), {k, 0, Λ}, Assumptions -> {Λ > 0, m^2 > 0, δ > 0, δ < 1}];
exprT3 = measure[d] * rawT3;

rawB03 = Integrate[k^(d - 1) / (k^2 + m^2)^2, {k, 0, Λ}, Assumptions -> {Λ > 0, m^2 > 0, δ > 0, δ < 1}];
exprB03 = measure[d] * rawB03;

derivativeT = D[exprT3, m];
lhs = - (1 / (2 * m)) * derivativeT;
rhs = exprB03;

limitLHS = Limit[lhs, Λ -> Infinity, Assumptions -> {δ > 0, m^2 > 0}];
limitRHS = Limit[rhs, Λ -> Infinity, Assumptions -> {δ > 0, m^2 > 0}];

seriesLHS = Series[limitLHS, {δ, 0, 1}];
seriesRHS = Series[limitRHS, {δ, 0, 1}];

normLHS = Normal[seriesLHS];
normRHS = Normal[seriesRHS];

Print["\nFinal LHS: ", FullSimplify[normLHS]];
Print["Final RHS: ", FullSimplify[normRHS]];

difference = FullSimplify[normLHS - normRHS];
Print["\nDifference (LHS - RHS): ", difference];

If[difference === 0 || FullSimplify[difference == 0],
  Print["\n[CONCLUSION] SUCCESS: The relation -1/(2*m) * ∂T/∂m == B(0) holds identically with analytic continuation!"],
  Print["\n[CONCLUSION] Note: Difference evaluated to: ", difference]
];

Print["\n=================================================================="];
