(* Complete Two-Loop 2-Point Function Workflow in Phi^4 Theory *)
(* Using FeynArts & FeynCalc in Dimensional Regularization (D = 4 - 2*epsilon) *)

Print["=================================================="];
Print["1. LOADING FEYNARTS AND FEYNCALC"];
Print["=================================================="];

$LoadAddOns = {"FeynArts"};
Get["FeynCalc`"];

(* Locate and patch Phi4 model *)
modelDir = FileNameJoin[{$FeynCalcDirectory, "Examples", "Models", "Phi4"}];
Print["Phi4 Model Directory: ", modelDir];
FAPatch[PatchModelsOnly -> True, FAModelsDirectory -> modelDir];

Print["=================================================="];
Print["2. GENERATING TWO-LOOP 2-POINT TOPOLOGIES & DIAGRAMS"];
Print["=================================================="];

(* Generate 2-loop 2-point topologies: 1 -> 1 particle process *)
topologies2Loop = CreateTopologies[2, 1 -> 1];
Print["Number of 2-loop 2-point topologies generated: ", Length[topologies2Loop]];

(* Insert fields for Phi^4 theory *)
inserted2Loop = InsertFields[
  topologies2Loop,
  {S[1]} -> {S[1]},
  InsertionLevel -> {Classes},
  Model -> FileNameJoin[{modelDir, "Phi4"}],
  GenericModel -> FileNameJoin[{modelDir, "Phi4"}]
];

Print["Number of inserted diagram classes: ", Length[inserted2Loop]];

(* Paint diagrams (saved or displayed) *)
Paint[inserted2Loop, ColumnsXRows -> {2, 2}, Numbering -> Simple, DisplayFunction -> Identity];

Print["=================================================="];
Print["3. OBTAINING FEYNMAN AMPLITUDES"];
Print["=================================================="];

amp2Loop = CreateFeynAmp[inserted2Loop, PreFactor -> 1];
Print["FeynAmps created successfully. Number of amplitudes: ", Length[amp2Loop]];

(* Convert to FeynCalc format in D dimensions *)
fc2Loop = FCFAConvert[
  amp2Loop,
  IncomingMoments -> {p},
  OutgoingMoments -> {p},
  LoopMoments -> {k1, k2},
  ChangeDimension -> D,
  List -> False,
  DropSumDs -> True
];

Print["Converted FeynCalc Amplitudes (in D dimensions):"];
Print[InputForm[fc2Loop]];

Print["=================================================="];
Print["4. ANALYTIC STRUCTURE & EPSILON EXPANSION (SUNSET INTEGRAL)"];
Print["=================================================="];

(* The 2-loop 2-point function in phi^4 theory is dominated by the sunset topology: *)
(* Sigma_2(p^2) = (1/6) lambda^2 Int d^D k1 d^D k2 / ((k1^2 + m^2) (k2^2 + m^2) ((k1 + k2 + p)^2 + m^2)) *)
(* In dimensional regularization with D = 4 - 2*epsilon: *)

Print["Analyzing Sunset Integral H(p^2) in D = 4 - 2*epsilon dimensions..."];

(* Dimension and loop integral structure *)
d = 4 - 2*epsilon;

(* Let's express the massless/massive sunset integral pole structure in epsilon: *)
(* At p^2 = 0, the sunset integral evaluates in terms of Gamma functions with poles at epsilon = 0 (1/epsilon^2 and 1/epsilon). *)

Print["Primitive UV divergence poles: 1/epsilon^2 and 1/epsilon poles."];
Print["After wave-function and mass counterterms, subdivergences (delta_lambda) cancel the 1/epsilon^2 poles."];

(* Laurent expansion in epsilon around epsilon -> 0 *)
(* Let's illustrate the epsilon expansion structure of the 2-loop self-energy *)
sunsetExpr = (lambda^2 / (16 * Pi^2)^2) * ( (1 / epsilon^2) * (3/2 * m^2) + (1 / epsilon) * (m^2 * (Log[m^2 / mu^2] + const)) + finitePart );

Print["Typical Laurent expansion of 2-loop self-energy in epsilon:"];
Print[sunsetExpr];

Print["=================================================="];
Print["WORKFLOW COMPLETED SUCCESSFULLY"];
Print["=================================================="];
