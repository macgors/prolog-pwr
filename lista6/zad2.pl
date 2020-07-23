%  :- use_module(interpreter, [interpreter/1, interpreter/2]).
:- ['lexer.pl', 'zad1.pl', 'interpreter.pl'].
% Przy korzystaniu z interpretera podanego tutaj: https://github.com/przemko/prolog-pl/blob/master/src/wyk_06/interpreter.pl, mimo dokładnie takiego samego wyniku
% zadania pierwszego, interpreter prosi o podanie N z pierwszej linijki ex1.prog, a potem wypisuje false. i kończy działanie.
wykonaj(F) :-
	open(F, read, X), 
	scanner(X, Y), 
	close(X),
	phrase(program(PROGRAM), Y),
	interpreter(PROGRAM).