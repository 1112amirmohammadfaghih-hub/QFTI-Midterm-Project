(* Complete Two-Loop 2-Point Function Script matching example of phi4.nb workflow *)
(* Includes: Topology generation, Painting, Amplitude conversion, PaVe reduction, UV poles, and Series expansion *)

$LoadAddOns = {"FeynArts"};
Get["FeynCalc`"];

modelDir = FileNameJoin[{$FeynCalcDirectory, "Examples", "Models", "Phi4"}];
Print["Model directory: ", modelDir];

FAPatch[PatchModelsOnly -> True, FAModelsDirectory -> modelDir];

Print["=== Step 1: Generate Two-Loop 2-Point Topologies & Insert Fields ==="];
topos2Loop = InsertFields[
  CreateTopologies[2, 1 -> 1],
  {S[1]} -> {S[1]},
  InsertionLevel -> {Classes},
  Model -> FileNameJoin[{modelDir, "Phi4"}],
  GenericModel -> FileNameJoin[{modelDir, "Phi4"}]
];

Print["Number of diagrams inserted: ", Length[topos2Loop]];

Print["=== Step 2: Paint Diagrams ==="];
Paint[topos2Loop, ColumnsXRows -> {2, 2}, Numbering -> Simple];

Print["=== Step 3: Create Feynman Amplitudes ==="];
amp2Loop = CreateFeynAmp[topos2Loop, PreFactor -> 1];

Print["=== Step 4: Convert Amplitudes with FCFAConvert & ChangeDimension -> D ==="];
fc2Loop = FCFAConvert[
  amp2Loop,
  IncomingMomenta -> {p},
  OutgoingMomenta -> {p},
  LoopMoments -> {k1, k2},
  ChangeDimension -> D,
  List -> False
];

Print["Resulting Amplitudes:"];
Print[InputForm[fc2Loop]];

Print["=== Step 5: Convert Loop Integrals to Passarino-Veltman (ToPaVe) ==="];
pave2Loop = ToPaVe[fc2Loop /. Mphi -> m, {k1, k2}];
Print[InputForm[pave2Loop]];

Print["=== Step 6: Extract UV Pole via PaVeUVPart ==="];
uv2Loop = PaVeUVPart[pave2Loop, Prefactor -> 1 / (2 Pi)^D];
Print[InputForm[uv2Loop]];

Print["=== Step 7: Laurent Series Expansion around D = 4 - 2 eps ==="];
series2Loop = Series[
  uv2Loop /. D -> 4 - 2 eps,
  {eps, 0, -1}
];
Print[InputForm[series2Loop]];

Export["twoloop_twopoint_pave_series.m", series2Loop];
Print["Saved full PaVe / Series analysis to twoloop_twopoint_pave_series.m"];
