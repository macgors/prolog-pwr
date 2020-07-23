average( List, Average ):- 
    sumlist( List, Sum ),
    length( List, Length ),
    Average is Sum / Length.

    
variance([H|T], Sum, I, Average, Y) :- %iterating and keeping a  RunningTotal of variance
    I1 is I + 1,
    RunningTotal is Sum + (((H - Average) * (H - Average))),
    variance(T, RunningTotal, I1, Average, Y).
  
variance([], Sum, I, Average, Variance) :- %end case
    Variance is Sum / I.

wariancja([],X) :-
    X is 0,
    !.
wariancja(List, X) :- %call case
    average(List, A),
    variance(List, 0, 0, A, X).
