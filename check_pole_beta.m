(* Check Beta function definition and its poles *)
(* Beta[z, a, b] = integral_0^z t^(a-1) (1-t)^(b-1) dt *)
(* Here a = 2 - epsilon, b = -1 + epsilon *)

exprBeta = Beta[-Lambda^2/m^2, 2 - epsilon, -1 + epsilon];
printSeries = Series[exprBeta, {epsilon, 0, -1}];
Print["Series of Beta function:"];
Print[printSeries];
