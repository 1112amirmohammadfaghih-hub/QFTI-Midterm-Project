(* Evaluate exact B(0) numerically with dim = 3.98 *)

dimVal = 3.98;
OmegaDVal = (2 * Pi^(dimVal/2)) / Gamma[dimVal/2];
b0Num = (1 / (2*Pi)^dimVal) * OmegaDVal * Integrate[k^(dimVal - 1) / (k^2 + 1)^2, {k, 0, 100}];
Print["Direct numerical integration of B(0): ", N[b0Num]];

(* Direct numerical integration of - dT/dm^2 *)
tNum = (1 / (2*Pi)^dimVal) * OmegaDVal * Integrate[k^(dimVal - 1) / (k^2 + m^2), {k, 0, 100}];
dtNum = - (1 / (2 * m)) * N[D[tNum, m] /. m -> 1];
Print["Direct numerical integration of -dT/dm^2: ", dtNum];
