(* Mathematica script: Tadpole Integral T for 2 < Re(ϵ) < 4 *)
(* Using direct Greek notation (ϵ, Λ, Ω, π, etc.) *)

d = 4 - 2*ϵ;
Ω[dim_] := (2 * Pi^(dim/2)) / Gamma[dim/2];
measure[dim_] := Ω[dim] / (2 * Pi)^dim;

Print["=================================================="];
Print["Tadpole Integral T evaluated for 2 < ϵ < 4 (Negative dimensions d < 0)"];
Print["=================================================="];

(* Integrate with assumption 2 < ϵ < 4 *)
rawT_range = Integrate[k^(d - 1) / (k^2 + m^2), {k, 0, Λ}, Assumptions -> {Λ > 0, m > 0, ϵ > 2, ϵ < 4}];
exprT_range = measure[d] * rawT_range;

Print["\nExact T expression for 2 < ϵ < 4:"];
Print[FullSimplify[exprT_range]];

Print["\n=================================================="];
