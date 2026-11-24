Get["FeynCalc`"];
TarcerPath = FileNameJoin[{$FeynCalcDirectory, "AddOns", "TARCER", "TARCER.m"}];
Get[TarcerPath];
(* Let's inspect Tarcer's W function format *)
Print[FullForm[Tarcer`W[1,1,1,1,1]]];
Exit[];
