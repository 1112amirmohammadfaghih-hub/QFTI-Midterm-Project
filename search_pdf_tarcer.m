pdfPath = FileNameJoin[{Directory[], "FeynHelpersManual.pdf"}];
text = Import[pdfPath, "Text"];
Print["Imported text length: ", StringLength[text]];
pos = StringPosition[text, "Tarcer", IgnoreCase -> True];
Print["Tarcer positions in manual: ", Length[pos]];
If[Length[pos] > 0,
  Do[
    start = Max[1, p[[1]] - 200];
    end = Min[StringLength[text], p[[2]] + 200];
    Print["--- Match ", i, " ---\n", StringTake[text, {start, end}]];
  , {i, Min[5, Length[pos]]}]
];
Exit[]
