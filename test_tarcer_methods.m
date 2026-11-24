Get["FeynCalc`"];
TarcerPath = FileNameJoin[{$UserBaseDirectory, "Applications", "FeynCalc", "AddOns", "TARCER", "TARCER.m"}];
If[!FileExistsQ[TarcerPath], TarcerPath = FileNameJoin[{$FeynCalcDirectory, "AddOns", "TARCER", "TARCER.m"}]];
Get[TarcerPath];
Print["TARCER loaded successfully."];
(* Check TARCER functions for sunset *)
Print[Names["TARCER`*"]];
Exit[];
