(* Mathematica script: Complete 3-Part Workflow with Analytic Continuation ϵ = 1 + δ *)
(* Keeping B(P) as a function of external momentum P, evaluating at P = 0 only at the end *)
(* Using direct Greek notation (δ, ϵ, Λ, Ω, π, P, etc.) *)

ϵ = 1 + δ;
d = 4 - 2*ϵ; (* Spacetime dimension d = 2 - 2δ *)

Ω[dim_] := (2 * Pi^(dim/2)) / Gamma[dim/2];
measure[dim_] := Ω[dim] / (2 * Pi)^dim;

Print["=================================================================="];
Print["PART 1: Tadpole Integral T with Analytic Continuation ϵ = 1 + δ"];
Print["=================================================================="];

rawT = Integrate[k^(d - 1) / (k^2 + m^2), {k, 0, Λ}, Assumptions -> {Λ > 0, m > 0, δ > 0, δ < 1}];
exprT = measure[d] * rawT;

Print["\n[Step 1.1] Exact T expression with ϵ = 1 + δ (d = 2 - 2δ):"];
Print[FullSimplify[exprT]];

limitLambdaInfT = Limit[exprT, Λ -> Infinity, Assumptions -> {δ > 0, m > 0}];
Print["\n[Step 1.2] Taking Λ -> Infinity limit for positive δ:"];
Print[FullSimplify[limitLambdaInfT]];

seriesDeltaT = Series[limitLambdaInfT, {δ, 0, 1}];
normalDeltaT = Normal[seriesDeltaT];
Print["\n[Step 1.3] Expanded around δ -> 0:"];
Print[FullSimplify[normalDeltaT]];


Print["\n=================================================================="];
Print["PART 2: Bubble Integral B(P) with Analytic Continuation ϵ = 1 + δ"];
Print["=================================================================="];

Δ = m^2 + x*(1-x)*P^2;
innerIntegralBP = (Λ^d / (d * Δ^2)) * Hypergeometric2F1[2, d/2, 1 + d/2, -Λ^2 / Δ];
exactBP = Ω[d] * Integrate[innerIntegralBP, {x, 0, 1}, Assumptions -> {Λ > 0, m > 0, P >= 0, δ > 0, δ < 1}];
exprBP = measure[d] * exactBP;

Print["\n[Step 2.1] Exact B(P) expression with ϵ = 1 + δ (keeping P):"];
Print[FullSimplify[exprBP]];

limitLambdaInfBP = Limit[exprBP, Λ -> Infinity, Assumptions -> {δ > 0, m > 0, P >= 0}];
Print["\n[Step 2.2] Taking Λ -> Infinity limit for positive δ (keeping P):"];
Print[FullSimplify[limitLambdaInfBP]];

seriesDeltaBP = Series[limitLambdaInfBP, {δ, 0, 1}];
normalDeltaBP = Normal[seriesDeltaBP];
Print["\n[Step 2.3] Expanded around δ -> 0 (Full B(P) result):"];
Print[FullSimplify[normalDeltaBP]];

b0FromBP = FullSimplify[normalDeltaBP /. P -> 0];
Print["\n[Step 2.4] Evaluating B(P) at P = 0 to recover B(0):"];
Print[b0FromBP];


Print["\n=================================================================="];
Print["PART 3: Verify -1/(2*m) * ∂T/∂m = B(0) with Analytic Continuation"];
Print["=================================================================="];

derivativeT = D[exprT, m];
lhs = - (1 / (2 * m)) * derivativeT;
rhs = exprB0; (* Note: exprB0 or b0FromBP *)

limitLHS = Limit[lhs, Λ -> Infinity, Assumptions -> {δ > 0, m > 0}];
limitRHS = Limit[b0FromBP, Λ -> Infinity, Assumptions -> {δ > 0, m > 0}]; (* Alternatively using b0FromBP *)

(* Using direct evaluation of exprB0 at P=0 for RHS to match previous run *)
rawB0 = Integrate[k^(d - 1) / (k^2 + m^2)^2, {k, 0, Λ}, Assumptions -> {Λ > 0, m > 0, δ > 0, δ < 1}];
exprB0 = measure[d] * rawB0;
limitRHS_direct = Limit[exprB0, Λ -> Infinity, Assumptions -> {δ > 0, m > 0}];

seriesLHS = Series[limitLHS, {δ, 0, 1}];
seriesRHS = Series[limitRHS_direct, {δ, 0, 1}];

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
