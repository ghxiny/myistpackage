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



(* PainleveIINegative[1] needs to be a symbol in order to assign options to it, therefore we have to introduce PainleveIINegativeContour1 *)
`Private`PainleveIINegative[2] =`NegativeContour2`PainleveIINegativeContour2;
`Private`ClearDatabase[Negative2]= `NegativeContour2`clearCachedRHSolver;


Begin["`NegativeContour2`"];


jump[_][_,_?InfinityQ]:=({{1,0},{0,1}});
jump[M_][x_,z_]:=(M[x,z])/.Underflow[]->0;


(* 

original contour from acticle:

Asymptotics for the painlev\[EAcute] II equation
P. A. Deift1, X. Zhou2
Communications on Pure and Applied Mathematics
Volume 48, Issue 3, pages 277\[Dash]337, 1995
(Contour is on page 285)
http://onlinelibrary.wiley.com/doi/10.1002/cpa.3160480304/abstract

\G[3]           |G[2]          /G[1]
 \              |             /
  \             |            /
   \          i |           /
    \          /\          /
     \    G[8]/  \G[7]    /
      \      /    \      /
       \    /      \    /
        \  /        \  /
         \/_ _ _ _ _ \/
      -1 /\   G[11]  /\ 1
        /  \        /  \ 
       /    \      /    \ 
      /      \    /      \ 
     /    G[9]\  /G[10]   \ 
    /          \/          \ 
   /         -i |           \ 
  /             |            \ 
 /              |             \ 
/G[4]           |G[5]          \G[6]



implemented contour:
G[11] has been combined symmetrically to G[7],G[8],G[9] and G[10]

\G[3]           |G[2]          /G[1]
 \              |             /
  \             |            /
   \          i |           /
    \          /\          /
     \   G[13]/  \G[12]   /
      \      /    \      /
       \    /      \    /
        \  /        \  /
         \/          \/
      -1 /\          /\ 1
        /  \        /  \ 
       /    \      /    \ 
      /      \    /      \ 
     /   G[14]\  /G[15]   \ 
    /          \/          \ 
   /         -i |           \ 
  /             |            \ 
 /              |             \ 
/G[4]           |G[5]          \G[6]

with SG = Sqrt[G[11]] 
G[14] = G[7].Inverse[SG]
G[15] = SG.G[8]
G[16] = Inverse[SG].G[9]
G[17] = G[10].SG


*)


commonS[sv_]:=Module[{s},
(* outer rays *)
{s[1],s[2],s[3]}=sv;
{s[4],s[5],s[6]}=-Array[s,3];
(* inner square *)
{s[7],s[8]}={s[3],s[1]}/(1-s[1] s[3]);
{s[9],s[10]}={s[7],s[8]};
s[11]=1-s[1] s[3];
(* part 11 combined with square *)
{s[12],s[13],s[14],s[15]}=Sqrt[s[11]] {s[7],s[8],s[9],s[10]};
Return[s];
]


rescaledG[sv_]:=Module[{s,G,\[Theta]},
s=commonS[sv];
\[Theta][x_,z_]:=(8 I) (-x/4)^(3/2) (1/3 z^3-z);

G=Range[15];

G[[1]]=jump[Function[{x,z},{{1,0},{s[1] Exp[\[Theta][x,z]],1}}//Evaluate]];
G[[2]]=jump[Function[{x,z},{{1,s[2] Exp[-\[Theta][x,z]]},{0,1}}//Evaluate]];
G[[3]]=jump[Function[{x,z},{{1,0},{s[3] Exp[\[Theta][x,z]],1}}//Evaluate]];
G[[4]]=jump[Function[{x,z},{{1,s[4] Exp[-\[Theta][x,z]]},{0,1}}//Evaluate]];
G[[5]]=jump[Function[{x,z},{{1,0},{s[5] Exp[\[Theta][x,z]],1}}//Evaluate]];
G[[6]]=jump[Function[{x,z},{{1,s[6] Exp[-\[Theta][x,z]]},{0,1}}//Evaluate]];
G[[7]]=jump[Function[{x,z},{{1,s[7] Exp[-\[Theta][x,z]]},{0,1}}//Evaluate]];
G[[8]]=jump[Function[{x,z},{{1,s[8] Exp[-\[Theta][x,z]]},{0,1}}//Evaluate]];
G[[9]]=jump[Function[{x,z},{{1,0},{s[9] Exp[\[Theta][x,z]],1}}//Evaluate]];
G[[10]]=jump[Function[{x,z},{{1,0},{s[10] Exp[\[Theta][x,z]],1}}//Evaluate]];
G[[11]]=jump[Function[{x,z},{{s[11],0},{0,1/s[11]}}//Evaluate]];
(*G[[7]].Inverse[Sqrt[G[[11]]]]*)G[[12]]=jump[Function[{x,z},{{1/Sqrt[s[11]],s[12] Exp[-\[Theta][x,z]]},{0,Sqrt[s[11]]}}//Evaluate]];
(*Sqrt[G[[11]]].G[[8]]*)G[[13]]=jump[Function[{x,z},{{Sqrt[s[11]],s[13] Exp[-\[Theta][x,z]]},{0,1/Sqrt[s[11]]}}//Evaluate]];
(*Inverse[Sqrt[G[[11]]]].G[[9]]*)G[[14]]=jump[Function[{x,z},{{1/Sqrt[s[11]],0},{s[14] Exp[\[Theta][x,z]],Sqrt[s[11]]}}//Evaluate]];
(*G[[10]].Sqrt[G[[11]]]*)G[[15]]=jump[Function[{x,z},{{Sqrt[s[11]],0},{s[15] Exp[\[Theta][x,z]],1/Sqrt[s[11]]}}//Evaluate]];
G=Simplify[G];
Return[G];]


contourParameters[sv_,x_,tol_]:=contourParameters[sv,x,tol,x];
contourParameters[sv_,x_,tol_,xc_]:=Module[{G,s,i,p,r,n,ct,cutoff},
(* calculates the contour parameters p and n *)

(*
First determine the points p[1],p[3],p[4],p[6],p[7],p[8],p[9] and p[10] on the contour parts 1,3,4,6,7,8,9 and 10 at which the jump matrix becomes numerically constant.
This means that the off diagonal elements are less than 10^-16 times the diagonal entries.
The contour parts 2 and 5 are ommited for now as the jump matrix will be numerically constant on these parts if s[2] is not VERY large.

At each of these points p[ ] the corresponding contour part will be split in two parts. Doing so ensures that the number of nodes neccessary to approximate the functions G upto a given accuracy does not increase for x -> -\Infinity
 *)

cutoff=-16 Log[10];
s=commonS[sv];

(* Parts 7,8,9 and 10 *)
(*
For \Theta[z_]:=(8 I) (-xc/4)^(3/2) (1/3 z^3-z);

Root[9 ct^2+36 xc^3 #1^4-24 xc^3 #1^5+4 xc^3 #1^6&,2]

is the result of

Reduce[
Re[-\Theta[1 + z(-1+I)]] == ct 
&& Element[z,Reals] 
&& z>0
&& Element[xc,Reals] 
&& xc<0 
&& Element[ct,Reals]
,
z
]//N 

and 

Reduce[
Re[-\Theta[-1+z (1+I)]] == ct 
&& Element[z,Reals] 
&& z>0 
&& Element[xc,Reals] 
&& xc<0 
&& Element[ct,Reals]
,
z
]//N
*)
i[7]=Root[9 ct^2+36 xc^3 #1^4-24 xc^3 #1^5+4 xc^3 #1^6&,2]/.{ct->cutoff-Log10[Abs[s[12]]]}//N;
i[8]=Root[9 ct^2+36 xc^3 #1^4-24 xc^3 #1^5+4 xc^3 #1^6&,2]/.{ct->cutoff-Log10[Abs[s[13]]]}//N;
(*
for small values of x (x~-10) these values can be greater than 1/2,or even greater than 1,which is not allowed. In this case we set them just to 1/2. It would probably be better to check if
 i[7] >= 1  or  i[8] >= 1 
and then just not divide these parts of the contour but this will likley not yield a significant improvment
*)
i[7]=If[0<i[7]<1/2,i[7],1/2];
i[8]=If[0<i[8]<1/2,i[8],1/2];

(* i[9] and i[10] follow from symmertry *)
{i[9],i[10]}= {i[7],i[8]};


(* Parts 1,3,4 and 6 *)
(*
For \Theta[z_]:=(8 I) (-xc/4)^(3/2) (1/3 z^3-z);

Root[9 ct^2+36 xc^3 #1^4+24 xc^3 #1^5+4 xc^3 #1^6&,2]
for ct < -8/3 Sqrt[-xc^3] and,
Root[9 ct^2+36 xc^3 #1^4+24 xc^3 #1^5+4 xc^3 #1^6&,4]
for ct > -8/3 Sqrt[-xc^3]

is the result of 

Reduce[
Re[\Theta[1 + z(1+I)]] == ct 
&& Element[z,Reals] 
&& z>0 
&& Element[x,Reals] 
&& x<0 
&& Element[ct,Reals]
,
z
]//N

and

Reduce[
Re[-\Theta[1 + z(1-I)]] == ct &&
Element[z,Reals] 
&& z>0 
&& Element[x,Reals] 
&& x<0 
&& Element[ct,Reals]
,
z
]//N
*)
r[1]=If[cutoff-Log10[Abs[s[1]]]<-8/3 Sqrt[-xc^3],2,4];
r[3]=If[cutoff-Log10[Abs[s[3]]]<-8/3 Sqrt[-xc^3],2,4];

i[1]=Root[9 ct^2+36 xc^3 #1^4+24 xc^3 #1^5+4 xc^3 #1^6&,r[1]]/.{ct->cutoff-Log10[Abs[s[1]]]}//N;
i[3]=Root[9 ct^2+36 xc^3 #1^4+24 xc^3 #1^5+4 xc^3 #1^6&,r[3]]/.{ct->cutoff-Log10[Abs[s[3]]]}//N;

(* i[4] and i[6] follow from symmetry *)
{i[4],i[6]} = {i[1],i[3]};

p =ConstantArray[Null,10];

p[[1]]=1+i[1] (1+I);
p[[4]]=-1+i[4] (-1-I);
p[[3]]=-1+i[3] (-1+I);
p[[6]]=1+i[6] (1-I);
p[[7]]=1+i[7] (-1+I);
p[[8]]=-1+i[8] (1+I);
p[[9]]=-1+i[9] (1-I);
p[[10]]=1+i[10] (-1-I);

(* calculate for each contour part the number of nodes neccessary to approximate G upto the tolerance tol *)
G=rescaledG[sv];

n =ConstantArray[Null,18];
(* contour parts 1,2 and 3 *)
n[[1;;5]] = Length /@ {
IFun[G[[1]][x,#]&,Line[{1,p[[1]]}],InterpolationPrecision->tol],IFun[G[[1]][x,#]&,Line[{p[[1]],\[Infinity] Exp[I (\[Pi]/4)]}],InterpolationPrecision->tol],IFun[G[[2]][x,#]&,Line[{1I,\[Infinity] Exp[I (\[Pi] 2/4)]}],InterpolationPrecision->tol],IFun[G[[3]][x,#]&,Line[{-1,p[[3]]}],InterpolationPrecision->tol],IFun[G[[3]][x,#]&,Line[{p[[3]],\[Infinity] Exp[I (\[Pi] 3/4)]}],InterpolationPrecision->tol]
};
(* due to symmetry the number of nodes for the parts 4,5 and 6 are the same as the numbers for parts 1, 2 and 3 *)
n[[6;;10]] = n[[1;;5]];
(* contour parts 7 and 8 *)
n[[{11,13}]] = Length /@ {
IFun[G[[12]][x,#]&,Line[{1,p[[7]]}],InterpolationPrecision->tol],IFun[G[[13]][x,#]&,Line[{-1,p[[8]]}],InterpolationPrecision->tol]
};
(* On the second subparts of the contour parts 7 and 8 the function G is almost constant but the solution is not almost constant. Therefore we have to use another method to determine the number of nodes necessary for these parts.
For now we use the number of nodes alculated for the other subpart of the contour parts 7 and 8 but with x = xc.
THIS IS NOT OPTIMAL ... but works.
 *)
n[[{12,14}]] = Length /@ {
IFun[G[[12]][xc,#]&,Line[{1,p[[7]]}],InterpolationPrecision->tol],IFun[G[[13]][xc,#]&,Line[{-1,p[[8]]}],InterpolationPrecision->tol]
};
(* again due to symmetry we do not have to calculate the numbers for the contour parts 9 and 10 *)
n[[15;;18]] = n[[{12,11,14,13}]];

Return[{p,n}];
];

contour[sv_,x_,p_List,n_List]:=Module[{G,GG},
(* generate contour from contour parameters p and n *)
G=rescaledG[sv];
GG={
IFun[G[[1]][x,#]&,Line[{1,p[[1]]}],n[[1]]],IFun[G[[1]][x,#]&,Line[{p[[1]],\[Infinity] Exp[I (\[Pi]/4)]}],n[[2]]],IFun[G[[2]][x,#]&,Line[{1I,\[Infinity] Exp[I (\[Pi] 2/4)]}],n[[3]]],IFun[G[[3]][x,#]&,Line[{-1,p[[3]]}],n[[4]]],IFun[G[[3]][x,#]&,Line[{p[[3]],\[Infinity] Exp[I (\[Pi] 3/4)]}],n[[5]]],IFun[G[[4]][x,#]&,Line[{-1,p[[4]]}],n[[6]]],IFun[G[[4]][x,#]&,Line[{p[[4]],\[Infinity] Exp[I (\[Pi] 5/4)]}],n[[7]]],IFun[G[[5]][x,#]&,Line[{-1I,\[Infinity] Exp[I (\[Pi] 6/4)]}],n[[8]]],IFun[G[[6]][x,#]&,Line[{1,p[[6]]}],n[[9]]],IFun[G[[6]][x,#]&,Line[{p[[6]],\[Infinity] Exp[I (\[Pi] 7/4)]}],n[[10]]],IFun[G[[12]][x,#]&,Line[{1,p[[7]]}],n[[11]]],IFun[G[[12]][x,#]&,Line[{p[[7]],1I}],n[[12]]],IFun[G[[13]][x,#]&,Line[{-1,p[[8]]}],n[[13]]],IFun[G[[13]][x,#]&,Line[{p[[8]],1I}],n[[14]]],IFun[G[[14]][x,#]&,Line[{-1I,p[[9]]}],n[[15]]],IFun[G[[14]][x,#]&,Line[{p[[9]],-1}],n[[16]]],IFun[G[[15]][x,#]&,Line[{-1I,p[[10]]}],n[[17]]],IFun[G[[15]][x,#]&,Line[{p[[10]],1}],n[[18]]]
};
Return[GG];
];


contour[sv_,x_,tol_,xc_] := Module[{p,n},
{p,n} = contourParameters[sv,x,tol,xc];
Return[ contour[sv,x,p,n] ];
]


cacheRHSolver[contour,s_,tol_,xl_,xu_]:=Module[{cf,rhsol,p,n},
{p,n}=contourParameters[s,xu,tol,xl];
cf =contour[s,xu,p,n];
rhsol=RHSolverTop[cf];
Return[cacheRHSolver[rhsol,contour,s,p,n,xl,xu]];
];
cacheRHSolver[rhsol_RHSolverTop,contour,s_,p_,n_,xl_,xu_][x_]:=rhsol[contour[s,x,p,n]];



cachePiiSolver[c_,s_,tol_,xl_,xu_]:=cachePiiSolver[cacheRHSolver[c,s,tol,xl,xu]];
cachePiiSolver[crhsol_cacheRHSolver][x_]:=-(1/(\[Pi] I)) DomainIntegrate[crhsol[x]][[2]] Sqrt[-x/4];

cachedRHSolver[c_,s_,tol_,xl_,xu__]:=cachedRHSolver[c,s,tol,xl,xu]=cacheRHSolver[c,s,tol,xl,xu];

cachedPiiSolver[c_,s_,tol_,xs_,xi_][x_]:=With[{k=Floor[(x-xs)/xi]},cachePiiSolver[cachedRHSolver[c,s,tol,xs+k xi,xs+(k+1) xi]][x]];


Options[PainleveIINegativeContour2]={InterpolationPrecision->10^-7,CacheIntervalLength->-10,CacheIntervalShift->-5};
PainleveIINegativeContour2[s_,x_,opts:OptionsPattern[]]:=
With[{
tol=OptionValue[InterpolationPrecision],
xs = OptionValue[CacheIntervalShift],
xi=OptionValue[CacheIntervalLength]
},
cachedPiiSolver[contour,s,tol,xs,xi][x]
];


listCachedRHSolver[]:=Select[DownValues[cachedRHSolver]/.(t_:>_):>t/.HoldPattern->Hold,MatchQ[#,Hold[cachedRHSolver[Except[_Pattern]..]]]&]

clearCachedRHSolver[]:=Unset@@@listCachedRHSolver[];


End[];