Get["FeynCalc`"];
{fcConverted, ampTopos, topos} = Get["twoloop_twopoint_fully_automated_results.m"];
Export["amps_out.txt", fcConverted, "Table"];
Exit[];
