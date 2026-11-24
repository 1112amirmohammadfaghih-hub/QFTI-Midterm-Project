Get["FeynCalc`"];
TarcerPath = FileNameJoin[{$FeynCalcDirectory, "AddOns", "TARCER", "TARCER.m"}];
Get[TarcerPath];
Print["TARCER loaded. Contexts: ", $ContextPath];
Print["Loaded symbols: ", Names["*W*"]];
Exit[];
