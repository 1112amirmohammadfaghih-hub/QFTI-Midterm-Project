(* Mathematica script: Part 3.1 - phi^4 amplitudes with counterterms including T and B amplitudes *)
(* Using direct Greek notation (ϵ, Λ, Ω, π, etc.) *)

Print["=================================================="];
Print["Subsection 1.3: phi^4 amplitudes with Counterterms"];
Print["=================================================="];

(* 1. Define symbolic loop integrals T (tadpole) and B (bubble) *)
(* T represents the tadpole contribution *)
(* B represents the bubble integral contribution *)

Print["\n[Step 1] Symbolic amplitude definitions with corresponding names T and B:"];

(* 2-point 1PI Green's function (Self-energy / propagator correction) *)
gamma2[p_, m_, lambda_, T_, Z_, deltaM2_] := p^2 - m^2 - (lambda / 2) * T + (Z - 1)*p^2 - deltaM2;

(* 4-point 1PI Green's function (Scattering amplitude) *)
gamma4[lambda_, B_, deltaLambda_] := -lambda + (3 * lambda^2) * B - deltaLambda;

Print["Gamma^(2)(p) [Propagator correction with T and counterterms]:"];
Print["Γ^(2)(p) = p^2 - m^2 - (λ/2)*T + (Z - 1)*p^2 - δ_m^2"];

Print["\nGamma^(4) [Scattering amplitude with B and counterterm]:"];
Print["Γ^(4) = -λ + 3*λ^2*B - δ_λ"];

Print["\n=================================================="];
Print["Scheme II Conditions (p = 0 subtraction):"];
Print["1. Γ^(2)(0) = -m^2  ==>  δ_m^2 = -(λ/2)*T"];
Print["2. d/dp^2 [Γ^(2)(p)] at p=0 = 1  ==>  Z = 1 (at 1-loop)"];
Print["3. Γ^(4)(0) = -λ  ==>  δ_λ = 3*λ^2 * B(0)"];
Print["=================================================="];
