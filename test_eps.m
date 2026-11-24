(* Test diag export with Export string *)
$LoadAddOns = {"FeynArts"};
Get["FeynCalc`"];

modelDir = FileNameJoin[{$FeynCalcDirectory, "Examples", "Models", "Phi4"}];
FAPatch[PatchModelsOnly -> True, FAModelsDirectory -> modelDir];

topos = CreateTopologies[2, 1 -> 1];
inserted = InsertFields[topos, {S[1]} -> {S[1]}, InsertionLevel -> {Classes}, Model -> FileNameJoin[{modelDir, "Phi4"}], GenericModel -> FileNameJoin[{modelDir, "Phi4"}]];

Paint[inserted, ColumnsXRows -> {2, 2}, Numbering -> Simple, Output -> "twoloop_diagrams.eps"];
Print["Called Paint with Output -> twoloop_diagrams.eps"];
Exit[]
