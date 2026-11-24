(* Test FeynArts Paint output with Print *)
$LoadAddOns = {"FeynArts"};
Get["FeynCalc`"];

modelDir = FileNameJoin[{$FeynCalcDirectory, "Examples", "Models", "Phi4"}];
FAPatch[PatchModelsOnly -> True, FAModelsDirectory -> modelDir];

topos = CreateTopologies[2, 1 -> 1];
inserted = InsertFields[topos, {S[1]} -> {S[1]}, InsertionLevel -> {Classes}, Model -> FileNameJoin[{modelDir, "Phi4"}], GenericModel -> FileNameJoin[{modelDir, "Phi4"}]];

Print["Topos length: ", Length[inserted]];
diag = Paint[inserted, ColumnsXRows -> {2, 2}, Numbering -> Simple];
Print["Paint result head: ", Head[diag]];
Export["diagrams.pdf", diag];
Print["Exported diagrams.pdf successfully"];
Exit[]
