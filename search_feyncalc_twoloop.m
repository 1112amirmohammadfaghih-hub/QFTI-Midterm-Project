(* Search FeynCalc and FeynHelpers examples for 2-loop / Tarcer / MultiLoop *)
Get["FeynCalc`"];
$LoadAddOns = {"FeynHelpers"};
Get["FeynHelpers`"];

examplesDir = FileNameJoin[{$FeynCalcDirectory, "Examples"}];
files = FileNames["*", examplesDir, Infinity];

Print["--- FeynCalc Examples matching 'Tarcer', 'Loop', 'Two', 'Multi' ---"];
matching = Select[files, StringContainsQ[#, IgnoreCase -> True]["tarcer"] || StringContainsQ[#, IgnoreCase -> True]["twoloop"] || StringContainsQ[#, IgnoreCase -> True]["sunset"] || StringContainsQ[#, IgnoreCase -> True]["multiloop"] &];
Do[Print["  ", f], {f, matching}];

(* Also check FeynHelpers examples if any *)
feynHelpersDir = If[ValueQ[$FeynHelpersDirectory], $FeynHelpersDirectory, FileNameJoin[{ParentDirectory[$FeynCalcDirectory], "FeynHelpers"}]];
Print["FeynHelpers path check: ", feynHelpersDir];
If[DirectoryQ[feynHelpersDir],
  helperFiles = FileNames["*", feynHelpersDir, Infinity];
  Print["Total files in FeynHelpers: ", Length[helperFiles]];
  helperMatching = Select[helperFiles, StringContainsQ[#, IgnoreCase -> True]["tarcer"] || StringContainsQ[#, IgnoreCase -> True]["twoloop"] || StringContainsQ[#, IgnoreCase -> True]["sunset"] || StringContainsQ[#, IgnoreCase -> True]["example"] &];
  Do[Print["  [Helper] ", f], {f, helperMatching}];
,
  Print["FeynHelpers directory not found directly at ", feynHelpersDir]
];

Exit[]
