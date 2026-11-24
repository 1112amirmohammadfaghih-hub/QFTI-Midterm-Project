(* Script to paint diagrams and export them as images using FeynArts Paint with DisplayFunction and Export *)
$LoadAddOns = {"FeynArts"};
Get["FeynCalc`"];

modelDir = FileNameJoin[{$FeynCalcDirectory, "Examples", "Models", "Phi4"}];
FAPatch[PatchModelsOnly -> True, FAModelsDirectory -> modelDir];

topos = CreateTopologies[2, 1 -> 1];
inserted = InsertFields[topos, {S[1]} -> {S[1]}, InsertionLevel -> {Classes}, Model -> FileNameJoin[{modelDir, "Phi4"}], GenericModel -> FileNameJoin[{modelDir, "Phi4"}]];

Print["Painting diagrams..."];
(* Paint using DisplayFunction to export each diagram to PNG via Export *)
Paint[inserted, 
  ColumnsXRows -> {2, 2}, 
  Numbering -> Simple, 
  ImageSize -> {500, 500},
  DisplayFunction -> (Export["twoloop_diagram.png", #] &)
);

Print["Done painting and exporting."];
Exit[]
