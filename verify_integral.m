(* Verify the indefinite/definite integral of k^(D-1) / (k^2 + m^2) from 0 to Lambda *)

res = Integrate[k^(D - 1) / (k^2 + m^2), {k, 0, Lambda}, Assumptions -> {Lambda > 0, m > 0, D > 0}];
Print["Mathematica Integrate result:"];
Print[res];

deriv = D[res, Lambda];
Print["Derivative with respect to Lambda:"];
Print[FullSimplify[deriv, Assumptions -> {Lambda > 0, m > 0, D > 0}]];
