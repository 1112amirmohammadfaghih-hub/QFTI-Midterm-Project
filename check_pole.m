(* Inspect poles of the Beta / Hypergeometric expression for T *)

dim = 4 - 2*epsilon;
(* Using the Beta function exact form for T *)
expr = (1 / (2*Pi)^dim) * OmegaD[dim] * (1/2) * m^(dim-2) * Beta[-Lambda^2/m^2, dim/2, 1 - dim/2];
OmegaD[d_] := (2 * Pi^(d/2)) / Gamma[d/2];

(* Let's series expand around epsilon -> 0 to see where the pole comes from *)
ser = Series[expr, {epsilon, 0, -1}];
Print["Laurent series around epsilon -> 0:"];
Print[ser];
