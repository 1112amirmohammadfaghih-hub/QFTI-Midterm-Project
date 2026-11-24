$LoadAddOns = {"FeynHelpers"};
Get["FeynCalc`"];
modelDir = FileNameJoin[{$FeynCalcDirectory, "Examples", "Models", "Phi4"}];
FAPatch[PatchModelsOnly -> True, FAModelsDirectory -> modelDir];
topologies2Loop = CreateTopologies[2, 1 -> 1];
inserted2Loop = InsertFields[topologies2Loop, {S[1]} -> {S[1]}, InsertionLevel -> {Classes}, Model -> FileNameJoin[{modelDir, "Phi4"}], GenericModel -> FileNameJoin[{modelDir, "Phi4"}]];
amp2Loop = CreateFeynAmp[inserted2Loop, PreFactor -> 1];
fc2Loop = FCFAConvert[amp2Loop, ChangeDimension -> D, List -> False, DropSumDs -> True];
Print["FC2Loop converted:"];
Print[InputForm[fc2Loop]];

(* Let's test FeynHelpers / Tarcer or FCLoopFindTopologies / OneLoop / TwoLoop integration *)
Print["Testing FCLoopFindTopologies..."];
tops = FCLoopFindTopologies[fc2Loop, {LoopMom1, LoopMom2}];
Print[InputForm[tops]];
Exit[];
