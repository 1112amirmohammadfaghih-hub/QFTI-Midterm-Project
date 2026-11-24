(* Template-Aligned Two-Loop 2-Point Function Diagrams and Amplitudes in Mathematica *)
(* Following the exact style of example of phi4.nb *)

$LoadAddOns = {"FeynArts"};
Get["FeynCalc`"];

modelDir = FileNameJoin[{$FeynCalcDirectory, "Examples", "Models", "Phi4"}];
Print["Model directory: ", modelDir];

FAPatch[PatchModelsOnly -> True, FAModelsDirectory -> modelDir];

Print["=== Step 1: Generate Two-Loop Two-Point Topologies (1 -> 1) ==="];
topologies2Loop = InsertFields[
  CreateTopologies[2, 1 -> 1],
  {S[1]} -> {S[1]},
  InsertionLevel -> {Classes},
  Model -> FileNameJoin[{modelDir, "Phi4"}],
  GenericModel -> FileNameJoin[{modelDir, "Phi4"}]
];

Print["Number of inserted diagrams: ", Length[topologies2Loop]];
Paint[topologies2Loop, DisplayFunction -> Identity];

Print["=== Step 2: Create Feynman Amplitudes ==="];
fa2Loop = CreateFeynAmp[topologies2Loop, PreFactor -> 1];

Print["=== Step 3: Convert Amplitudes to FeynCalc Format ==="];
fc2Loop = FCFAConvert[
  fa2Loop,
  IncomingMomenta -> {p},
  OutgoingMoments -> {p},
  LoopMoments -> {k1, k2},
  ChangeDimension -> D,
  List -> False
];

Print["Resulting Amplitudes:"];
Print[InputForm[fc2Loop]];

Export["twoloop_twopoint_template_results.m", fc2Loop];
Print["Saved template-aligned amplitudes to twoloop_twopoint_template_results.m"];
