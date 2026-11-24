(* Test finiteness of the hypergeometric function at large Lambda for finite epsilon *)

(* The hypergeometric function in the integral is: *)
(* H = Hypergeometric2F1[1, D/2, 1 + D/2, -Lambda^2/m^2] with D = 4 - 2*epsilon *)

DVal = 4 - 2*epsilon;
hg = Hypergeometric2F1[1, DVal/2, 1 + DVal/2, -Lambda^2/m^2];

(* Let's check its limit as Lambda -> Infinity for fixed epsilon > 0 (e.g. epsilon = 0.1) *)
lim = Limit[hg /. epsilon -> 0.1, Lambda -> Infinity];
Print["Limit as Lambda -> Infinity (for epsilon = 0.1):"];
Print[lim];

(* Also check the general asymptotic formula for large argument -Lambda^2/m^2 *)
asymp = Asymptotic[hg, {Lambda, Infinity, 2}];
Print["Asymptotic expression:"];
Print[asymp];
