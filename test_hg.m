(* Step-by-step test: Asymptotic expansion of the Hypergeometric function in large Lambda *)

hg = Hypergeometric2F1[2, D/2, (2 + D)/2, -Lambda^2/DeltaExpr];
asympHg = Asymptotic[hg, {Lambda, Infinity, 2}];

Print["Asymptotic of Hypergeometric2F1 for large Lambda:"];
Print[asympHg];
