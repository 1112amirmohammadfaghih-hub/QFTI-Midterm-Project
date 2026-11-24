(* Two-Loop 2-Point Function Generation and Amplitudes in Mathematica using FeynArts & FeynCalc *)

$LoadAddOns = {"FeynArts"};
Get["FeynCalc`"];

modelDir = FileNameJoin[{$FeynCalcDirectory, "Examples", "Models", "Phi4"}];
FAPatch[PatchModelsOnly -> True, FAModelsDirectory -> modelDir];

topologies2Loop = CreateTopologies[2, 1 -> 1, InsertionLevel -> {Particles}];
Print["Topologies count: ", Length[topologies2Loop]];

inserted2Loop = InsertFields[
  topologies2Loop,
  {S[1]} -> {S[1]},
  InsertionLevel -> {Classes},
  Model -> FileNameJoin[{modelDir, "Phi4"}],
  GenericModel -> FileNameJoin[{modelDir, "Phi4"}]
];

amp2Loop = CreateFeynAmp[inserted2Loop, PreFactor -> 1];

fc2Loop = FCFAConvert[
  amp2Loop,
  IncomingMoments -> {p},
  OutgoingMoments -> {p},
  LoopMoments -> {k, l},
  List -> False,
  DropSumDs -> True
];

Export["twoloop_twopoint_output.txt", ToString[fc2Loop, InputForm]];
Print["Exported result to twoloop_twopoint_output.txt"];
