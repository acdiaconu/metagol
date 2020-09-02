%% 5 clauses min, most reuse but some don't

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
    f(['#','i','n','c','l','u','d','e',' ','<','i','o','s','t','r','e','a','m','>'],['i','o','s','t','r','e','a','m']),
    f(['#','i','n','c','l','u','d','e',' ','<','s','t','d','i','o','.','h','>'],['s','t','d','i','o']),
    f(['#','i','n','c','l','u','d','e',' ','"','h','e','a','d','e','r','.','h','"'],['h','e','a','d','e','r'])  
    ],
  Neg = [
  ],
  learn(Pos,Neg).

:- time(a).
