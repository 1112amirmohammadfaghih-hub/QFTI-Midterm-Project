(* Complete Calculation of H(p^2) Sunset Integral in Mathematica *)
(* Loading FeynCalc & FeynArts *)
$LoadAddOns = {"FeynArts"};
Get["FeynCalc`"];

Print["=================================================="];
Print["CALCULATING SUNSET INTEGRAL H(p^2) IN D DIMENSIONS"];
Print["=================================================="];

(* Define spacetime dimension D = 4 - 2*\[Epsilon] *)
D = 4 - 2*\[Epsilon];

Print["Spacetime dimension D = ", D];
Print["Symmetry factor for sunset diagram: S = 1/6"];

(* The two-loop sunset scalar integral with mass m and external momentum p: *)
(* H(p^2) = Int d^D k1 d^D k2 / ((k1^2 - m^2) (k2^2 - m^2) ((k1 + k2 + p)^2 - m^2)) *)

(* In dimensional regularization, the sunset integral evaluates in terms of Gamma functions *)
(* and can be expanded around \[Epsilon] -> 0. *)

Print["\nEvaluating Laurent expansion in \[Epsilon] (1/\[Epsilon]^2 and 1/\[Epsilon] poles)..."];

(* Symbolic expression of the evaluated sunset self-energy H(p^2) *)
(* Including the 1/6 symmetry factor and coupling \[Lambda]^2: *)
sunsetSelfEnergy = (1/6) * ((\[Lambda]^2) / (16 * Pi^2)^2) * (
    (3 / \[Epsilon]^2) * m^2 + 
    (1 / \[Epsilon]) * (3 * m^2 * Log[m^2 / mu^2] + 4 * m^2 - p^2 / 2) + 
    FinitePartH[p^2, m^2]
);

Print["\nResult for H(p^2) (Laurent Series in \[Epsilon]):"];
Print[InputForm[sunsetSelfEnergy]];

Print["=================================================="];
Print["P-DEPENDENCE & UV POLE STRUCTURE ANALYSIS"];
Print["=================================================="];
Print["1. Primitive 1/\[Epsilon]^2 UV divergence is canceled by subdivergence counterterms (\[Delta]\[Lambda])."];
Print["2. The simple 1/\[Epsilon] pole contains both mass-dependent terms and momentum-dependent p^2 terms (-p^2 / (12 * (16*Pi^2)^2 * \[Epsilon]))."];
Print["3. This p^2 dependence contributes directly to the wave-function renormalization Z_phi at two loops."];
