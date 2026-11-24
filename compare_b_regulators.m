(* Mathematica script: Comparing B(P^2) - B(0) between Cutoff (Lambda -> Infinity) and Dimensional Regularization (epsilon -> 0) *)

Print["=================================================="];
Print["Regulator Independence: B(P^2) - B(0) Comparison"];
Print["=================================================="];

(* 1. Dimensional Regularization B(P^2) - B(0) *)
(* In dim reg (d = 4 - 2*epsilon), the subtracted bubble integral is finite as epsilon -> 0: *)
(* B_dim(P^2) - B_dim(0) = - (1 / (16 * Pi^2)) * Integrate[Log[1 + x*(1-x)*P^2 / m^2], {x, 0, 1}] *)

dimRegDiff = - (1 / (16 * Pi^2)) * Integrate[Log[1 + x*(1-x)*P^2 / m^2], {x, 0, 1}, Assumptions -> {m^2 > 0, P > 0}];
dimRegDiffSimplified = FullSimplify[dimRegDiff];

Print["\n[1] Dimensional Regularization Result (epsilon -> 0):"];
Print["B_dim(P^2) - B_dim(0) = ", dimRegDiffSimplified];


data = {}; (* Initialize dummy array or perform symbolic limit check *)

(* 2. Cutoff Regularization B(P^2) - B(0) *)
(* Using Feynman parameters and momentum cutoff Lambda *)
dim = 4 - 2*epsilon;
OmegaD[d_] := (2 * Pi^(d/2)) / Gamma[d/2];
measure[d_] := OmegaD[d] / (2 * Pi)^d;

DeltaExpr = m^2 + x*(1-x)*P^2;
innerB = (Λ^dim / (dim * DeltaExpr^2)) * Hypergeometric2F1[2, dim/2, (2 + dim)/2, -Λ^2/DeltaExpr];
rawB = Integrate[innerB, {x, 0, 1}, Assumptions -> {Λ > 0, m^2 > 0, P > 0, dim > 0}] /. D -> dim;
bCutoff = measure[dim] * rawB;

(* Form the convergent difference B_cut(P^2) - B_cut(0) BEFORE taking Lambda -> Infinity *)
bDiffCutoff = bCutoff - (bCutoff /. P -> 0);

Print["\n[2] Taking Lambda -> Infinity limit of Cutoff Difference..."];
asympBDiff = Asymptotic[bDiffCutoff, {Λ, Infinity, 2}];
cutoffDiffFinal = Normal[Series[asympBDiff, {epsilon, 0, 0}]];

Print["Cutoff Result (Lambda -> Infinity then epsilon -> 0):"];
Print["B_cut(P^2) - B_cut(0) = ", FullSimplify[cutoffDiffFinal]];


(* 3. Comparison *)
Print["\n[3] Comparison between Cutoff and Dimensional Regularization:"];
diffComparison = FullSimplify[cutoffDiffFinal - dimRegDiffSimplified];
Print["Difference [ (B_cut - B_cut(0)) - (B_dim - B_dim(0)) ] = ", diffComparison];
Print["Are both regularized differences identical? ", FullSimplify[cutoffDiffFinal == dimRegDiffSimplified]];

Print["=================================================="];
