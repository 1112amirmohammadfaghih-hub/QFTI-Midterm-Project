(* Comprehensive script: Counterterms, Regulator Removal (Lambda -> Inf, epsilon -> 0), *)
(* and Comparison of B(P^2) - B(0) and its slope between Cutoff and Dimensional Regularization *)

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
Print["delta_m^2 (Asymptotic in Lambda):"];
Print[FullSimplify[deltaM2]];

rawB0 = Integrate[k^(dim - 1) / (k^2 + m^2)^2, {k, 0, Lambda}, Assumptions -> {Lambda > 0, m^2 > 0}] /. D -> dim;
b0Cutoff = measure[dim] * rawB0;
asympB0 = Asymptotic[b0Cutoff, {Lambda, Infinity, 2}];
deltaLambda = (3 * lambda^2 / 2) * asympB0;
Print["\ndelta_lambda (Asymptotic in Lambda):"];
Print[FullSimplify[deltaLambda]];


Print["\n=================================================="];
Print["2. REMOVING REGULATORS (Lambda -> Inf then epsilon -> 0)"];
Print["=================================================="];

deltaM2_finite = Normal[Series[deltaM2, {epsilon, 0, 0}]];
Print["delta_m^2 (with epsilon -> 0):"];
Print[FullSimplify[deltaM2_finite]];

deltaLambda_pole = Series[deltaLambda, {epsilon, 0, -1}];
Print["delta_lambda pole part (1/epsilon):"];
Print[deltaLambda_pole];


Print["\n=================================================="];
Print["3. B(P^2) - B(0) AND SLOPE COMPARISON"];
Print["=================================================="];

DeltaExpr = m^2 + x*(1-x)*P^2;
innerB = (Lambda^dim / (dim * DeltaExpr^2)) * Hypergeometric2F1[2, dim/2, (2 + dim)/2, -Lambda^2/DeltaExpr];
rawB = Integrate[innerB, {x, 0, 1}, Assumptions -> {Lambda > 0, m^2 > 0, P > 0, dim > 0}] /. D -> dim;
bCutoff = measure[dim] * rawB;
bDiffCutoff = bCutoff - (bCutoff /. P -> 0);
asympBDiff = Asymptotic[bDiffCutoff, {Lambda, Infinity, 2}];

cutoffDiffFinal = Normal[Series[asympBDiff, {epsilon, 0, 0}]];
dimRegDiff = - (1 / (16 * Pi^2)) * Integrate[Log[1 + x*(1-x)*P^2 / m^2], {x, 0, 1}, Assumptions -> {m^2 > 0, P > 0}];

Print["Cutoff B(P^2) - B(0) (Lambda -> Inf, epsilon -> 0):"];
Print[FullSimplify[cutoffDiffFinal]];

Print["\nDimensional Regularization B(P^2) - B(0):"];
Print[FullSimplify[dimRegDiff]];

slopeCutoff = SeriesCoefficient[Series[cutoffDiffFinal, {P, 0, 2}], {P, 0, 2}];
slopeDimReg = SeriesCoefficient[Series[dimRegDiff, {P, 0, 2}], {P, 0, 2}];

Print["\n=== Slope at P^2 = 0 ==="];
Print["Cutoff slope:  ", FullSimplify[slopeCutoff]];
Print["Dim Reg slope: ", FullSimplify[slopeDimReg]];
Print["Are slopes identical? ", FullSimplify[slopeCutoff == slopeDimReg]];
