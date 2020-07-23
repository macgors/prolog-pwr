jednokrotnie(X,L) :-
    member(X,L),
	select(X, L, L1), % Innymi słowy: czy da się wyciąć dowolny element z listy dokładnie 1 raz i sprawdić, że nie bedzie wystepował w liscie wynnikowej
	\+ member(X, L1).

dwukrotnie(X, L) :-
    select(X, L, L1),
    member(X, L1),
	jednokrotnie(X,L1).