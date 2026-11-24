Get["FeynCalc`"];

(* Check if FeynCalc supports simultaneous momentum cutoff Lambda and dimensional regularization *)
(* FeynCalc natively uses dimensional regularization (D = 4 - 2epsilon) for 1-loop integrals. *)
(* A hard momentum cutoff |k| < Lambda is typically handled via ordinary Mathematica Integration *)
(* or Manual Passarino-Veltman matching, because FeynCalc's OneLoop / OneLoopIntegrate *)
(* are strictly built for dimensional regularization (or cutoff in older literature, but modern FeynCalc *)
(* delegates loop integration to PaVe functions defined in dimensional regularization). *)

Print["FeynCalc version: ", $FeynCalcVersion];
Print["Checking if Cutoff is a built-in option in OneLoopIntegrate or PaVe..."];
Print[Options[OneLoopIntegrate]];
