Get["FeynCalc`"];
{fcConverted, ampTopos, topos} = Get["twoloop_twopoint_fully_automated_results.m"];
st = ToString[fcConverted, InputForm];
Set-Content -Path "amps_text.txt" -Value $st;
Exit[];
