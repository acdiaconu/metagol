%% 5 clauses minimum, always reuses
%% 6 clauses no reuse

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
    f(['C','o','m','p','a','n','y','\\','C','o','d','e','\\','i','n','d','e','x','.','h','t','m','l',' '],['C','o','m','p','a','n','y','\\','C','o','d','e','\\']),
    f(['C','o','m','p','a','n','y','\\','D','o','c','s','\\','S','p','e','c','\\','s','p','e','c','s','.','d','o','c',' '],['C','o','m','p','a','n','y','\\','D','o','c','s','\\','S','p','e','c','\\']),
    f(['W','o','r','k','\\','P','r','e','s','e','n','t','a','t','i','o','n','s','\\','t','a','l','k','.','p','p','t'],['W','o','r','k','\\','P','r','e','s','e','n','t','a','t','i','o','n','s','\\']),
    f(['W','o','r','k','\\','R','e','c','o','r','d','s','\\','2','0','1','0','\\','J','a','n','u','a','r','y','.','d','a','t'],['W','o','r','k','\\','R','e','c','o','r','d','s','\\','2','0','1','0','\\']),      
    f(['P','r','o','j','\\','N','u','m','e','r','i','c','a','l','\\','S','i','m','u','l','a','t','o','r','s','\\','N','B','o','d','y','\\','n','b','o','d','y','.','c'],['P','r','o','j','\\','N','u','m','e','r','i','c','a','l','\\','S','i','m','u','l','a','t','o','r','s','\\','N','B','o','d','y','\\'])
  ],
  Neg = [
  ],
  learn(Pos,Neg).

:- time(a).
