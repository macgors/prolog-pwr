scanner(X, Z) :-
  arrayify(X, Y),
  tokenize(Y, '', Z),
  !.

arrayify(I, []) :- 
    at_end_of_stream(I).
  
arrayify(I, [Ch|ChT]) :-
  \+ at_end_of_stream(I),
  get_code(I, Code),
  atom_codes(Ch, [Code]),
  arrayify(I, ChT).



ignore(' ').
ignore('\n').
ignore('\t').

token(X,Y):-
	member(X,[';','+','-','*','/','(',')','<','>','=<','>=',':=','=','/=']),
    Y = sep(X),
    !.

token(X,Y):-
	member(X,['read','write','if','then','else','fi','while','do','od','and','or','mod']),
    Y = key(X),
    !.


token(A, B) :-
  atom_number(A, Token),
  integer(Token),
  B = int(Token),
  !.

%% greedy matching for ids and ints
tokenize_id([S|STail], Temp, Res) :-
  char_type(S, upper),
  atom_concat(Temp, S, STemp),
  tokenize_id(STail, STemp, Res),
   !.

tokenize_id([S|STail], Temp, [Token|TokenTail]) :-
  \+ char_type(S, upper),
  Token = id(Temp),
  tokenize([S|STail], '', TokenTail),
   !.


tokenize_int([S|STail], Temp, Res) :-
  char_type(S, digit),
  atom_concat(Temp, S, STemp),
  tokenize_int(STail, STemp, Res),
   !.

tokenize_int([S|STail], Temp, [Token|TokenTail]) :-
  \+ char_type(S, digit),
  Token = int(Temp),
  tokenize([S|STail], '', TokenTail),
  !.



tokenize([], '', []).

tokenize([S|STail], 0, Res) :- %begin greedy matching int, char by char, with empty temp acc
  char_type(S, digit),
  atom_concat('', S, STemp),
  tokenize_int(STail, STemp, Res),
  !.

tokenize([S|STail], Temp, [Token|TokenTail]) :-
  \+ char_type(S, upper),
  \+ ignore(Temp),
  atom_concat(Temp, S, STemp),
  token(STemp, Token),
  tokenize(STail, '', TokenTail), 
  !.

tokenize([S|STail], Temp, Res) :-
  \+ char_type(S, upper),
  \+ ignore(Temp),  
  atom_concat(Temp, S, STemp),
  tokenize(STail, STemp, Res), 
  !.

tokenize([S|STail], Temp, Res) :- %whitespace
  ignore(S),
  tokenize(STail, Temp, Res), 
  !.

tokenize([S|STail], '', Res) :- %begin greedy matching upercase string, with empty temp acc
  char_type(S, upper),
  atom_concat('', S, STemp),
  tokenize_id(STail, STemp, Res), 
  !.
