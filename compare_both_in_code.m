(* Mathematica script comparing Cutoff Asymptotic B(P^2) - B(0) and Dim Reg B(P^2) - B(0) *)

dim = 4 - 2*epsilon;
OmegaD[d_] := (2 * Pi^(d/2)) / Gamma[d/2];
measure[d_] := OmegaD[d] / (2 * Pi)^d;

DeltaExpr = m^2 + x*(1-x)*P^2;
innerB = (Lambda^dim / (dim * DeltaExpr^2)) * Hypergeometric2F1[2, dim/2, (2 + dim)/2, -Lambda^2/DeltaExpr];
rawB = Integrate[innerB, {x, 0, 1}, Assumptions -> {Lambda > 0, m^2 > 0, P > 0, dim > 0}] /. D -> dim;
bCutoff = measure[dim] * rawB;
bDiffCutoff = bCutoff - (bCutoff /. P -> 0);
asympBDiff = Asymptotic[bDiffCutoff, {Lambda, Infinity, 2}];

Print["=== Cutoff Regularization B(P^2) - B(0) (Lambda -> Inf) ==="];
Print[FullSimplify[asympBDiff]];

dimRegDiff = - (1 / (16 * Pi^2)) * Integrate[Log[1 + x*(1-x)*P^2 / m^2], {x, 0, 1}, Assumptions -> {m > 0, P > 0}];
Print["\n=== Dimensional Regularization B(P^2) - B(0) ==="];
Print[FullSimplify[dimRegDiff]];

serCutoff = Series[asympBDiff, {P, 0, 2}];
slopeCutoff = SeriesCoefficient[serCutoff, {P, 0, 2}];

serDimReg = Series[dimRegDiff, {P, 0, 2}];
slopeDimReg = SeriesCoefficient[serDimReg, {P, 0, 2}];

Print["\n=== Slope at P^2 = 0 ==="];
Print["Cutoff slope:  ", FullSimplify[slopeCutoff]];
Print["Dim Reg slope: ", FullSimplify[slopeDimReg]];
