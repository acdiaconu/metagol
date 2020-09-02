:- use_module('../metagol').
:- ['bk_basic'].

func_test(Atom1,Atom2,Condition):-
  Atom1 = [P,A,B],
  Atom2 = [P,A,C],
  Condition = (B = C).
metagol:functional.

%% tell metagol to use the BK
body_pred(copy1/2).
body_pred(skip1/2).
body_pred(skip_until_space/2).

%% metarules
metarule([P,Q], [P,A,B], [[Q,A,B]]).
metarule([P,Q,R], [P,A,B], [[Q,A],[R,A,B]]).
metarule([P,Q,R], [P,A,B], [[Q,A,B],[R,A]]).
metarule([P,Q,R], [P,A,B], [[Q,A,B],[R,A,B]]).
metarule([P,Q,R], [P,A,B], [[Q,A,C],[R,C,B]]).
metarule([P,Q], [P,A,B], [[Q,A,C],[P,C,B]]).

a :-
  Pos = [
   f(s(['a','b', ' ', 'c'],['c']),s(_,[])),
   f(s([' ','a','c'],['a']),s(_,[])),
   f(s(['a','c', ' ', 'b', 'q'],['b']),s(_,[])),
   f(s(['a','c', 'a', 'b', 'q', 'a','c', 'a', 'b', 'q', 'a',' ', 'X', 'b', 'q'],['X']),s(_,[]))
  ],
  Neg = [
   f(s(['a','b', ' ', 'c'],['b']),s(_,[])),
   f(s([' ','a','c'],['c']),s(_,[])),
   f(s(['a','c', ' ', 'b', 'q'],['q']),s(_,[]))
  ],
  learn(Pos,Neg).

:- time(a).