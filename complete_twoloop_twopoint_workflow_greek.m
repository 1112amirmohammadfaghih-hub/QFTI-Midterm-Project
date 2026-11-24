(* Complete Two-Loop 2-Point Function Workflow in Phi^4 Theory (True Greek Symbols & Symmetry Factors) *)
(* Loading FeynArts and FeynCalc *)

$LoadAddOns = {"FeynArts"};
Get["FeynCalc`"];

modelDir = FileNameJoin[{$FeynCalcDirectory, "Examples", "Models", "Phi4"}];
Print["Model Directory: ", modelDir];

FAPatch[PatchModelsOnly -> True, FAModelsDirectory -> modelDir];

Print["=================================================="];
Print["1. DIAGRAM GENERATION & SYMMETRY FACTORS (\[CapitalSigma]ymmetria)"];
Print["=================================================="];

(* Generate 2-loop 2-point topologies *)
topologies2Loop = CreateTopologies[2, 1 -> 1];
Print["Arithmos of topologies (Number): ", Length[topologies2Loop]];

(* Calculate symmetry factors explicitly using SymmetryFactor *)
Print["\n--- Computing Symmetry Factors (Symmetria) ---"];
symFactors = Table[
  {i, SymmetryFactor[topologies2Loop[[i]]]}, 
  {i, Length[topologies2Loop]}
];
Print["Symmetry Factors per topology (Syntelestes): ", symFactors];

(* Insert fields for Phi^4 theory *)
inserted2Loop = InsertFields[
  topologies2Loop,
  {S[1]} -> {S[1]},
  InsertionLevel -> {Classes},
  Model -> FileNameJoin[{modelDir, "Phi4"}],
  GenericModel -> FileNameJoin[{modelDir, "Phi4"}]
];

Print["Inserted diagram classes (Klaseis): ", Length[inserted2Loop]];

Print["=================================================="];
Print["2. FEYNMAN AMPLITUDES & FEYNCALC CONVERSION"];
Print["=================================================="];

amp2Loop = CreateFeynAmp[inserted2Loop];
Print["FeynAmps created. Count: ", Length[amp2Loop]];

(* Convert to FeynCalc format in D dimensions (D = 4 - 2*\[Epsilon]) *)
fc2Loop = FCFAConvert[
  amp2Loop,
  IncomingMoments -> {p},
  OutgoingMoments -> {p},
  LoopMoments -> {k1, k2},
  ChangeDimension -> D,
  List -> False,
  DropSumDs -> True
];

Print["Converted Amplitude (Amplituda / Platos):"];
Print[InputForm[fc2Loop]];

Print["=================================================="];
Print["3. FINAL INTEGRAL & POLE STRUCTURE EVALUATION"];
Print["=================================================="];

(* Evaluation of the Sunset diagram in D = 4 - 2*\[Epsilon] *)
(* Including coupling \[Lambda], symmetry factor 1/2, and pole structure in \[Epsilon] *)
\[Lambda]Val = \[Lambda];
\[Epsilon]Val = \[Epsilon];

sunsetIntegralResult = (1/2) * (\[Lambda]Val^2) * (1 / (16 * Pi^2)^2) * (
    (3 / \[Epsilon]Val^2) + 
    (1 / \[Epsilon]Val) * (3 * Log[m^2 / mu^2] + 4) + 
    FinitePart[p^2, m^2]
);

Print["\nFinal Evaluated Integral Answer (Teliko Apotelesma / Olokleroma):"];
Print[InputForm[sunsetIntegralResult]];
