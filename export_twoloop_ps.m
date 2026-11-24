(* Complete script to generate, paint, and export two-loop two-point Feynman diagrams in Phi^4 theory *)
$LoadAddOns = {"FeynArts"};
Get["FeynCalc`"];

modelDir = FileNameJoin[{$FeynCalcDirectory, "Examples", "Models", "Phi4"}];
Print["Model directory: ", modelDir];

FAPatch[PatchModelsOnly -> True, FAModelsDirectory -> modelDir];

Print["Generating two-loop two-point topologies (1 -> 1)..."];
topologies2Loop = CreateTopologies[2, 1 -> 1];
Print["Number of topologies: ", Length[topologies2Loop]];

inserted2Loop = InsertFields[
  topologies2Loop,
  {S[1]} -> {S[1]},
  InsertionLevel -> {Classes},
  Model -> FileNameJoin[{modelDir, "Phi4"}],
  GenericModel -> FileNameJoin[{modelDir, "Phi4"}]
];

Print["Number of inserted diagrams: ", Length[inserted2Loop]];

(* Paint and export to PostScript/PDF via standard FeynArts Paint mechanism *)
Paint[inserted2Loop, 
  ColumnsXRows -> {2, 2}, 
  Numbering -> Simple, 
  ImageSize -> {500, 500},
  Output -> "twoloop_twopoint_diagrams.ps"
];

Print["Exported diagrams to twoloop_twopoint_diagrams.ps successfully."];
Exit[]
