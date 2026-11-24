(* Test if changing the order of expansion (Lambda first vs epsilon first) changes the resulting form *)

dim = 4 - 2*epsilon;
rawIntegral = (Lambda^dim * Hypergeometric2F1[1, dim/2, 1 + dim/2, -(Lambda^2/m^2)]) / (dim * m^2);
measure[d_] := (2 * Pi^(d/2)) / ((2 * Pi)^d * Gamma[d/2]);
fullExpr = measure[dim] * rawIntegral;

(* Order 1: Lambda first, then epsilon *)
path1 = Normal[Series[Asymptotic[fullExpr, {Lambda, Infinity, 2}], {epsilon, 0, 0}]];

(* Order 2: epsilon first, then Lambda *)
path2 = Asymptotic[Normal[Series[fullExpr, {epsilon, 0, 0}]], {Lambda, Infinity, 2}];

Print["Path 1 (Lambda then epsilon):"];
Print[FullSimplify[path1]];

Print["\nPath 2 (epsilon then Lambda):"];
Print[FullSimplify[path2]];
