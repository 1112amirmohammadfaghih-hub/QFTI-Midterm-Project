Get["FeynCalc`"];

(* To let FeynCalc evaluate scalar loop integrals automatically into standard Passarino-Veltman functions *)
(* or explicit Gamma function expressions, FeynCalc uses PaVe or LoopTools integration rules. *)
(* Let's define the loop integral using FeynCalc's OneLoop and evaluate it via PaVeReduce: *)

amp = OneLoop[k, 1/(SFVD[k]^2 + m^2)];
res = PaVeReduce[amp];
Print["PaVeReduce result: ", res];

(* In FeynCalc, evaluating PaVe explicitly requires loading LoopTools or using internal formulas. *)
(* Let's check how FeynCalc evaluates PaVe[0, {m^2}] automatically: *)
(* FeynCalc evaluates scalar 1-loop integrals when using TID or PaVeReduce with proper settings. *)
