feynHelpersDir = "C:\\Users\\king\\AppData\\Roaming\\Wolfram\\Applications\\FeynHelpers";
docDir = FileNameJoin[{feynHelpersDir, "Documentation"}];
files = FileNames["*", docDir, Infinity];
Print["Documentation files: ", Length[files]];
Do[Print["  ", f], {f, Select[files, StringContainsQ[#, IgnoreCase -> True]["tarcer"] || StringContainsQ[#, IgnoreCase -> True]["loop"] &]}];
Exit[]
