(* Check Gamma function poles in Beta representation *)

(* Beta[z, a, b] can be related to hypergeometric functions where Gamma(1 - D/2) appears *)
(* Specifically, 1 - D/2 = 1 - (2 - epsilon) = -1 + epsilon, which has a pole at epsilon = 0! *)

gammaTerm = Gamma[1 - (4 - 2*epsilon)/2];
Print["Gamma[1 - D/2] series around epsilon -> 0:"];
Print[Series[gammaTerm, {epsilon, 0, -1}]];
