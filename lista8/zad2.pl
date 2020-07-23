:- use_module(library(clpfd)).


plecak(Values, Sizes, Capacity, Res) :-
	length(Values, Len),
	length(Res, Len),
	Res ins 0..1,
	scalar_product(Sizes, Res, #=<, Capacity),
	scalar_product(Values, Res, #=, ValOfChosen),
	once(labeling([max(ValOfChosen)], Res)),
    !.