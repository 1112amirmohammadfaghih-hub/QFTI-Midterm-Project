(* Search FeynHelpersManual.pdf for multi-loop or Tarcer / FeynHelpers integration examples *)
pdfPath = FileNameJoin[{Directory[], "FeynHelpersManual.pdf"}];
text = Import[pdfPath, "Text"];
pages = StringSplit[text, "\x0c"];
Print["Total pages in PDF: ", Length[pages]];

Do[
  pageText = pages[[i]];
  If[StringContainsQ[pageText, IgnoreCase -> True]["loop"] || StringContainsQ[pageText, IgnoreCase -> True]["Tarcer"] || StringContainsQ[pageText, IgnoreCase -> True]["TwoLoop"],
    Print["=== Page ", i, " ==="];
    subLines = StringSplit[pageText, "\n"];
    relevant = Select[subLines, StringContainsQ[#, IgnoreCase -> True]["loop"] || StringContainsQ[#, IgnoreCase -> True]["tarcer"] || StringContainsQ[#, IgnoreCase -> True]["two"] || StringContainsQ[#, IgnoreCase -> True]["sunset"] &];
    Do[Print["  ", r], {r, Take[relevant, Min[5, Length[relevant]]]]];
  ];
, {i, Length[pages]}];

Exit[]
