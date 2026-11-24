$LoadAddOns = {"FeynHelpers"};
Get["FeynCalc`"];
Print["FeynCalc version: ", $FeynCalcVersion];
Print["FeynHelpers loaded: ", MemberQ[$LoadedAddOns, "FeynHelpers"]];
(* Check if Tarcer or Package-X or other integration functions exist *)
Print["NameQ[Tarcer`Tarcer] = ", NameQ["Tarcer`Tarcer"]];
Print["NameQ[FCLoopFindTopologies] = ", NameQ["FCLoopFindTopologies"]];
Print["NameQ[PaVe] = ", NameQ["PaVe"]];
Exit[];
