Get["FeynCalc`"];
{fcConverted, ampTopos, topos} = Get["twoloop_twopoint_fully_automated_results.m"];
Do[
  Print["AMP ", i, ": ", ToString[fcConverted[[i]]]];
  , {i, Length[fcConverted]}
];
Exit[];
