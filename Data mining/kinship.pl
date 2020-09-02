:- use_module('../metagol').

metagol:max_clauses(7).
% func_test(Atom1,Atom2,Condition):-
%   Atom1 = [P,A,B],
%   Atom2 = [P,A,C],
%   Condition = (B = C).

%% preds that metagol can use in the body of a clause
body_pred(mother/2).
body_pred(father/2).

%% metarules
metarule([P,Q], [P,A,B], [[Q,A,B]]).
metarule([P,Q,R], [P,A,B], [[Q,A,C],[R,C,B]]).

%% background knowledge
mother(b,c).
mother(e,f).
mother(i,l).
mother(k,m).
mother(f,g).
mother(m,n).
mother(n,o).
father(g,o).
father(a,c).
father(d,f).
father(h,l).
father(j,m).
father(l,n).
father(c,g).


%% learn grandparent by inventing parent
a:-
  Pos = [
    f(a,o),
    f(b,o),
    f(d,o),
    f(e,o),
    f(h,o),
    f(i,o),
    f(j,o),
    f(k,o)
  ],
  Neg = [],

  learn(Pos,Neg).

:-
  time(a).