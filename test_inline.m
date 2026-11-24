fireDir = "F:\\fire-main\\FIRE7";
AppendTo[$Path, fireDir];
Get[FileNameJoin[{fireDir, "FIRE7.m"}]];
Print["Loaded FIRE7"];
FIRE`Burn[];
Print["Burned. Burning = ", FIRE`Burning];
Exit[]
