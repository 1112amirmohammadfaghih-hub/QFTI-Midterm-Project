(* Step-by-step expansion of the asymptotic Hypergeometric expression in epsilon *)

(* The asymptotic form for large Lambda is: *)
(* asympHg = (Gamma[2 - D/2] * Gamma[1 + D/2]) / (Lambda^2 / Delta)^(D/2) *)
(* With D = 4 - 2epsilon: *)

DVal = 4 - 2*epsilon;
asympHg = (Gamma[2 - DVal/2] * Gamma[1 + DVal/2]) / (Lambda^2 / Delta)^(DVal/2);

(* Expand around epsilon -> 0 *)
expandedEps = Series[asympHg, {epsilon, 0, 0}];

Print["Asymptotic expression expanded in epsilon (up to O(epsilon^0)):"];
Print[FullSimplify[Normal[expandedEps]]];
