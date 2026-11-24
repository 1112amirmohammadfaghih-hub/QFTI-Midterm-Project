(* Diagnostic script to inspect Paint output behavior *)
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

Print["Inserted diagrams: ", Length[inserted2Loop]];

(* Try painting with explicit Output -> DisplayFormat -> PostScript *)
res = Paint[inserted2Loop, 
  ColumnsXRows -> {2, 2}, 
  Numbering -> Simple, 
  ImageSize -> {400, 400},
  Output -> "diagrams.ps"
];
Print["Paint return: ", Head[res]];

(* Also check if Head of inserted2Loop[[1]] has PaintHead / MakeBoxes *)
Print["First diagram head: ", Head[inserted2Loop[[1]]]];
Exit[]
