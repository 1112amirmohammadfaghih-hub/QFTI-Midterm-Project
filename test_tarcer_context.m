Get["FeynCalc`"];
TarcerPath = FileNameJoin[{$UserBaseDirectory, "Applications", "FeynCalc", "AddOns", "TARCER", "TARCER.m"}];
If[!FileExistsQ[TarcerPath], TarcerPath = FileNameJoin[{$FeynCalcDirectory, "AddOns", "TARCER", "TARCER.m"}]];
Get[TarcerPath];
Print["Tarcer context loaded. Names in Tarcer` context:"];
Print[Names["Tarcer`*"]];
Exit[];
