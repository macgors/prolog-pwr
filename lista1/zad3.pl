above(bicycle, pencil).
above(camera, butterfly).

left_of(pencil, hourglass).
left_of(hourglass, butterfly).
left_of(butterfly, fish).
%left_of(bicycle,camera). %tego w sumie nie powinno byc?

right_of(X,Y) :- left_of(Y,X).
below(X,Y) :- above(Y,X).

recursive_left_of(X,Y) :- left_of(X,Y); (left_of(X,Z),recursive_left_of(Z,Y)).
recursive_above(X,Y) :- above(X,Y); (left_of(X,Z),recursive_above(Z,Y)).



higher(X, Y) :- above(X, Y).
higher(X, Y) :-
    above(X, Z),
    recursive_left_of(Y, Z).
higher(X, Y) :-
    above(X, Z),
    recursive_left_of(Z, Y).
