(* Let's find the pole by taking Asymptotic in Lambda first, then Series in epsilon *)

dim = 4 - 2*epsilon;
rawIntegral = (Lambda^dim * Hypergeometric2F1[1, dim/2, 1 + dim/2, -(Lambda^2/m^2)]) / (dim * m^2);
measure[d_] := (2 * Pi^(d/2)) / ((2 * Pi)^d * Gamma[d/2]);
fullExpr = measure[dim] * rawIntegral;

asympLambda = Asymptotic[fullExpr, {Lambda, Infinity, 2}];
Print["Asymptotic in Lambda:"];
Print[asympLambda];

epsSeries = Series[asympLambda, {epsilon, 0, -1}];
Print["\nEpsilon Laurent series of the asymptotic expression:"];
Print[epsSeries];
