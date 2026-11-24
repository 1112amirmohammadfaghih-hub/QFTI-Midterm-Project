feynHelpersDir = "C:\\Users\\king\\AppData\\Roaming\\Wolfram\\Applications\\FeynHelpers";
interfacesDir = FileNameJoin[{feynHelpersDir, "Interfaces"}];
files = FileNames["*", interfacesDir, Infinity];
Print["Interface files:"];
Do[Print["  ", f], {f, files}];
Exit[]
