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



BeginPackage[$CommonPackage];

InfinityQ::usage="Test for whether a value is infinite.";
FiniteQ::usage="Tests whether a value is finite.";
SignQ::usage="Test for whether a value is \[PlusMinus]1.";
OneVector::usage="OneVector[n] constructs a vector of length n of all ones.";
ZeroVector::usage="ZeroVector[n] constructs a vector of length n of all zeros.";
BasisVector::usage="BasisVector[n][j] constructs a vector of length n with the jth entry equal to one.";
NEqual::usage="NEqual[i,j] determines whether two values are within $MachineTolerence of each other.";
NEqualRelative::usage="NEqualRelative[i,j] determines whether two values are within $MachineTolerence of each other, relative error.";
$MachineTolerance::usage="A specified tolerance for when two numerical values should be treated as equal.";
AlternatingVector::usage=
"Alternating vector.";
ScalarQ::usage=
"Tests whether something has a scalar value.";
CDot;SDot;
ZeroQ;NZeroQ;


Begin["Private`"];
OneVector[n_]:=Table[1,{n}];
ZeroVector[n_]:=Table[0,{n}];
AlternatingVector[n_]:=Table[(-1)^(k+1),{k,n}];
BasisVector[n_][j_]:=IdentityMatrix[n][[j]]


ScalarQ[f_]:=NumberQ[N[f]];
CDot[f_?ScalarQ,g_?ScalarQ]:=Conjugate[f] g;
CDot[f_List,g_List]:=Plus@@((CDot@@#)&/@Thread[f~List~g]);
SDot[f_List,g_List]:=f.g;
SDot[f_,g_]:=f g;

$MachineTolerance=10.^(-13);

ZeroQ[f_]:=f==0;
NEqual[f_List,g_List]:=Norm[f-g]<$MachineTolerance;
NEqual[_?InfinityQ,_?InfinityQ]:=True;
NEqual[f_,g_]:=Abs[f-g]<$MachineTolerance;

NZeroQ[f_]:=f~NEqual~0;

NEqualRelative[f_,g_]:=NZeroQ[Abs[f-g]/Abs[f]];

InfinityQ[\[Infinity]]:=True;
InfinityQ[-\[Infinity]]:=True;
InfinityQ[_DirectedInfinity]:=True;
InfinityQ[_]:=False;
FiniteQ[x_]:=!InfinityQ[x];

SignQ[+1]:=True;
SignQ[-1]:=True;
SignQ[_]:=False;



End[];
EndPackage[];