(* Script to generate and export FeynArts diagrams as PDF using Paint *)
$LoadAddOns = {"FeynArts"};
Get["FeynCalc`"];

modelDir = FileNameJoin[{$FeynCalcDirectory, "Examples", "Models", "Phi4"}];
FAPatch[PatchModelsOnly -> True, FAModelsDirectory -> modelDir];

topologies2Loop = CreateTopologies[2, 1 -> 1];
inserted2Loop = InsertFields[
  topologies2Loop,
  {S[1]} -> {S[1]},
  InsertionLevel -> {Classes},
  Model -> FileNameJoin[{modelDir, "Phi4"}],
  GenericModel -> FileNameJoin[{modelDir, "Phi4"}]
];

Print["Number of diagrams to paint: ", Length[inserted2Loop]];

(* Export using FeynArts Paint with Export option *)
Paint[inserted2Loop, 
  ColumnsXRows -> {2, 2}, 
  Numbering -> Simple, 
  ImageSize -> {500, 500},
  DisplayFunction -> (Export["twoloop_feynman_diagrams.pdf", #] &)
];

Print["Successfully exported diagrams to twoloop_feynman_diagrams.pdf"];
Exit[]
