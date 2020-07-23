wyrazenie_proste(Wynik, Lewa, Prawa) :- Wynik = Lewa + Prawa.
wyrazenie_proste(Wynik, Lewa, Prawa) :- Wynik = Lewa - Prawa.
wyrazenie_proste(Wynik, Lewa, Prawa) :- Wynik = Lewa * Prawa.
wyrazenie_proste(Wynik, Lewa, Prawa) :- 0 =\= Prawa, Wynik = Lewa / Prawa.	


wyrazenie([X],X,X). %X=X 

wyrazenie(LISTA,WARTOSC,WYRAZENIE):-
    append([X|Xs],[Y|Ys], LISTA),

    wyrazenie([X|Xs],A,A),
    wyrazenie([Y|Ys],B,B),

    wyrazenie_proste(WYRAZENIE,A,B),
       
    ( %sprawdzanie czy czy skonstruowane rozwiązanie jest poprawne 
        WARTOSC = WYRAZENIE ;
        WARTOSC is WYRAZENIE
    ).