(* Mathematica script: Complete Subsection 1.2 Workflow - Exact T, B(P), and Derivative Identity Verification *)
(* Including all midstep terms: exact loop integrals, limits, expansions, and identity check *)
(* Using direct Greek notation (ϵ, Λ, Ω, π, Δ, etc.) *)

d = 4 - 2*ϵ;
Ω[dim_] := (2 * Pi^(dim/2)) / Gamma[dim/2];
measure[dim_] := Ω[dim] / (2 * Pi)^dim;

Print["=================================================="];
Print["SUBSECTION 1.2: COMPLETE T, B, AND DERIVATIVE WORKFLOW"];
Print["=================================================="];

(* --- PART 1: TADPOLE INTEGRAL T --- *)
Print["\n[Part 1] Computing Exact Tadpole Integral T ..."];
rawT = Integrate[k^(d - 1) / (k^2 + m^2), {k, 0, Λ}, Assumptions -> {Λ > 0, m > 0}];
exprT = measure[d] * rawT;

Print["Exact T expression:"];
Print[FullSimplify[exprT]];

asympT = Asymptotic[exprT, {Λ, Infinity, 3}];
Print["Large Λ asymptotic expansion of T:"];
Print[FullSimplify[asympT]];

seriesT = Series[asympT, {ϵ, 0, 1}];
Print["Epsilon series expansion of T:"];
Print[FullSimplify[Normal[seriesT]]];


(* --- PART 2: BUBBLE INTEGRAL B(P) --- *)
Print["\n[Part 2] Computing Exact Bubble Integral B(P) via Feynman Parameters ..."];
Δ = m^2 + x*(1-x)*P^2;
innerB = (Λ^d / (d * Δ^2)) * Hypergeometric2F1[2, d/2, 1 + d/2, -Λ^2 / Δ];
exactBP = Ω[d] * Integrate[innerB, {x, 0, 1}, Assumptions -> {Λ > 0, m > 0, P > 0, d > 0}];
exprBP = measure[d] * exactBP;

Print["Exact B(P) expression (Feynman parameter / Hypergeometric representation):"];
Print[FullSimplify[exprBP]];

asympBP = Asymptotic[exprBP, {Λ, Infinity, 2}];
Print["Large Λ asymptotic expansion of B(P):"];
Print[FullSimplify[asympBP]];


(* --- PART 3: IDENTITY VERIFICATION (-1/(2m) * ∂T/∂m = B(0)) --- *)
Print["\n[Part 3] Verifying Identity: -1/(2*m) * ∂T/∂m = B(0) ..."];

(* Evaluate B(0) directly *)
rawB0 = Integrate[k^(d - 1) / (k^2 + m^2)^2, {k, 0, Λ}, Assumptions -> {Λ > 0, m > 0}];
exprB0 = measure[d] * rawB0;

(* Compute derivative of T *)
derivativeT = D[exprT, m];
lhs = - (1 / (2 * m)) * derivativeT;

(* Expand both sides for large Lambda and small epsilon *)
asympLHS = Asymptotic[lhs, {Λ, Infinity, 3}];
asympRHS = Asymptotic[exprB0, {Λ, Infinity, 3}];

seriesLHS = Series[asympLHS, {ϵ, 0, 1}];
seriesRHS = Series[asympRHS, {ϵ, 0, 1}];

normLHS = Normal[seriesLHS];
normRHS = Normal[seriesRHS];

difference = FullSimplify[normLHS - normRHS];

Print["LHS (-1/(2*m) * ∂T/∂m): ", FullSimplify[normLHS]];
Print["RHS (B(0)):               ", FullSimplify[normRHS]];
Print["Difference (LHS - RHS):    ", difference];

If[difference === 0 || FullSimplify[difference == 0],
  Print["\n[CONCLUSION] SUCCESS: The relation -1/(2*m) * ∂T/∂m == B(0) holds identically!"],
  Print["\n[CONCLUSION] Note: Difference: ", difference]
];

Print["\n=================================================="];
Print["Subsection 1.2 Complete: T, B, and Derivative Identity Workflow Done"];
Print["=================================================="];
