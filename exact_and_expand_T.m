(* Mathematica script to compute exact T and T / (2pi)^D with |k| < Lambda *)
(* and expand both in large Lambda *)

dim = 4 - 2*epsilon;
OmegaD[d_] := (2 * Pi^(d/2)) / Gamma[d/2];

(* Radial integral: int_0^Lambda k^(dim-1) / (k^2 + m^2) dk *)
rawVal = Integrate[k^(dim - 1) / (k^2 + m^2), {k, 0, Lambda}, Assumptions -> {Lambda > 0, m > 0, D > 0}] /. D -> dim;

(* 1. Exact T without (2pi)^D prefactor (using solid angle Omega_D) *)
exactT1 = (OmegaD[dim]) * rawVal;
Print["--- 1. Exact T (without (2pi)^D) ---"];
Print[exactT1];

asympT1 = Asymptotic[exactT1, {Lambda, Infinity, 2}];
Print["Expanded in large Lambda:"];
Print[FullSimplify[asympT1]];

(* 2. Exact T divided by (2pi)^D *)
exactT2 = (1 / (2*Pi)^dim) * exactT1;
Print["\n--- 2. Exact T / (2pi)^D ---"];
Print[exactT2];

asympT2 = Asymptotic[exactT2, {Lambda, Infinity, 2}];
Print["Expanded in large Lambda:"];
Print[FullSimplify[asympT2]];
