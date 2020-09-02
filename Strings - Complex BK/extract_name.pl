%% 6 clauses min, all reuse, takes almost 10 mins

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
      f(['h','t','t','p',':','/','/','w','w','w','.','g','o','o','g','l','e','.','c','o','m'],['g','o','o','g','l','e']),
      f(['h','t','t','p',':','/','/','w','w','w','.','m','i','c','r','o','s','o','f','t','.','c','o','m'],['m','i','c','r','o','s','o','f','t']),
      f(['h','t','t','p',':','/','/','w','w','w','.','o','x','f','o','r','d','.','c','o','.','u','k'],['o','x','f','o','r','d'])
    ],
  Neg = [
  ],
  learn(Pos,Neg).

:- time(a).

% f(A,B):-f_1(A,C),f_5(C,B).
% f_1(A,B):-f_2(A,C),f_2(C,B).
% f_2(A,B):-f_3(A,C),f_3(C,B).
% f_3(A,B):-f_4(A,C),tail(C,B).
% f_4(A,B):-dropWhile(A,B,is_letter).
% f_5(A,B):-takeWhile(A,B,is_letter).

% f(A,B):-f_1(A,C),f_5(C,B).
% f_1(A,B):-f_2(A,C),f_2(C,B).
% f_2(A,B):-f_3(A,C),f_4(C,B).
% f_3(A,B):-dropWhile(A,B,is_letter).
% f_4(A,B):-dropWhile(A,B,not_letter).
% f_5(A,B):-takeWhile(A,B,is_letter).