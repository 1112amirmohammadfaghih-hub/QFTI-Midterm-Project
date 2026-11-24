(* Mathematica script for Chapter 13: Counterterms and Regulator Independence *)
(* Using direct Greek letters (Λ, ε, λ, δ) and proper derivative operators *)

Print["=================================================="];
Print["Chapter 13: Counterterms and Regulator Independence"];
Print["=================================================="];

(* 1. Define Euclidean 1PI Green's functions with counterterms using Greek letters *)
(* Γ^(2)(p) = p^2 + m^2 + δ_Z p^2 + δ_m^2 + (λ/2) T *)
(* Γ^(4) = λ + δ_λ - (λ^2/2) [B(P_12) + B(P_13) + B(P_14)] *)

gamma2[p_, m_, λ_, δ_Z_, δ_m2_, T_] := p^2 + m^2 + δ_Z * p^2 + δ_m2 + (λ / 2) * T;

(* For 4-point function at zero momentum *)
gamma4Zero[λ_, δ_λ_, B0_] := λ + δ_λ - (3 * λ^2 / 2) * B0;

Print["\n--- 1-Loop Amplitudes & Counterterm Definitions ---"];
Print["Γ^(2)(p) = p^2 + m^2 + δ_Z p^2 + δ_m^2 + (λ/2) T"];
Print["Γ^(4) = λ + δ_λ - (λ^2/2) [B(P_12) + B(P_13) + B(P_14)]"];


Print["\n--- Applying Renormalization Conditions ---"];

(* Condition 1: Γ^(2)(0) = m^2 *)
eq1 = (gamma2[0, m, λ, δ_Z, δ_m2, T] == m^2);
δ_m2Sol = Solve[eq1, δ_m2][[1]];
Print["1. Γ^(2)(0) = m^2  ==>  δ_m^2 = ", δ_m2Sol];

(* Condition 2: Derivative w.r.t p^2 at p^2 = 0 equals 1 *)
(* Using D[f[x], x] where x = p^2 *)
derivGamma2 = D[gamma2[Sqrt[x], m, λ, δ_Z, δ_m2, T], x] /. x -> 0;
eq2 = (derivGamma2 == 1);
δ_ZSol = Solve[eq2, δ_Z][[1]];
Print["2. d/d(p^2) [Γ^(2)]|_{p^2=0} = 1  ==>  δ_Z = ", δ_ZSol];

(* Condition 3: Γ^(4)(0) = λ *)
eq3 = (gamma4Zero[λ, δ_λ, B0] == λ);
δ_λSol = Solve[eq3, δ_λ][[1]];
Print["3. Γ^(4)(0) = λ  ==>  δ_λ = ", δ_λSol];


Print["\n=================================================="];
Print["Summary of Counterterms in terms of T and B(0):"];
Print["δ_m^2 = ", -(λ/2) * T];
Print["δ_Z = 0 (at 1-loop in φ^4)"];
Print["δ_λ = ", (3 * λ^2 / 2) * B0];
Print["=================================================="];
