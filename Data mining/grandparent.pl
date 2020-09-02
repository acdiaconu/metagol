:- use_module('../metagol').

% metagol:functional.
% func_test(Atom1,Atom2,Condition):-
%   Atom1 = [P,A,B],
%   Atom2 = [P,A,C],
%   Condition = (B = C).

%% tell Metagol to use the BK
body_pred(father/2).
body_pred(mother/2).

%% metarules
metarule([P,Q], [P,A,B], [[Q,A,B]]).
metarule([P,Q,R], [P,A,B], [[Q,A,C],[R,C,B]]).

%% background knowledge
mother(i,a).
mother(c,f).
mother(c,g).
mother(f,h).
father(a,b).
father(a,c).
father(b,d).
father(b,e).

:-
 Pos = [
    f(i,b),
    f(i,c),
    f(a,d),
    f(a,e),
    f(a,f),
    f(a,g),
    f(c,h)
  ],
  Neg = [
    f(a,b),
    f(b,c),
    f(c,d),
    f(d,e),
    f(e,f),
    f(f,g),
    f(g,h),
    f(h,i)
  ],
  learn(Pos,Neg).
