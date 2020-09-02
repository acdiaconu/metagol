head([H|_],H).
tail([_|T],T).

not_uppercase(A):-
  \+is_uppercase(A).
not_lowercase(A):-
  \+is_lowercase(A).
not_letter(A):-
  \+is_letter(A).
not_number(A):-
  \+is_number(A).
not_space(A):-
  \+is_space(A).
  
mk_upper(A,B) :- convert_case(B,A).
mk_lower(A,B) :- convert_case(A,B).

dropWhile([A|As],B,P):-
  body_pred(P/1),
  (call(P,A) ->
    dropWhile(As,B,P);
    B=[A|As]).

dropLast([_],[]):-!.
dropLast([H|T],[H|Out]):-
  dropLast(T,Out).

takek(A,B,N):-
  length(B,N),
  append(B,_,A).

my_append(A,B,C):-append(A,B,C).

takeWhile([],[],P):-body_pred(P/1).
takeWhile([A|As],Out,P):-
  body_pred(P/1),
  (call(P,A) ->
    (
      Out=[A|Bs],
      takeWhile(As,Bs,P)
    );
    Out=[]
  ).

apply_at(A,B,Index,Func):-
  is_list(A),
  %% writeln(Func),
  findall(New,(
    nth1(I,A,Old),
      (I=Index ->
        call(Func,Old,New);
        Old=New)),B).

map([],[],F):-body_pred(F/2).
map([A|As],[B|Bs],F):-
  body_pred(F/2),
  call(F,A,B),
  map(As,Bs,F).

flatMap(A,B,F):-
  map(A,C,F),
  flatten(C,B).

filter([],[],F):-body_pred(F/1).
filter([A|As],B,F):-
  body_pred(F/1),
  (call(F,A) -> B=[A|Out]; B=Out),
  filter(As,Out,F).

f(List,Before,After,Token):-
  append(Before,[Token|After],List),!.
f(List,List,[],_):-!.

split([],[],_):-!.
split(List,[Chunk|Chunks],Token):-
  f(List,Chunk,Rest,Token),!,
  split(Rest,Chunks,Token).

replace([],[],_,_):-!.
replace([A|As],[B|Bs],X1,X2):-
  (A=X1 ->B=X2;B=A),
  replace(As,Bs,X1,X2).

insert_at(A,B,Index,Char):-
  length(Before,Index),
  append(Before,After,A),
  is_letter(Char),
  append(Before,[Char|After],B).

myreverse(A,B):-
  reverse(A,B),
  A\=B.

is_uppercase('A').
is_uppercase('B').
is_uppercase('C').
is_uppercase('D').
is_uppercase('E').
is_uppercase('F').
is_uppercase('G').
is_uppercase('H').
is_uppercase('I').
is_uppercase('J').
is_uppercase('K').
is_uppercase('L').
is_uppercase('M').
is_uppercase('N').
is_uppercase('O').
is_uppercase('P').
is_uppercase('Q').
is_uppercase('R').
is_uppercase('S').
is_uppercase('T').
is_uppercase('U').
is_uppercase('V').
is_uppercase('W').
is_uppercase('X').
is_uppercase('Y').
is_uppercase('Z').

is_lowercase('a').
is_lowercase('b').
is_lowercase('c').
is_lowercase('d').
is_lowercase('e').
is_lowercase('f').
is_lowercase('g').
is_lowercase('h').
is_lowercase('i').
is_lowercase('j').
is_lowercase('k').
is_lowercase('l').
is_lowercase('m').
is_lowercase('n').
is_lowercase('o').
is_lowercase('p').
is_lowercase('q').
is_lowercase('r').
is_lowercase('s').
is_lowercase('t').
is_lowercase('u').
is_lowercase('v').
is_lowercase('w').
is_lowercase('x').
is_lowercase('y').
is_lowercase('z').

convert_case('A','a').
convert_case('B','b').
convert_case('C','c').
convert_case('D','d').
convert_case('E','e').
convert_case('F','f').
convert_case('G','g').
convert_case('H','h').
convert_case('I','i').
convert_case('J','j').
convert_case('K','k').
convert_case('L','l').
convert_case('M','m').
convert_case('N','n').
convert_case('O','o').
convert_case('P','p').
convert_case('Q','q').
convert_case('R','r').
convert_case('S','s').
convert_case('T','t').
convert_case('U','u').
convert_case('V','v').
convert_case('W','w').
convert_case('X','x').
convert_case('Y','y').
convert_case('Z','z').

is_letter('A').
is_letter('B').
is_letter('C').
is_letter('D').
is_letter('E').
is_letter('F').
is_letter('G').
is_letter('H').
is_letter('I').
is_letter('J').
is_letter('K').
is_letter('L').
is_letter('M').
is_letter('N').
is_letter('O').
is_letter('P').
is_letter('Q').
is_letter('R').
is_letter('S').
is_letter('T').
is_letter('U').
is_letter('V').
is_letter('W').
is_letter('X').
is_letter('Y').
is_letter('Z').
is_letter('a').
is_letter('b').
is_letter('c').
is_letter('d').
is_letter('e').
is_letter('f').
is_letter('g').
is_letter('h').
is_letter('i').
is_letter('j').
is_letter('k').
is_letter('l').
is_letter('m').
is_letter('n').
is_letter('o').
is_letter('p').
is_letter('q').
is_letter('r').
is_letter('s').
is_letter('t').
is_letter('u').
is_letter('v').
is_letter('w').
is_letter('x').
is_letter('y').
is_letter('z').

is_number('0').
is_number('1').
is_number('2').
is_number('3').
is_number('4').
is_number('5').
is_number('6').
is_number('7').
is_number('8').
is_number('9').

is_space(' ').
