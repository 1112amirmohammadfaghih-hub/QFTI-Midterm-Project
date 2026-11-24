Get["FeynCalc`"];
sunset = FeynAmpDenominator[PropagatorDenominator[Momentum[k1, D], m], PropagatorDenominator[Momentum[k2, D], m], PropagatorDenominator[Momentum[k1 + k2 + p, D], m]];
Print["Sunset amplitude:"];
Print[InputForm[sunset]];
(* Try FCLoopFindTopologies *)
{topoInt, topo} = FCLoopFindTopologies[sunset, {k1, k2}, Head -> Identity];
Print["TopoInt: ", InputForm[topoInt]];
Print["Topo: ", InputForm[topo]];
Exit[];
