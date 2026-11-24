(* Check the exact series expansion of the hypergeometric asymptotic form in epsilon *)

DVal = 4 - 2*epsilon;
asympHg = (Gamma[2 - DVal/2] * Gamma[1 + DVal/2]) / (Lambda^2 / Delta)^(DVal/2);

(* Take the Series in epsilon up to first order (O(epsilon^1)) *)
epsSeries = Series[asympHg, {epsilon, 0, 1}];

Print["Series of asymptotic Hypergeometric in epsilon up to O(epsilon^1):"];
Print[FullSimplify[Normal[epsSeries]]];
