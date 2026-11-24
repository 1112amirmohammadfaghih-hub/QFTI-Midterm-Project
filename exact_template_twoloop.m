(* Exact Template Match to example of phi4.nb for Two-Loop 2-Point Function *)
(* Using exact syntax: CreateTopologies[2, 1 -> 1], InsertFields with Model -> FileNameJoin[{modelDir, "Phi4"}], Paint, CreateFeynAmp, FCFAConvert *)

$LoadAddOns = {"FeynArts"};
Get["FeynCalc`"];

modelDir = FileNameJoin[{$FeynCalcDirectory, "Examples", "Models", "Phi4"}];
Print["Model directory: ", modelDir];

FAPatch[PatchModelsOnly -> True, FAModelsDirectory -> modelDir];

Print["=== Step 1: Generate Two-Loop 2-Point Topologies & Insert Fields ==="];
topos2Loop = InsertFields[
  CreateTopologies[2, 1 -> 1],
  {S[1]} -> {S[1]},
  InsertionLevel -> {Classes},
  Model -> FileNameJoin[{modelDir, "Phi4"}],
  GenericModel -> FileNameJoin[{modelDir, "Phi4"}]
];

Print["Number of diagrams inserted: ", Length[topos2Loop]];

Print["=== Step 2: Paint Diagrams (matching example of phi4.nb Paint[..]) ==="];
Paint[topos2Loop, ColumnsXRows -> {2, 2}, Numbering -> Simple];

Print["=== Step 3: Create Feynman Amplitudes ==="];
amp2Loop = CreateFeynAmp[topos2Loop, PreFactor -> 1];

Print["=== Step 4: Convert Amplitudes with FCFAConvert ==="];
fc2Loop = FCFAConvert[
  amp2Loop,
  IncomingMomenta -> {p},
  OutgoingMomenta -> {p},
  LoopMoments -> {k1, k2},
  ChangeDimension -> D,
  List -> False
];

Print["Resulting Amplitudes:"];
Print[InputForm[fc2Loop]];

Export["twoloop_twopoint_exact_template.m", fc2Loop];
Print["Saved exact template results to twoloop_twopoint_exact_template.m"];
