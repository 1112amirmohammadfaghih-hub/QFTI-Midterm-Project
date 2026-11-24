Get["FeynCalc`"];

(* Define the Passarino-Veltman scalar 1-point function A0 in FeynCalc *)
(* A0(m^2) corresponds to the integral T = int d^D k / (2pi)^D 1/(k^2 + m^2) *)

a0PaVe = (m^2 / (16 * Pi^2)) * (4 * Pi)^epsilon * Gamma[1 - epsilon] * (1 / epsilon);

Print["PaVe representation: PaVe[0, {m^2}]"];
Print["Analytical evaluation in D = 4 - 2epsilon:"];
Print[a0PaVe];

expEpsilon = Series[a0Expr, {epsilon, 0, 0}];
Print["Series in epsilon (up to O(epsilon^0)):"];
Print[Normal[expEpsilon]];
