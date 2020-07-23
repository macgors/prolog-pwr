delete_leading([_ | T], T).

delete_trailing([_], []).
delete_trailing([X | T1], [X | T2]) :-
	delete_trailing(T1, T2).

środkowy([X], X).
środkowy(L, X) :- 
	delete_leading(L, L1),
	delete_trailing(L1, L2),
	środkowy(L2, X).