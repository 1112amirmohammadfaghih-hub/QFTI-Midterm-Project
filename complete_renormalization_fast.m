(* Optimized complete renormalization script *)

dim = 4 - 2*epsilon;
OmegaD[d_] := (2 * Pi^(d/2)) / Gamma[d/2];
measure[d_] := OmegaD[d] / (2 * Pi)^d;

Print["=================================================="];
Print["1. COUNTERTERMS (Cutoff Regularization, Lambda -> Inf)"];
Print["=================================================="];

rawT = Integrate[k^(dim - 1) / (k^2 + m^2), {k, 0, Lambda}, Assumptions -> {Lambda > 0, m^2 > 0}] /. D -> dim;
tCutoff = measure[dim] * rawT;
asympT = Asymptotic[tCutoff, {Lambda, Infinity, 2}];
deltaM2 = - (lambda / 2) * asympT;
Print["delta_m^2 expression computed."];

rawB0 = Integrate[k^(dim - 1) / (k^2 + m^2)^2, {k, 0, Lambda}, Assumptions -> {Lambda > 0, m^2 > 0}] /. D -> dim;
b0Cutoff = measure[dim] * rawB0;
asympB0 = Asymptotic[b0Cutoff, {Lambda, Infinity, 2}];
deltaLambda = (3 * lambda^2 / 2) * asympB0;
Print["delta_lambda expression computed."];

Print["\n=================================================="];
Print["2. DIMENSIONAL REGULARIZATION B(P^2) - B(0) & SLOPE"];
Print["=================================================="];

dimRegDiff = - (1 / (16 * Pi^2)) * Integrate[Log[1 + x*(1-x)*P^2 / m^2], {x, 0, 1}, Assumptions -> {m^2 > 0, P > 0}];
Print["Dimensional Regularization B(P^2) - B(0):"];
Print[FullSimplify[dimRegDiff]];

slopeDimReg = SeriesCoefficient[Series[dimRegDiff, {P, 0, 2}], {P, 0, 2}];
Print["Dim Reg slope at P^2 = 0:"];
Print[FullSimplify[slopeDimReg]];
