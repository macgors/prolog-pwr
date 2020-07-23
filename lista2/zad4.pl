uprość(A,A):- atom(A) ; number(A).
uprość(X+Y, X1+Y1) :- uprość(X, X1), uprość(Y, Y1).
uprość(X*Y, X1*Y1) :- uprość(X, X1), uprość(Y, Y1).
uprość(X/Y, X1/Y1) :- uprość(X, X1), uprość(Y, Y1).
uprość(X-Y, X1-Y1) :- uprość(X, X1), uprość(Y, Y1).

uprość(X+Y, W) :-reguła(X,+,Y,W).
uprość(X*Y, W) :-reguła(X,*,Y,W).
uprość(X-Y, W) :-reguła(X,-,Y,W).
uprość(X/Y, W) :-reguła(X,/,Y,W).

reguła(X, + , Y, W) :- 
    number(X),
    number(Y),
    W is X+Y,
    !.
reguła(X,+,Y,Y):-
    number(X),
    X=:=0,
    !.
reguła(X,+,Y,X):-
    number(Y),
    Y=:=0,
    !.
reguła(X, * , Y, W) :- 
    number(X),
    number(Y),
    W is X*Y,
    !.
reguła(X, - , Y, W) :- 
    number(X),
    number(Y),
    W is X-Y,
    !.
reguła(X,*,Y,0):-
    number(X),
    \+ number(Y),
    X=:=0,
    !.
reguła(X,*,Y,0):-
    number(Y),
    \+ number(X),
    Y=:=0,
    !.
reguła(1,*,Y,Y):-
    \+ number(Y),
    !.
reguła(Y,*,1,Y):-
    \+ number(Y),
    !.