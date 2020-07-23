max_sum([],0).
max_sum([H|L], S) :-	
	max_sum(L, H, H, S).

max_sum([],_,S,S).

max_sum([H|T],Cur,Max,Sum):-
	(Cur > 0 -> Next is Cur + H; Next is H),
	NewBest is max(Next,Max),
	max_sum(T,Next, NewBest, Sum).