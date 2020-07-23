% len(Xs,L) :- len(Xs,0,L) .

% len( []     , L , L ) .
% len( [_|Xs] , T , L ) :-
%   T1 is T+1 ,
%   len(Xs,T1,L).

% jednokrotnie(X,L) :- %z poprzedniego zadania
%     member(X,L),
% 	select(X, L, L1),
% 	\+ member(X, L1).

% dwukrotnie(X, L) :-
%     select(X, L, L1),
%     member(X, L1),
% 	jednokrotnie(X,L1).


% kazdaLiczbaDwaRazy(N,L,I):- 
%     I =:= N;
%     (   member(I,L),
%         kazdaLiczbaDwaRazy(N,L,I+1)
%     )
%     .
    
% even(X) :- 0 is mod(X, 2).

% lista(N,X):-
%     len(X,L),
%     L =:= N*2,
%     foreach(between(1, N, I),dwukrotnie(I,X)),
%     foreach(between(1, N, I),isSpacedByEven(X,I)).


% indexOf([Element|_], Element, 0):- !.
% indexOf([_|Tail], Element, Index):-
%   indexOf(Tail, Element, Index1),
%   !,
%   Index is Index1+1.

% isSpacedByEven(LIST, Elem):-
%     indexOf(LIST,Elem,I1),
%     remove_1st_x(Elem, LIST, LIST2),
%     indexOf(LIST2,Elem,I2),
%     C is I2-I1,
%     even(C),
%     !.
% remove_1st_x(X,[X|Xs],Xs).
% remove_1st_x(X,[Y|Xs],[Y|Ys]) :- 
%     dif(X,Y),
%     remove_1st_x(X,Xs,Ys).

% split(List,Odd,Even):-odd(List,Odd,Even).

% odd([H|T],[H|Odd],Even):-even(T,Odd,Even).
% odd([],[],[]).

% even([H|T],Odd,[H|Even]):-odd(T,Odd,Even).       
% even([],[],[]). 

% ^ Wersja, która działa, ale jest tak boleśnie wolna, że dla '3' komputer umiera.




join([H1|T1], [H2|T2], [H1, H2|T]) :- !, join(T1, T2, T).
join([], R, R) :- !.
join(R, [], R).

permute([], []).
permute([X|Rest], L) :-
    permute(Rest, L1),
    select(X, L, L1).

lista(N,X):-
	findall(A, between(1, N, A), L1), %create a list 1..n
    permute(L1, L2),
    permute(L1, L3),  
	join(L3,L2,X).      %join 'em



%     %debug 
%     join([H1|T1], [H2|T2], [H1, H2|T]) :- !, join(T1, T2, T).
% join([], R, R) :- !.
% join(R, [], R).

% permute([], []).
% permute([X|Rest], L) :-
%     permute(Rest, L1),
%     select(X, L, L1).

% lista(N,X):-
% 	findall(A, between(1, N, A), L1), %create a list 1..n
% 	permute(L1, L2),   %permutate a copy of it
%     write(L2),
% 	join([a,b,c],L2,X).      %join 'em
