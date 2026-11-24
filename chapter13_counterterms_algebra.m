(* Mathematica script for Chapter 13: Counterterms and Regulator Independence *)
(* Author: QFTI Midterm Project / Sasha Notes *)

Print["=================================================="];
Print["Chapter 13: Counterterms and Regulator Independence"];
Print["=================================================="];

(* 1. Define Euclidean 1PI Green's functions with counterterms *)
(* Gamma^(2)(p) = p^2 + m^2 + delta_Z * p^2 + delta_m^2 + (lambda/2) * T *)
(* Gamma^(4)(p1, p2, p3, p4) = lambda + delta_lambda - (lambda^2/2) * (B(P12) + B(P13) + B(P14)) *)

gamma2[p_, m_, lambda_, deltaZ_, deltaM2_, T_] := p^2 + m^2 + deltaZ * p^2 + deltaM2 + (lambda / 2) * T;

(* For 4-point function at zero momentum (all p_i = 0, so P_ij = 0) *)
(* Gamma^(4)(0) = lambda + delta_lambda - (lambda^2/2) * 3 * B(0) *)
gamma4Zero[lambda_, deltaLambda_, B0_] := lambda + deltaLambda - (3 * lambda^2 / 2) * B0;

Print["\n--- Uncorrected / 1-Loop Amplitudes & Counterterm Definitions ---"];
Print["Γ^(2)(p) = p^2 + m^2 + δ_Z p^2 + δ_m^2 + (λ/2) T"];
Print["Γ^(4) = λ + δ_λ - (λ^2/2) [B(P_12) + B(P_13) + B(P_14)]"];


Print["\n--- Applying Renormalization Conditions ---"];
Print["Condition 1: Γ^(2)(0) = m^2"];
(* At p = 0, T becomes T(0) or T *)
eq1 = (gamma2[0, m, lambda, deltaZ, deltaM2, T] == m^2);
deltaM2Sol = Solve[eq1, deltaM2][[1]];
Print["Result for δ_m^2:"];
Print[deltaM2Sol];

Print["\nCondition 2: d/dp^2 [Γ^(2)(p)] at p=0 = 1"];
eq2 = (D[gamma2[p, m, lambda, deltaZ, deltaM2, T], p^2] /. p -> 0 == 1);
deltaZSol = Solve[eq2, deltaZ][[1]];
Print["Result for δ_Z (δ_Z^φ):"];
Print[deltaZSol];

Print["\nCondition 3: Γ^(4)(0) = λ"];
eq3 = (gamma4Zero[lambda, deltaLambda, B0] == lambda);
deltaLambdaSol = Solve[eq3, deltaLambda][[1]];
Print["Result for δ_λ:"];
Print[deltaLambdaSol];


Print["\n=================================================="];
Print["Summary of Counterterms in terms of T and B(0):"];
Print["δ_m^2 = ", -(lambda/2) * T];
Print["δ_Z = 0 (at 1-loop in phi^4)"];
Print["δ_λ = ", (3 * lambda^2 / 2) * B0];
Print["=================================================="];
