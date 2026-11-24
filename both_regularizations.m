(* Mathematica script to compute both: *)
(* 1. Dimensional Regularization (D = 4 - 2 epsilon) using Gamma functions *)
(* 2. Momentum Cutoff (|k| < Lambda) exact integral *)

(* --- Part 1: Dimensional Regularization via Gamma Functions --- *)
(* Integral in D dimensions: int d^D k / (2pi)^D * 1 / (k^2 + m^2) *)
(* Using standard textbook formula via Feynman parameters / Beta / Gamma functions: *)
(* I_dim = (m^(D-2) / (4pi)^(D/2)) * Gamma(1 - D/2) *)

dim = 4 - 2*epsilon;
dimRegIntegral = (m^(dim - 2) / (4*Pi)^(dim / 2)) * Gamma[1 - dim / 2];

Print["--- 1. Dimensional Regularization Expression ---"];
Print[dimRegIntegral];

(* --- Part 2: Momentum Cutoff Regularization (|k| < Lambda) in D dimensions --- *)
(* Measure: Omega_D / (2pi)^D where Omega_D = 2 * Pi^(D/2) / Gamma[D/2] *)
(* Integral: int_0^Lambda k^(D-1) / (k^2 + m^2) dk *)

OmegaD[d_] := (2 * Pi^(d/2)) / Gamma[d/2];
cutoffIntegral = (OmegaD[dim] / (2 * Pi)^dim) * (1/2) * m^(dim - 2) * Beta[-Lambda^2/m^2, dim/2, 1 - dim/2];

Print["--- 2. Momentum Cutoff Expression ---"];
Print[cutoffIntegral];
