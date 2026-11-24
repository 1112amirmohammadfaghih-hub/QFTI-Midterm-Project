(* Two-Loop 2-Point Function Step 1: Generation & Amplitude *)

$LoadAddOns = {"FeynArts"};
Get["FeynCalc`"];

modelDir = FileNameJoin[{$FeynCalcDirectory, "Examples", "Models", "Phi4"}];
FAPatch[PatchModelsOnly -> True, FAModelsDirectory -> modelDir];

topos2Loop = InsertFields[
  CreateTopologies[2, 1 -> 1],
  {S[1]} -> {S[1]},
  InsertionLevel -> {Classes},
  Model -> FileNameJoin[{modelDir, "Phi4"}],
  GenericModel -> FileNameJoin[{modelDir, "Phi4"}]
];

Paint[topos2Loop, ColumnsXRows -> {2, 2}, Numbering -> Simple];

amp2Loop = CreateFeynAmp[topos2Loop, PreFactor -> 1];

fc2Loop = FCFAConvert[
  amp2Loop,
  IncomingMomenta -> {p},
  OutgoingMoments -> {p},
  LoopMoments -> {k1, k2},
  ChangeDimension -> D,
  List -> False
];

Print["Successfully generated and converted two-loop amplitudes."];
Export["twoloop_raw_amplitude.m", fc2Loop];
