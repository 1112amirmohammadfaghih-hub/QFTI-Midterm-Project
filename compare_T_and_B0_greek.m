(* Mathematica script: Verify the identity -1/(2*m) * d(T)/dm = B(0) *)
(* Using direct Greek notation (ϵ, Λ, Ω, π, Δ, etc.) *)

(* 1. Define spacetime dimension and solid angle *)
d = 4 - 2*ϵ;
Ω[dim_] := (2 * π^(dim/2)) / Gamma[dim/2];
measure[dim_] := Ω[dim] / (2 * π)^dim;

Print["=================================================="];
Print["Verification: -1/(2*m) * ∂T/∂m = B(0)"];
Print["=================================================="];

(* 2. Define T and B(0) integrals with cutoff Λ *)
(* T(Λ) = measure[d] * int_0^Λ k^(d-1) / (k^2 + m^2) dk *)
rawT = Integrate[k^(d - 1) / (k^2 + m^2), {k, 0, Λ}, Assumptions -> {Λ > 0, m > 0}];
exprT = measure[d] * rawT;

(* B(0)(Λ) = measure[d] * int_0^Λ k^(d-1) / (k^2 + m^2)^2 dk *)
rawB0 = Integrate[k^(d - 1) / (k^2 + m^2)^2, {k, 0, Λ}, Assumptions -> {Λ > 0, m > 0}];
exprB0 = measure[d] * rawB0;

Print["\n[Step 1] Computing -1/(2*m) * ∂T/∂m ..."];
derivativeT = D[exprT, m];
lhs = - (1 / (2 * m)) * derivativeT;
simplifiedLHS = FullSimplify[lhs];

Print["[Step 2] Computing B(0) directly ..."];
simplifiedB0 = FullSimplify[exprB0];

Print["\n[Step 3] Comparing LHS (-1/(2*m) * ∂T/∂m) and RHS (B(0)) ..."];
difference = FullSimplify[simplifiedLHS - simplifiedB0];

Print["Difference (LHS - RHS): ", difference];

(* Conclusion *)
If[difference === 0 || FullSimplify[difference == 0],
  Print["\n[CONCLUSION] SUCCESS: The relation -1/(2*m) * ∂T/∂m == B(0) holds identically!"],
  Print["\n[CONCLUSION] Note: Difference evaluated to: ", difference]
];

Print["\n================================================== done. =================================================="];
