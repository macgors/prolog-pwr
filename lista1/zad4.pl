le(3,4).
le(4,5).
le(3,6).
le(3,3).
le(6,6).
le(5,5).
le(4,4).

max(X) :-le(X, X), \+ (le(X, Y), X =\= Y).

min(X) :- le(X, X), \+ (le(Y, X), X =\= Y).

biggest(X) :- le(X, X), \+ (le(Y, Y), \+ le(Y, X)).

smallest(X) :- le(X, X), \+ (le(Y, Y), \+ le(X, Y)).