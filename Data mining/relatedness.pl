:- use_module('../metagol').

% metagol:functional.
% func_test(Atom1,Atom2,Condition):-
%   Atom1 = [P,A,B],
%   Atom2 = [P,A,C],
%   Condition = (B = C).

%% tell Metagol to use the BK
body_pred(parent/2).

%% metarules
metarule([P,Q], [P,A,B], [[Q,A,B]]).
metarule([P,Q], [P,A,B], [[Q,B,A]]).
metarule([P,Q,R], [P,A,B], [[Q,A,C],[R,C,B]]).

%% background knowledge
parent(a,b).
parent(a,c).
parent(c,e).
parent(c,f).
parent(d,c).
parent(g,h).

:-
 Pos = [
    f(a,b),
    f(a,c),
    f(a,e),
    f(a,f),
    f(f,a),
    f(a,a),
    f(d,b),
    f(h,g)
  ],
  Neg = [
    f(g,a),
    f(a,h),
    f(e,g),
    f(g,b)
  ],
  learn(Pos,Neg).