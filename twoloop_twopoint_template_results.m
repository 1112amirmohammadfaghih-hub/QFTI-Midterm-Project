(* Created with the Wolfram Language : www.wolfram.com *)
(I/4)*g^2*FeynAmpDenominator[PropagatorDenominator[Momentum[LoopMom1, D], 
    mphi]]*FeynAmpDenominator[PropagatorDenominator[Momentum[LoopMom2, D], 
    mphi]]*FeynAmpDenominator[PropagatorDenominator[-Momentum[OutMom1, D], 
    mphi]] + (I/4)*g^2*FeynAmpDenominator[PropagatorDenominator[
    Momentum[LoopMom2, D], mphi]]*FeynAmpDenominator[
   PropagatorDenominator[Momentum[LoopMom1, D], mphi], 
   PropagatorDenominator[Momentum[LoopMom1, D], mphi]] + 
 (I/6)*g^2*FeynAmpDenominator[PropagatorDenominator[Momentum[LoopMom1, D], 
    mphi], PropagatorDenominator[Momentum[LoopMom2, D], mphi], 
   PropagatorDenominator[Momentum[LoopMom1 + LoopMom2 + OutMom1, D], mphi]]
