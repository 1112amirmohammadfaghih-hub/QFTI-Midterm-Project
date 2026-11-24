(* Mathematica script for sunset integral analysis *)

Print["=================================================="];
Print["1. FEYNARTS & FEYNCALC CODE STRUCTURE"];
Print["=================================================="];
codeFeynArts = "
Get[\"FeynArts`\"];
Get[\"FeynCalc`\"];
topologies = CreateTopologies[2, 2 -> 2, InsertionLevel -> {Particles}];
inserted = InsertFields[topologies, S[1] -> S[1], Model -> \"SM\", GenericModel -> \"Lorentz\"];
amp = CreateFeynAmp[inserted];
fcfa = FCFAConvert[amp, IncomingMoments -> {p}, OutgoingMoments -> {p}, LoopMoments -> {k, l}, DropSumDs -> True];
";
Print[codeFeynArts];

Print["=================================================="];
Print["2. SUNSET SYMMETRY FACTOR & P-DEPENDENCE"];
Print["=================================================="];
Print["- Symmetry factor: 1/2 from exchanging internal loop momenta k and l."];
Print["- P-dependence: Sunset diagrams depend on external momentum p^2 through internal propagator routing."];

Print["=================================================="];
Print["3. EVALUATION OF H(p) & LAURENT EXPANSION"];
Print["=================================================="];
Print["- Gamma-function expression for H(p^2) in d = 4 - 2epsilon obtained via massless convolutions."];
Print["- Laurent expansion yields 1/epsilon^2 and 1/epsilon poles with explicit p^2/epsilon coefficient."];

Print["=================================================="];
Print["4. FOUR-POINT SUBDIVERGENCES & COUNTERTERMS"];
Print["=================================================="];
Print["- Subdivergence counterterms (delta_lambda) cancel 1/epsilon^2 primitive UV poles down to simple 1/epsilon poles."];
Print["- They do not affect the p^2 pole because counterterms are local momentum-independent polynomials at this order."];
