(* Mathematica script for Chapter 13: Counterterms and Regulator Independence *)
(* Including correct 1-loop 1PI Green's functions Γ^(2) and Γ^(4) with counterterms *)

Print["=================================================="];
Print["Chapter 13: Counterterms and Regulator Independence"];
Print["=================================================="];

(* Define Greek variables *)
(* Γ^(2)(p) = p^2 + m^2 + δ_Z p^2 + δ_m^2 + (λ/2) T *)
gamma2[p_, m_, λ_, δ_Z_, δ_m2_, T_] := p^2 + m^2 + δ_Z * p^2 + δ_m2 + (λ / 2) * T;

(* Γ^(4) = λ + δ_λ - (λ^2/2) [B(P_12) + B(P_13) + B(P_14)] *)
gamma4[λ_, δ_λ_, B12_, B13_, B14_] := λ + δ_λ - (λ^2 / 2) * (B12 + B13 + B14);

Print["\n--- 1. Renormalization Conditions & Counterterms ---"];
(* Derived counterterms *)
δ_m2Val = - (λ / 2) * T;
δ_ZVal = 0;
δ_λVal = (3 * λ^2 / 2) * B0; (* where B0 = B(0) *)

Print["δ_m^2 = ", δ_m2Val];
Print["δ_Z   = ", δ_ZVal];
Print["δ_λ   = ", δ_λVal];


Print["\n--- 2. Fully Renormalized 1-Loop 1PI Green's Functions ---"];

(* Substitute counterterms into Γ^(2)(p) *)
gamma2Renormalized = gamma2[p, m, λ, δ_ZVal, δ_m2Val, T];
Print["\nRenormalized Γ^(2)(p) (up to 1-loop):"];
Print["Γ_R^(2)(p) = ", FullSimplify[gamma2Renormalized]];

(* Substitute counterterms into Γ^(4) using B(0) for zero momentum or general B(P_ij) *)
gamma4Renormalized = gamma4[λ, δ_λVal, B12, B13, B14];
Print["\nRenormalized Γ^(4) (up to 1-loop):"];
Print["Γ_R^(4) = ", FullSimplify[gamma4Renormalized]];

Print["\n=================================================="];
Print["Note: When regulators (Λ -> ∞ or ε -> 0) are removed,"];
Print["the divergent parts of T and B cancel against δ_m^2 and δ_λ,"];
Print["leaving finite, regulator-independent predictions for B(P) - B(0) and its slope!"];
Print["=================================================="];
