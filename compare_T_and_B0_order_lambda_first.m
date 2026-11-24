(* Mathematica script: Verify -1/(2*m) * ∂T/∂m = B(0) *)
(* Order of operations: 1. Large Lambda expansion first, then 2. Small epsilon series expansion *)
(* Using direct Greek notation (ϵ, Λ, Ω, π, etc.) *)

(* 1. Spacetime dimension and solid angle *)
d = 4 - 2*ϵ;
Ω[dim_] := (2 * π^(dim/2)) / Gamma[dim/2];
measure[dim_] := Ω[dim] / (2 * π)^dim;

Print["================================================================="];
Print["Verification: -1/(2*m) * ∂T/∂m = B(0)"];
Print["Order: Large Lambda expansion FIRST, then small epsilon expansion"];
Print["================================================================="];

(* Define exact T and B(0) integrals with cutoff Λ in d dimensions *)
rawT = Integrate[k^(d - 1) / (k^2 + m^2), {k, 0, Λ}, Assumptions -> {Λ > 0, m > 0}];
exprT = measure[d] * rawT;

rawB0 = Integrate[k^(d - 1) / (k^2 + m^2)^2, {k, 0, Λ}, Assumptions -> {Λ > 0, m^2 > 0}];
exprB0 = measure[d] * rawB0;

Print["\n[Step 1] Computing -1/(2*m) * ∂T/∂m ..."];
derivativeT = D[exprT, m];
lhs = - (1 / (2 * m)) * derivativeT;
rhs = exprB0;

Print["\n[Step 2] Applying Large Lambda Asymptotic Expansion FIRST ..."];
(* Keep enough terms in Lambda to capture divergences and finite parts *)
asympLHS = Asymptotic[lhs, {Λ, Infinity, 3}];
asympRHS = Asymptotic[rhs, {Λ, Infinity, 3}];

Print["\n[Step 3] Applying Small Epsilon Series Expansion SECOND (around ϵ -> 0) ..."];
seriesLHS = Series[asympLHS, {ϵ, 0, 1}];
seriesRHS = Series[asympRHS, {ϵ, 0, 1}];

normLHS = Normal[seriesLHS];
normRHS = Normal[seriesRHS];

Print["\nFinal LHS expression:"];
Print[FullSimplify[normLHS]];

Print["\nFinal RHS expression:"];
Print[FullSimplify[normRHS]];

(* Step 4: Compare difference *)
difference = FullSimplify[normLHS - normRHS];
Print["\n[Step 4] Difference (LHS - RHS): ", difference];

(* Conclusion *)
If[difference === 0 || FullSimplify[difference == 0],
  Print["\n[CONCLUSION] SUCCESS: The relation -1/(2*m) * ∂T/∂m == B(0) holds identically when expanding large Λ first, then small ϵ!"],
  Print["\n[CONCLUSION] Note: Difference evaluated to: ", difference]
];

Print["\n================================================================="];
