arc(a,b).
arc(b,a).
arc(b,c).
arc(c,d).


osiagalny(A,B) :- walk(A,B, []).

walk(A,B, VISITED) :-
	arc(A,X),
	\+ member(X,VISITED),
	walk(X, B, [A|VISITED]).
walk(A,A, _).