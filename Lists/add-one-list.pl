:-['../metagol'].

body_pred(my_succ/2).

my_succ(A,B):-
    (nonvar(A) -> integer(A); true),
    (nonvar(B) -> integer(B); true),
    succ(A,B).

%% metarules
metarule(ident, [P,Q], [P,A,B], [[Q,A,B]]).
metarule(curry, [P,Q,F], [P,A,B], [[Q,A,B,F]]).
metarule(chain, [P,Q,R], [P,A,B], [[Q,A,C],[R,C,B]]).

%% ibk
ibk([map,A,B,_],[[empty,A],[empty,B]]).
ibk([map,A,B,F],[[head,A,H1],[head,B,H2],[F,H1,H2],[tail,A,T1],[tail,B,T2],[map,T1,T2,F]]).

a:-
    learn([f([1,2,3],[6,7,8])],[]).