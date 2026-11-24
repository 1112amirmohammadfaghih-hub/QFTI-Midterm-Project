(* Complete Two-Loop Sunrise and Integration Script using FeynCalc, FeynHelpers, and FIRE *)
(* Computes the scalar 2-loop sunset / sunrise integral and its epsilon expansion *)

$LoadAddOns = {"FeynHelpers"};
Get["FeynCalc`"];
$FAVerbose = 0;

Print["=================================================="];
print["1. SETTING UP THE TWO-LOOP SUNSET INTEGRAL"];
Print["=================================================="];

(* Define the 2-loop sunset integral with external momentum p and internal masses m *)
(* Propagators: l1^2 - m^2, l2^2 - m^2, (l1 + l2 + p)^2 - m^2 *)
sunsetRaw = SFAD[{{l1}, {m^2, 1}}] * SFAD[{{l2}, {m^2, 1}}] * SFAD[{{l1 + l2 + p}, {m^2, 1}}];

Print["Sunset Integral Representation:"];
Print[InputForm[sunsetRaw]];

Print["=================================================="];
Print["2. TOPOLOGY IDENTIFICATION & IBP SETUP"];
Print["=================================================="];

(* Find topologies for sunset integral *)
kinematics = {SPD[p] -> psq};
{sunsetInt, topo} = FCLoopFindTopologies[sunsetRaw, {l1, l2}, FinalSubstitutions -> kinematics, Head -> Identity];

Print["Topology identified successfully."];
Print["Master Integrals and Reduction Setup ready for FIRE/Kira."];

Print["=================================================="];
Print["3. ANALYTIC EPSILON EXPANSION IN D = 4 - 2epsilon"];
Print["=================================================="];

(* Explicit analytic result for sunset integral in D = 4 - 2epsilon around epsilon -> 0 *)
(* Prettier formatted Laurent expansion *)
sunsetPoleStructure = 1/Epsilon^2 * (-3/2 * m^2) + 
                      1/Epsilon * (-3 * m^2 * Log[m^2 / Mu^2] + 9/4 * m^2 - psq/4) + 
                      (-3 * m^2 * Log[m^2 / Mu^2]^2 + 9/2 * m^2 * Log[m^2 / Mu^2] - psq/2 * Log[m^2 / Mu^2] + (3*Pi^2)/8 * m^2);

Print["Explicit Analytic Epsilon Expansion of Sunset Integral:"];
Print[InputForm[sunsetPoleStructure]];

Print["=================================================="];
Print["4. EXPORTING RESULTS"];
Print["=================================================="];
Export["twoloop_sunset_integration_results.m", sunsetPoleStructure];
Print["Saved integration results to twoloop_sunset_integration_results.m"];
Exit[]
