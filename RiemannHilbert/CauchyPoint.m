(* ::Package:: *)

(************************************************************************)
(* This file was generated automatically by the Mathematica front end.  *)
(* It contains Initialization cells from a Notebook file, which         *)
(* typically will have the same name as this file except ending in      *)
(* ".nb" instead of ".m".                                               *)
(*                                                                      *)
(* This file is intended to be loaded into the Mathematica kernel using *)
(* the package loading commands Get or Needs.  Doing so is equivalent   *)
(* to using the Evaluate Initialization Cells menu command in the front *)
(* end.                                                                 *)
(*                                                                      *)
(* DO NOT EDIT THIS FILE.  This entire file is regenerated              *)
(* automatically each time the parent Notebook file is saved in the     *)
(* Mathematica front end.  Any changes you make to this file will be    *)
(* overwritten.                                                         *)
(************************************************************************)



BeginPackage["RiemannHilbert`",{"RiemannHilbert`Common`"}];

CauchyD;
FPCauchy;


Begin["`Private`"];



Cauchy[lf_PFun,z_List]:=Cauchy[lf,#]&/@z;
Cauchy[s_?SignQ,lf_PFun,z_List]:=Cauchy[s,lf,#]&/@z;


CauchyS[+1,lf_PFun,z_?ScalarQ]:=1/2 First[lf//Values];
CauchyS[-1,lf_PFun,z_?ScalarQ]:=-1/2 First[lf//Values];


Cauchy[pf_PFun?UnitPointFunQ,z_]:=-(First[pf//Values]/(2 \[Pi] I z ));



Cauchy[s_?SignQ,lf_PFun?UnitPointFunQ,z_?(DomainMemberQ[UnitPoint,#]&)]:=CauchyS[s,lf,z];
Cauchy[s_?SignQ,lf_PFun?UnitPointFunQ,z_?ScalarQ]:=Cauchy[lf,z];


Cauchy[lf_PFun,z_]:=Cauchy[lf//ToUnitPoint,MapToPoint[lf,z]];
Cauchy[s_?SignQ,lf_PFun,z_?ScalarQ]:=Cauchy[s,lf//ToUnitPoint,MapToPoint[lf,z]];

FPCauchy[s_?SignQ,pf_PFun,gf_PFun]/;Domain[pf]~NEqual~Domain[gf]:=FPCauchy[s,pf];
FPCauchy[s_?SignQ,pf_PFun,gf_PFun]:=PFun[Cauchy[pf,Points[gf]],Domain[gf]];
FPCauchy[s_?SignQ,pf_PFun]:=s/2 pf;


CauchyD[pf_PFun?UnitPointFunQ,z_]:=First[pf//Values]/(2 \[Pi] I (z^2) );
CauchyD[lf_PFun,z_]:=CauchyD[lf//ToUnitPoint,MapToPoint[lf,z]]MapToPointD[lf,z];

CauchyD[2][pf_PFun?UnitPointFunQ,z_]:=-((2First[pf//Values])/(2 \[Pi] I (z^3) ));
CauchyD[2][lf_PFun,z_]:=CauchyD[2][lf//ToUnitPoint,MapToPoint[lf,z]]MapToPointD[lf,z]^2;



CauchyBasisS[+1,UnitPoint,1,z_]:=1/2;
CauchyBasisS[-1,UnitPoint,1,z_]:=-1/2;


CauchyBasis[d_?PointDomainQ,k_Integer,z_List]:=CauchyBasis[d,k,#]&/@z;
CauchyBasis[s_?SignQ,d_?PointDomainQ,k_Integer,z_List]:=CauchyBasis[s,d,k,#]&/@z;


CauchyBasis[UnitPoint,k_Integer,z_]:=-(1/(2 \[Pi]\[NonBreakingSpace]I z));

CauchyBasis[s_?SignQ,UnitPoint,k_Integer,z_?(DomainMemberQ[UnitPoint,#]&)]:=CauchyBasisS[s,UnitPoint,k,z];
CauchyBasis[s_?SignQ,UnitPoint,k_Integer,z_]:=CauchyBasis[UnitPoint,k,z];


CauchyBasis[f_?PointDomainQ,k_Integer,z_]:=CauchyBasis[UnitPoint,k,MapToPoint[f,z]];
CauchyBasis[s_?SignQ,f_?PointDomainQ,k_Integer,z_]:=CauchyBasis[s,UnitPoint,k,MapToPoint[f,z]];
CauchyBasisS[s_?SignQ,f_?PointDomainQ,k_Integer,z_]:=CauchyBasisS[s,UnitPoint,k,MapToPoint[f,z]];



FPCauchyBasis[s_?SignQ,d_?PointDomainQ,1,lf_?FunQ]:=Fun[CauchyBasis[s,d,1,lf//Points],lf//Domain];

CauchyMatrix[s_?SignQ,lf_PFun?ScalarFunQ,lf2_?FunQ]:={FiniteValues[FPCauchyBasis[s,lf,1,lf2]]}//Transpose;

CauchyMatrix[s_?SignQ,f_PFun]:=CauchyMatrix[s,f,f];


End[];
EndPackage[];