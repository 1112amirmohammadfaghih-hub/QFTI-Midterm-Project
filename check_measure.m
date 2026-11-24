(* Verify the integration measure and the full evaluated integral structure *)

dim = 4 - 2*epsilon;
OmegaD[d_] := (2 * Pi^(d/2)) / Gamma[d/2];
measure[d_] := OmegaD[d] / (2 * Pi)^d;

rawIntegral = Integrate[k^(dim - 1) / (k^2 + m^2), {k, 0, Lambda}, Assumptions -> {Lambda > 0, m > 0}];
fullExpr = measure[dim] * rawIntegral;

Print["Measure factor:"];
Print[measure[dim]];

Print["\nRaw integral (without measure):"];
Print[rawIntegral];

Print["\nFull evaluated integral (with measure):"];
Print[fullExpr];
