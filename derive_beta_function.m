(* Mathematica script: Deriving the 1-loop beta function for phi^4 theory *)
(* Starting from the dimensionally regularized bubble integral B(0), performing epsilon expansion, *)
(* substituting into delta_lambda, and taking the sliding scale derivative mu * d/d_mu to get beta(lambda). *)

Print["=================================================="];
Print["phi^4 Theory: Beta Function Derivation via Dim Reg"];
Print["=================================================="];

(* 1. Define the dimensionally regularized bubble integral B(0) in d = 4 - 2*epsilon *)
(* In dimensional regularization, B(0) contains the 1/epsilon pole and the scale mu: *)
(* B(0) = (1 / (16 * Pi^2)) * ( (1/epsilon) - GammaE + Log(4*Pi) - Log(m^2 / mu^2) ) *)

GammaE = EulerGamma;
b0DimReg = (1 / (16 * Pi^2)) * ( (1 / epsilon) - GammaE + Log(4 * Pi) - Log(m^2 / mu^2) );

Print["\n[1] Unsubtracted Bubble Integral B(0) in Dimensional Regularization:"];
Print["B(0) = ", b0DimReg];

(* 2. Define the coupling counterterm delta_lambda = (3 * lambda^2 / 2) * B(0) *)
deltaLambda = (3 * lambda^2 / 2) * b0DimReg;

Print["\n[2] Coupling Counterterm delta_lambda (focusing on the 1/epsilon pole part):"];
deltaLambdaPole = SeriesCoefficient[deltaLambda, {epsilon, 0, -1}] * (1 / epsilon);
Print["delta_lambda (pole) = ", FullSimplify[deltaLambdaPole]];

(* 3. Relate bare coupling lambda_0 to renormalized coupling lambda *)
(* lambda_0 = mu^(2*epsilon) * (lambda + delta_lambda) *)
lambda0 = mu^(2 * epsilon) * (lambda + deltaLambda);

Print["\n[3] Bare Coupling lambda_0 expression established."];

(* 4. Enforce scale invariance: mu * d/d_mu (lambda_0) = 0 *)
(* Define beta(lambda) = mu * D[lambda, mu] *)
(* Since lambda_0 is independent of mu, taking mu * D[lambda0, mu] == 0 allows us to solve for beta(lambda). *)

Print["\n[4] Applying mu * d/d_mu scale invariance condition (mu * D[lambda0, mu] == 0)..."];

(* Differentiating lambda0 with respect to mu *)
(* Let's substitute beta = mu * D[lambda, mu] *)
(* mu * D[mu^(2*epsilon), mu] = 2*epsilon * mu^(2*epsilon) *)
(* mu * D[Log(mu^2), mu] = 2 *)

dLambda0Dmu = mu^(2 * epsilon) * (2 * epsilon * (lambda + deltaLambda) + mu * D[lambda + deltaLambda, mu]);

(* Setting mu * dLambda0Dmu == 0 and dividing by mu^(2*epsilon) *)
scaleEq = 2 * epsilon * (lambda + deltaLambda) + mu * D[lambda + deltaLambda, mu];

(* Replace mu * D[lambda, mu] with beta *)
(* And note that mu * D[Log(mu^2), mu] = 2, so mu * D[-Log(m^2/mu^2), mu] = 2 *)
betaSub = mu * D[lambda, mu];

(* Derivative of delta_lambda with respect to mu comes from Log(mu^2) inside B(0) *)
dDeltaLambdaDmu = D[deltaLambda, Log[mu]];

fullEq = 2 * epsilon * lambda + betaSub + 2 * (3 * lambda^2 / 2) * (1 / (16 * Pi^2));

Print["\n[5] Solving for beta(lambda) = mu * d(lambda)/d(mu) in the limit epsilon -> 0:"];
betaSol = Solve[fullEq == 0, betaSub][[1]];

Print["Resulting Beta Function:"];
Print[betaSol];
Print["=================================================="];
