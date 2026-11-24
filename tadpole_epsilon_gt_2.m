(* Mathematica script: Evaluating the tadpole integral T for Re(ϵ) < 2 (or ϵ > 2 region of convergence) *)
(* Using direct Greek notation (ϵ, Λ, Ω, π, etc.) *)

d = 4 - 2*ϵ;
Ω[dim_] := (2 * Pi^(dim/2)) / Gamma[dim/2];
measure[dim_] := Ω[dim] / (2 * Pi)^dim;

Print["=================================================="];
Print["Tadpole Integral T evaluated for Re(ϵ) > 2 region"];
Print["=================================================="];

(* Exact integral with assumptions tuned for ϵ > 2 (so d < 0) *)
rawT_eps2 = Integrate[k^(d - 1) / (k^2 + m^2), {k, 0, Λ}, Assumptions -> {Λ > 0, m > 0, ϵ > 2}];
exprT_eps2 = measure[d] * rawT_eps2;

Print["\nExact T expression for ϵ > 2:"];
Print[FullSimplify[exprT_eps2]];

Print["\n=================================================="];
