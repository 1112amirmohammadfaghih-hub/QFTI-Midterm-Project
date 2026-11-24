(* Search FeynHelpersManual.pdf page by page *)
pdfPath = FileNameJoin[{Directory[], "FeynHelpersManual.pdf"}];
text = Import[pdfPath, "Text"];
Print["Text length: ", StringLength[text]];

(* Search for "Loop" or "Tarcer" or "TwoLoop" *)
matches = StringPosition[text, "Loop", IgnoreCase -> True];
Print["Found 'Loop' occurrences: ", Length[matches]];

tarcerMatches = StringPosition[text, "Tarcer", IgnoreCase -> True];
Print["Found 'Tarcer' occurrences: ", Length[tarcerMatches]];

(* Print snippets around Tarcer matches *)
Do[
  pos = tarcerMatches[[i, 1]];
  start = Max[1, pos - 200];
  end = Min[StringLength[text], pos + 300];
  Print["--- Tarcer Match ", i, " ---"];
  Print[StringTake[text, {start, end}]];
, {i, Length[tarcerMatches]}];

Exit[]
