(* Mathematica script: Verify the identity -1/(2*m) * ∂T/∂m = B(0) after taking the limit ϵ -> 0 *)
(* Using direct Greek notation (ϵ, Λ, Ω, π, etc.) *)

(* 1. Define spacetime dimension and solid angle *)
d = 4 - 2*ϵ;
Ω[dim_] := (2 * π^(dim/2)) / Gamma[dim/2];
measure[dim_] := Ω[dim] / (2 * π)^dim;

Print["=================================================="];
Print["Verification: -1/(2*m) * ∂T/∂m = B(0) (with limit ϵ -> 0)"];
Print["=================================================="];

(* 2. Define T and B(0) integrals with cutoff Λ *)
rawT = Integrate[k^(d - 1) / (k^2 + m^2), {k, 0, Λ}, Assumptions -> {Λ > 0, m > 0}];
exprT = measure[d] * rawT;

rawB0 = Integrate[k^(d - 1) / (k^2 + m^2)^2, {k, 0, Λ}, Assumptions -> {Λ > 0, m^2 > 0}];
exprB0 = measure[d] * rawB0;

Print["\n[Step 1] Computing -1/(2*m) * ∂T/∂m ..."];
derivativeT = D[exprT, m];
lhs = - (1 / (2 * m)) * derivativeT;

Print["[Step 2] Taking the limit ϵ -> 0 of LHS and RHS ..."];
(* Expand around ϵ -> 0 and take Normal / Limit *)
lhsEps = Series[lhs, {ϵ, 0, 0}];
b0Eps = Series[exprB0, {ϵ, 0, 0}];

lhsLimit = Limit[Normal[lhsEps], ϵ -> 0];
b0Limit = Limit[Normal[b0Eps], ϵ -> 0];

Print["\n[Step 3] Comparing LHS limit and RHS limit ..."];
difference = FullSimplify[lhsLimit - b0Limit];

Print["Difference (LHS_limit - RHS_limit): ", difference];

(* Conclusion *)
If[difference === 0 || FullSimplify[difference == 0],
  Print["\n[CONCLUSION] SUCCESS: The relation -1/(2*m) * ∂T/∂m == B(0) holds identically in the limit ϵ -> 0!"],
  Print["\n[CONCLUSION] Note: Difference evaluated to: ", difference]
];

Print["\n================================================== done. =================================================="];
