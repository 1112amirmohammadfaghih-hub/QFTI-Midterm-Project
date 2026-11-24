(* Mathematica Script: Two-Loop 2-Point Function Diagrams and Amplitudes *)
(* Model: phi^4 Theory (using Phi4 model in FeynArts / FeynCalc) *)

Print["=================================================="];
Print["1. LOADING FEYNARTS AND FEYNCALC"];
Print["=================================================="];

$LoadAddOns = {"FeynArts"};
Get["FeynCalc`"];

(* Locate Phi4 model directory *)
modelDir = FileNameJoin[{$FeynCalcDirectory, "Examples", "Models", "Phi4"}];
If[FileExistsQ[FileNameJoin[{modelDir, "Phi4.mod"}]],
  Print["Phi4 model found successfully at: ", modelDir],
  Print["Warning: Phi4 model directory not found at standard location. Please check FeynArts installation."]
];

FAPatch[PatchModelsOnly -> True, FAModelsDirectory -> modelDir];

Print["=================================================="];
Print["2. GENERATING TWO-LOOP 2-POINT TOPOLOGIES"];
Print["=================================================="];

(* 2-loop, 2-point function: incoming 1 -> outgoing 1 (or S[1] -> S[1] in Phi4) *)
topologies2Loop = CreateTopologies[2, 1 -> 1, InsertionLevel -> {Particles}];
Print["Number of 2-loop 2-point topologies generated: ", Length[topologies2Loop]];

(* Insert fields for Phi4 model *)
inserted2Loop = InsertFields[topologies2Loop, 
  S[1] -> S[1], 
  Model -> "Phi4", 
  GenericModel -> "Lorentz"
];

Print["Fields inserted into topologies."];

Print["=================================================="];
Print["3. CREATING FEYNMAN AMPLITUDES"];
Print["=================================================="];

amp2Loop = CreateFeynAmp[inserted2Loop];
Print["FeynAmp created successfully. Number of amplitudes: ", Length[amp2Loop]];

(* Convert to FeynCalc format *)
fcfa2Loop = FCFAConvert[amp2Loop, 
  IncomingMoments -> {p}, 
  OutgoingMoments -> {p}, 
  LoopMoments -> {k, l}, 
  DropSumDs -> True
];

Print["Converted FeynArts amplitudes to FeynCalc format."];
Print[fcfa2Loop];

Print["=================================================="];
Print["4. ANALYTIC STRUCTURE OF THE TWO-LOOP SUNSET DIAGRAM"];
Print["=================================================="];
Print["Sunset self-energy amplitude at two loops:"];
Print["  Sigma(p^2) = (lambda^2 / 3!) * Int d^d k d^d l / ((k^2 - m^2) (l^2 - m^2) ((p - k - l)^2 - m^2))"];
