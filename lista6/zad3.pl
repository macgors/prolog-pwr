%a)
w1 --> [].
w1 --> [x], w1, [y].

%b)
a(0) --> [].
a(I) --> [a], a(J), {I is J + 1}.
b(0) --> [].
b(I) --> [b], b(J), {I is J + 1}.
c(0) --> [].
c(I) --> [c], c(J), {I is J + 1}.

gramatyka --> a(I), b(I), c(I).

%c)

fib(0, 1) :- !.
fib(1, 1) :- !.
fib(N, Res) :-  N1 is N - 1, N2 is N - 2, fib(N1, Res1), fib(N2, Res2), Res is Res1 + Res2.

g3 --> a(Res), {fib(N, Res)}, b(Res).
