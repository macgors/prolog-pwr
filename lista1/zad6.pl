
is_prime(X) :- \+ (GRANICA is integer(sqrt(X)), between(2, GRANICA, ITER), X mod ITER=:=0).


prime(LO, HI, N) :- between(LO, HI, N), is_prime(N).
