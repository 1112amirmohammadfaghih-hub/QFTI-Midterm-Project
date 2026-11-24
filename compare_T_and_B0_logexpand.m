(* Mathematica script: Verify the identity -1/(2*m) * ∂T/∂m = B(0) with robust LogExpand simplification *)
(* Using direct Greek notation (Λ, Ω, π, etc.) *)

Print["=================================================="];
Print["Verification: -1/(2*m) * ∂T/∂m = B(0) (Pure 4D with LogExpand)"];
Print["=================================================="];

(* 4D measure *)
Ω4 = 2 * π^2;
measure4 = Ω4 / (2 * π)^4; (* 1/(16 * π^2) *)

(* 1. T integral and its mass derivative *)
rawT = Integrate[k^3 / (k^2 + m^2), {k, 0, Λ}, Assumptions -> {Λ > 0, m > 0}];
exprT = measure4 * rawT;

derivativeT = D[exprT, m];
lhs = - (1 / (2 * m)) * derivativeT;

(* Expand logarithms on LHS *)
simplifiedLHS = LogExpand[FullSimplify[lhs]];

(* 2. B(0) integral *)
rawB0 = Integrate[k^3 / (k^2 + m^2)^2, {k, 0, Λ}, Assumptions -> {Λ > 0, m > 0}];
exprB0 = measure4 * rawB0;

(* Expand logarithms on RHS *)
simplifiedB0 = LogExpand[FullSimplify[exprB0]];

Print["\n[Step 1] LHS (-1/(2*m) * ∂T/∂m):"];
Print[simplifiedLHS];

Print["\n[Step 2] RHS (B(0)):"];
Print[simplifiedB0];

(* 3. Difference with LogExpand *)
difference = FullSimplify[LogExpand[simplifiedLHS - simplifiedB0]];

Print["\n[Step 3] Simplified Difference (LHS - RHS): ", difference];

(* Conclusion *)
If[difference === 0 || FullSimplify[difference == 0],
  Print["\n[CONCLUSION] SUCCESS: The relation -1/(2*m) * ∂T/∂m == B(0) holds identically to 0!"],
  Print["\n[CONCLUSION] Note: Difference evaluated to: ", difference]
];

Print["\n================================================== done. =================================================="];
