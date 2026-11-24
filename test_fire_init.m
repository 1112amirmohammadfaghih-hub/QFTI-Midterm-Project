fireDir = "F:\\fire-main\\FIRE7";
If[! MemberQ[$Path, fireDir], AppendTo[$Path, fireDir]];
Get[FileNameJoin[{fireDir, "FIRE7.m"}]];
If[! NameQ["FIRE`Burn"], Print["ERROR: FIRE failed to load."]; Exit[1]];
Print["FIRE package loaded successfully."];
FIRE`Burn[];
If[TrueQ[FIRE`Burning], Print["FIRE initialization successful."], Print["FIRE initialization failed."]; Exit[1]];
Exit[0];
