(* Final clean script to output the analytical expression and expanded form clearly *)

dim = 4 - 2*epsilon;
OmegaD[d_] := (2 * Pi^(d/2)) / Gamma[d/2];
measure[d_] := OmegaD[d] / (2 * Pi)^d;

expr = measure[dim] * (1/2) * m^(dim-2) * Beta[-Lambda^2/m^2, dim/2, 1 - dim/2];

asymp = Asymptotic[expr, {Lambda, Infinity, 2}];
expansion = Normal[Series[asymp, {epsilon, 0, 0}]];

Print["--- Result ---"];
Print["Expanded expression:"];
Print[FullSimplify[expansion]];
