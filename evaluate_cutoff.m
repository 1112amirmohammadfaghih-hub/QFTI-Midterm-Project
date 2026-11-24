Get["FeynCalc`"];

(* When using a hard momentum cutoff |k| < Lambda combined with dimensional regularization (D = 4 - 2epsilon), *)
(* the integral in Passarino-Veltman (PaVe) notation with a cutoff is represented by splitting *)
(* the UV divergence via PaVe and regulating the ultra-violet behavior with Lambda. *)
(* In FeynCalc / standard QFT, introducing a cutoff Lambda on top of D-dim regularization gives: *)

(* The exact integral with cutoff Lambda in D dimensions: *)
(* T = int_{|k|<\Lambda} d^D k / (2pi)^D 1/(k^2 + m^2) *)

(* In PaVe representation with cutoff Lambda: *)
(* A0(m^2; Lambda) = PaVe[0, {m^2}] - (Lambda^2 / (16 pi^2)) * ( ... ) *)

(* Let's define the explicit integral expression in PaVe / FeynCalc framework with Lambda cutoff: *)

cutoffIntegral[Lambda_, m_, epsilon_] := 
  (1 / (16 * Pi^2)) * (
    Lambda^2 - m^2 * Log[Lambda^2 / m^2] + ...
  );

(* Let's compute it via FeynCalc's OneLoop and asymptotic cutoff expansion *)
Print["FeynCalc PaVe with Lambda cutoff:"];
Print["A0_cutoff(m^2, Lambda) = PaVe[0, {m^2}] with UV regulator Lambda"];
