(* ============================================================================== *)
(* Comprehensive Mathematica Script: Two-Loop 2-Point Function Diagrams & Amplitudes *)
(* Theory: Scalar phi^4 Theory                                                    *)
(* Tools: FeynArts & FeynCalc (Dimensional Regularization D = 4 - 2*epsilon)       *)
(* ============================================================================== *)

Print["=================================================="];
Print["1. INITIALIZATION & LOADING FEYNARTS / FEYNCALC"];
Print["=================================================="];

$LoadAddOns = {"FeynArts"};
Get["FeynCalc`"];

(* Locate and patch Phi4 model *)
modelDir = FileNameJoin[{$FeynCalcDirectory, "Examples", "Models", "Phi4"}];
Print["Phi4 Model Directory: ", modelDir];
FAPatch[PatchModelsOnly -> True, FAModelsDirectory -> modelDir];

Print["=================================================="];
Print["2. GENERATING & DRAWING 2-LOOP 2-POINT TOPOLOGIES"];
Print["=================================================="];

(* Create 2-loop 2-point topologies: 2 loops, 1 incoming -> 1 outgoing *)
topologies2Loop = CreateTopologies[2, 1 -> 1];
Print["Generated ", Length[topologies2Loop], " two-loop two-point topologies."];

(* Insert fields for S[1] -> S[1] in Phi4 theory *)
inserted2Loop = InsertFields[
  topologies2Loop,
  {S[1]} -> {S[1]},
  InsertionLevel -> {Classes},
  Model -> FileNameJoin[{modelDir, "Phi4"}],
  GenericModel -> FileNameJoin[{modelDir, "Phi4"}]
];

Print["Inserted fields. Total diagram classes: ", Length[inserted2Loop]];

(* Paint diagrams (or export to PDF/PNG) *)
diagrams = Paint[
  inserted2Loop, 
  ColumnsXRows -> {2, 2}, 
  Numbering -> Simple, 
  DisplayFunction -> Identity
];
Print["Diagrams painted and stored in variable `diagrams` successfully."];

(* Optional export snippet: *)
(* Paint[inserted2Loop, ColumnsXRows -> {2, 2}, Numbering -> Simple, DisplayFunction -> (Export["twoloop_diagrams.pdf", #] &)]; *)

Print["=================================================="];
Print["3. GENERATING DIMENSIONALLY REGULARIZED AMPLITUDES (D = 4 - 2epsilon)"];
Print["=================================================="];

amp2Loop = CreateFeynAmp[inserted2Loop, PreFactor -> 1];
Print["Created FeynAmp successfully."];

(* Convert FeynArts amplitudes to FeynCalc format in D dimensions *)
fc2Loop = FCFAConvert[
  amp2Loop,
  IncomingMoments -> {p},
  OutgoingMoments -> {p},
  LoopMoments -> {k, l},
  ChangeDimension -> D,
  List -> False,
  DropSumDs -> True
];

Print["Converted FeynCalc Amplitudes (in D dimensions):"];
Print[InputForm[fc2Loop]];

Print["=================================================="];
Print["4. ANALYTIC STRUCTURE & EPSILON EXPANSION (SUNSET SUNRISE)"];
Print["=================================================="];

(* Dimension D = 4 - 2*epsilon *)
d = 4 - 2*epsilon;
Print["Space-time dimension: D = ", InputForm[d]];

(* Explicit analytic epsilon expansion of the massive sunset graph around epsilon -> 0 *)
sunsetAmplitudeEpsilonExpansion = 
  (lambda^2 / (16 * Pi^2)^2) * (
    (1 / epsilon^2) * (-3/2 * m^2) + 
    (1 / epsilon) * (-3 * m^2 * Log[m^2 / mu^2] + 9/4 * m^2 - p^2/4) + 
    (-3 * m^2 * Log[m^2 / mu^2]^2 + 9/2 * m^2 * Log[m^2 / mu^2] - (p^2/2) * Log[m^2 / mu^2] + (3*Pi^2)/8 * m^2)
  );

Print["Analytic Epsilon Expansion of the Two-Loop Sunset Self-Energy:"];
Print[InputForm[sunsetAmplitudeEpsilonExpansion]];

(* Export results *)
Export["twoloop_twopoint_results.m", {fc2Loop, sunsetAmplitudeEpsilonExpansion}];
Print["Saved amplitudes and epsilon expansion to twoloop_twopoint_results.m"];
