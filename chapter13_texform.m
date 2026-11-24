(* Mathematica script with TeXForm / TraditionalForm output for Chapter 13 *)

Print["=================================================="];
Print["Chapter 13: Counterterms in TeXForm (LaTeX)"];
Print["=================================================="];

(* Define expressions *)
deltaM2Expr = - (lambda / 2) * T;
deltaZExpr = 0;
deltaLambdaExpr = (3 * lambda^2 / 2) * B0;

Print["\nLaTeX representation of delta_m^2:"];
Print[TeXForm[deltaM2Expr]];

Print["\nLaTeX representation of delta_Z:"];
Print[TeXForm[deltaZExpr]];

Print["\nLaTeX representation of delta_lambda:"];
Print[TeXForm[deltaLambdaExpr]];

Print["\n--- Full 1PI Green's Functions in TeXForm ---"];
gamma2Expr = p^2 + m^2 + deltaZ * p^2 + deltaM2 + (lambda / 2) * T;
gamma4Expr = lambda + deltaLambda - (lambda^2 / 2) * (B12 + B13 + B14);

Print[TeXForm[gamma2Expr]];
Print[TeXForm[gamma4Expr]];
