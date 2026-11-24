(* Search FeynHelpers files and manual for 2-loop calculations / Tarcer *)
feynHelpersDir = "C:\\Users\\king\\AppData\\Roaming\\Wolfram\\Applications\\FeynHelpers";
files = FileNames["*", feynHelpersDir, Infinity];
matching = Select[files, StringContainsQ[#, IgnoreCase -> True]["tarcer"] || StringContainsQ[#, IgnoreCase -> True]["twoloop"] || StringContainsQ[#, IgnoreCase -> True]["sunset"] &];
Print["Matching files in FeynHelpers:"];
Do[Print["  ", f], {f, matching}];

(* Also check pdf text if possible *)
pdfPath = FileNameJoin[{Directory[], "FeynHelpersManual.pdf"}];
If[FileExistsQ[pdfPath],
  Print["FeynHelpersManual.pdf exists. Size: ", FileByteCount[pdfPath]];
,
  Print["FeynHelpersManual.pdf not found in workspace."]
];
Exit[]
