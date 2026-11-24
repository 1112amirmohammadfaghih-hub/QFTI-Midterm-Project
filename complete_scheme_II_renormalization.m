(* Mathematica script: Complete Subsection 1.3 Renormalization Workflow in Scheme II *)
(* Including all midstep terms: exact loop integrals T and B, counterterms, and renormalization conditions *)
(* Using direct Greek notation (ϵ, Λ, Ω, π, Δ, etc.) *)

d = 4 - 2*ϵ;
Ω[dim_] := (2 * Pi^(dim/2)) / Gamma[dim/2];
measure[dim_] := Ω[dim] / (2 * Pi)^dim;

Print["=================================================="];
Print["SUBSECTION 1.3: COMPLETE SCHEME II RENORMALIZATION"];
Print["=================================================="];

(* --- STEP 1: DEFINE MIDSTEP LOOP INTEGRALS T AND B --- *)
Print["\n[Step 1] Computing Midstep Loop Amplitudes T (tadpole) and B (bubble) ..."];

(* Tadpole integral T with cutoff Λ *)
rawT = Integrate[k^(d - 1) / (k^2 + m^2), {k, 0, Λ}, Assumptions -> {Λ > 0, m > 0}];
T = measure[d] * rawT;

(* Bubble integral B(0) at zero external momentum with cutoff Λ *)
rawB0 = Integrate[k^(d - 1) / (k^2 + m^2)^2, {k, 0, Λ}, Assumptions -> {Λ > 0, m^2 > 0}];
B0 = measure[d] * rawB0;

Print["Tadpole Amplitude T computed."];
Print["Bubble Amplitude B(0) computed."];


(* --- STEP 2: DEFINE 1PI GREEN'S FUNCTIONS WITH COUNTERTERMS --- *)
Print["\n[Step 2] Defining Green's functions Γ^(2) and Γ^(4) with counterterm insertions ..."];

(* 2-point Green's function Γ^(2)(p) *)
(* Γ^(2)(p) = p^2 - m^2 - (λ/2)*T + (Z - 1)*p^2 - δ_m^2 *)
gamma2[p_] := p^2 - m^2 - (lambda / 2) * T + (Z - 1)*p^2 - deltaM2;

(* 4-point Green's function Γ^(4) *)
(* Γ^(4) = -λ + 3*λ^2 * B(0) - δ_λ *)
gamma4 := -lambda + (3 * lambda^2) * B0 - deltaLambda;

Print["Γ^(2)(p) = ", FullSimplify[gamma2[p]]];
Print["Γ^(4)    = ", FullSimplify[gamma4]];


(* --- STEP 3: APPLY SCHEME II RENORMALIZATION CONDITIONS (p = 0) --- *)
Print["\n[Step 3] Applying Scheme II Subtraction Conditions at p = 0 ..."];
Print["  Condition A: Γ^(2)(0) = -m^2"];
Print["  Condition B: d/dp^2 [Γ^(2)(p)] |_{p=0} = 1"];
Print["  Condition C: Γ^(4)(0) = -λ"];

(* Solve for counterterms δ_m^2, Z, and δ_λ *)
sol = Solve[{
    gamma2[0] == -m^2,
    D[gamma2[p], {p, 2}] == 1,
    gamma4 == -lambda
}, {deltaM2, Z, deltaLambda}];

deltaM2Val = deltaM2 /. sol[[1]];
ZVal = Z /. sol[[1]];
deltaLambdaVal = deltaLambda /. sol[[1]];

Print["\n[Step 4] Computed Counterterms for Scheme II:"];
Print["  δ_m^2     = ", FullSimplify[deltaM2Val]];
Print["  Z         = ", FullSimplify[ZVal]];
Print["  δ_λ       = ", FullSimplify[deltaLambdaVal]];

Print["\n=================================================="];
Print["Subsection 1.3 Complete: Scheme II Renormalization Done"];
Print["=================================================="];
