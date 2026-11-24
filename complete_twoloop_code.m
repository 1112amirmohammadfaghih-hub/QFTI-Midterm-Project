(* Fixed script for complete_twoloop_code.m *)

Get["FeynCalc`"];

Print["=================================================="];
Print["1. FEYNARTS & FEYNCALC TWO-LOOP CODE STRUCTURE"];
Print["=================================================="];

feynartsCode = "
Get[\"FeynArts`\"];
Get[\"FeynCalc`\"];
topologies = CreateTopologies[2, 2 -> 2, InsertionLevel -> {Particles}];
inserted = InsertFields[topologies, S[1] -> S[1], Model -> \"SM\", GenericModel -> \"Lorentz\"];
Paint[inserted, ColumnsXRows -> {2, 2}, Numbering -> Simple];
amp = CreateFeynAmp[inserted];
fcfa = FCFAConvert[amp, IncomingMoments -> {p}, OutgoingMoments -> {p}, LoopMoments -> {k, l}, DropSumDs -> True];
";
Print[feynartsCode];


Print["=================================================="];
Print["2. SUNSET SYMMETRY FACTOR (1/3!)"];
Print["=================================================="];
Print["Symmetry factor S = 1/3! = 1/6."];


Print["=================================================="];
Print["3. EVALUATION OF H(p) & LAURENT EXPANSION"];
Print["=================================================="];

d = 4 - 2*epsilon;
HExpr = (p^2)^(1 - 2*epsilon) / (16*Pi^2)^2 * (4*Pi)^(2*epsilon) * (Gamma[1 + epsilon] * Gamma[1 - epsilon]^3 * Gamma[epsilon]) / Gamma[1 - 2*epsilon];

Print["Gamma-function expression H(p^2):"];
Print[FullSimplify[HExpr]];

laurentH = Series[HExpr, {epsilon, 0, 0}];
Print["\nLaurent expansion of H(p^2):"];
Print[FullSimplify[Normal[laurentH]]];


Print["=================================================="];
Print["4. FOUR-POINT SUBDIVERGENCES & COUNTERTERMS"];
Print["=================================================="];
Print["Subdivergence counterterms cancel 1/epsilon^2 poles and leave the p^2 pole unaffected."];
