(* Correctly take derivative of Dim Reg B(P^2) - B(0) at P = 0 using Series or Limit *)

dimRegDiff = - (1 / (16 * Pi^2)) * Integrate[Log[1 + x*(1-x)*P^2 / m^2], {x, 0, 1}, Assumptions -> {m > 0, P > 0}];

(* Take series expansion around P^2 -> 0 *)
ser = Series[dimRegDiff, {P, 0, 2}];
Print["Series around P = 0:"];
Print[FullSimplify[ser]];

(* The coefficient of P^2 gives the slope with respect to P^2 *)
(* Since ser is in terms of P, P^2 = s, so coefficient of P^2 is the slope w.r.t P^2 *)
coefP2 = SeriesCoefficient[ser, {P, 0, 2}];
Print["\nSlope at P^2 = 0 (coefficient of P^2):"];
Print[FullSimplify[coefP2]];
