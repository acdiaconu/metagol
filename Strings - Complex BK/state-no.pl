%% 5 clauses minimum, both reuse and no reuse solutions

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
   f(['3',' ','A','m','e','s',' ','S','t','.',',',' ','P','o','r','t','l','a','n','d',',',' ','O','R',' ','0','2','1','4','2',' '],['O','R']),
   f(['4','7',' ','F','o','s','k','e','t','t',' ','S','t','.',' ','#','2',',',' ','C','a','m','b','r','i','d','g','e',',',' ','M','A',' ','0','2','1','4','4',' '],['M','A']),
   f(['4','3',' ','V','a','s','s','a','r',' ','S','t','.',' ','4','6','-','4','0','5','3',',',' ','C','a','m','b','r','i','d','g','e',',',' ','M','A',' ','0','2','1','3','9',' '],['M','A']),
   f(['3','1','1','3',' ','G','r','e','e','n','f','i','e','l','d',' ','A','v','e','.',',',' ','L','o','s',' ','A','n','g','e','l','e','s',',',' ','C','A',' ','9','0','0','3','4',' '],['C','A']),
   f(['4','3',' ','M','a','r','g','a','r','e','t',' ','S','t','.',' ','#','1',',',' ','D','o','r','c','h','e','s','t','e','r',',',' ','M','A',' ','0','2','1','2','5',' 
'],['M','A'])
  ],
  Neg = [
    f(['3',' ','A','m','e','s',' ','S','t','.',',',' ','P','o','r','t','l','a','n','d',',',' ','O','R',' ','0','2','1','4','2',' '],['R', 'R']),
    f(['3',' ','A','m','e','s',' ','S','t','.',',',' ','P','o','r','t','l','a','n','d',',',' ','O','R',' ','0','2','1','4','2',' '],['P', 'R']),
    f(['3',' ','A','m','e','s',' ','S','t','.',',',' ','P','o','r','t','l','a','n','d',',',' ','O','R',' ','0','2','1','4','2',' '],['S', 'S']),
    f(['3',' ','A','m','e','s',' ','S','t','.',',',' ','P','o','r','t','l','a','n','d',',',' ','O','R',' ','0','2','1','4','2',' '],['0', '2']),
    f(['3',' ','A','m','e','s',' ','S','t','.',',',' ','P','o','r','t','l','a','n','d',',',' ','O','R',' ','0','2','1','4','2',' '],[' ', '0'])
  ],
  learn(Pos,Neg).

:- time(a).

f(A,B):-f_1(A,C),f_1(C,B).
f_1(A,B):-f_2(A,C),f_2(C,B).
f_2(A,B):-tail(A,C),tail(C,B).
f_2(A,B):-filter(A,B,is_uppercase).