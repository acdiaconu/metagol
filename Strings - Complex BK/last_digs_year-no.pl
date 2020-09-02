%% 5 clauses, both reuse and no reuse

:- use_module('../metagol').
:-['bk_complex'].

func_test(Atom1,Atom2,Condition):-
  Atom1 = [P,A,B],
  Atom2 = [P,A,C],
  Condition = (B = C).
metagol:functional.

body_pred(is_letter/1).
body_pred(not_letter/1).
body_pred(is_uppercase/1).
body_pred(not_uppercase/1).
body_pred(is_space/1).
body_pred(not_space/1).
body_pred(is_number/1).
body_pred(not_number/1).
body_pred(tail/2).
body_pred(dropLast/2).
body_pred(myreverse/2).
body_pred(filter/3).
body_pred(dropWhile/3).
body_pred(takeWhile/3).

metarule([P,Q,R],[P,A,B],[[Q,A,C],[R,C,B]]).
metarule([P,Q,Cond],[P,A,B],[[Q,A,B,Cond]]):-
  body_pred(Cond/1).

a :-
  Pos = [
    f(['1','/','2','1','/','2','0','0','1'],['0','1']),
    f(['2','2','.','0','2','.','2','0','0','2'],['0','2']),
    f(['2','1','/','1','/','2','0','0','1'],['0','1']),
    f(['5','/','5','/','1','9','8','7'],['8','7'])],
  Neg = [
  ],
  learn(Pos,Neg).

:- time(a).
