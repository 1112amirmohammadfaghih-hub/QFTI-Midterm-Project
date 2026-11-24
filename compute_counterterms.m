(* Fixed script to evaluate and print expressions correctly *)

dim = 4 - 2*epsilon;
OmegaD[d_] := (2 * Pi^(d/2)) / Gamma[d/2];
measure[d_] := OmegaD[d] / (2 * Pi)^d;

rawT = Integrate[k^(dim - 1) / (k^2 + m^2), {k, 0, Lambda}, Assumptions -> {Lambda > 0, m^2 > 0}] /. D -> dim;
tCutoff = measure[dim] * rawT;

asympT = Asymptotic[tCutoff, {Lambda, Infinity, 2}];
Print["Asymptotic T:"];
Print[FullSimplify[asympT]];

deltaM2 = - lambda * asympT;
Print["\nDelta m^2 counterterm:"];
Print[FullSimplify[deltaM2]];
