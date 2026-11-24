(* Let's trace why the log appeared: *)
(* The term is (Lambda^2 / Delta)^(-D/2) = (Lambda^2 / Delta)^(-(4 - 2epsilon)/2) = (Lambda^2 / Delta)^(-2 + epsilon). *)
(* When raising something to a power containing epsilon, like X^epsilon = Exp[epsilon * Log[X]], *)
(* Taylor expanding in epsilon naturally generates logarithms! *)

Print["Trace: X^epsilon = Exp[epsilon * Log[X]] = 1 + epsilon * Log[X] + ..."];
