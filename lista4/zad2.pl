na_prawo(X, Y) :- X is Y+1.
na_lewo(X, Y) :- na_prawo(Y, X).
sasiad(X, Y) :- na_prawo(X, Y).
sasiad(X, Y) :- na_lewo(X, Y).

rybki(Kto) :-
    Domy = [dom(1,_,_,_,_,_), dom(2,_,_,_,_,_), dom(3,_,_,_,_,_), dom(4,_,_,_,_,_), dom(5,_,_,_,_,_)],
       %dom : {numer,kraj,kolor,zwierze,co_pije,co_pali}:

    member(dom(1, norweg, _, _, _, _   ), Domy), %Norweg zamieszkuje pierwszy dom
    member(dom(_, anglik,  czerwony, _, _, _ ), Domy), %Anglik mieszka w czerwonym domu.
    member(dom(_, szwed, _,  psy, _, _   ), Domy), %Szwed hoduje psy.
    member(dom(_, dunczyk, _, _,  herbata,_), Domy), %Duńczyk pija herbatkę.

    member(dom(A, _, zielony, _, _, _), Domy),
    member(dom(B, _, bialy, _, _, _  ), Domy),
    na_lewo(A, B), %Zielony dom znajduje się bezpośrednio po lewej stronie domu białego.

    member(dom(_, _, _,  ptaki, _, bez_filtra), Domy), %Palacz papierosów bez filtra hoduje ptaki.
    member(dom(_, _, zolty, _, _, cygara), Domy), %Mieszkaniec żółtego domu pali cygara.
    member(dom(3, _, _, _,  mleko, _ ), Domy), %Mieszkaniec środkowego domu pija mleko.

    member(dom(C, _, _, _, _,  light ), Domy),
    member(dom(D, _, _,  koty, _, _ ), Domy),
    sasiad(C, D), %Palacz papierosów light mieszka obok hodowcy kotów

    member(dom(E, _, _,  kon, _, _ ), Domy),
    member(dom(F, _, zolty, _, _, _ ), Domy),
    sasiad(E, F), %Hodowca koni mieszka obok żółtego domu.

    member(dom(_, _, _, _,  mentolowe, piwo    ), Domy), %Palacz mentolowych pija piwo.
    member(dom(_, niemiec, _, _, _,  fajka  ), Domy), %Niemiec pali fajkę
    member(dom(2, _, niebieski,   _, _, _   ), Domy), %Norweg mieszka obok niebieskiego domu

    member(dom(J, _, _, _, woda, _ ), Domy),
    sasiad(C, J), %Palacz papierosów light (C) ma sąsiada, który pija wodę.

    member(dom(_, _, zielony, _, kawa, _ ), Domy), %W zielonym domu pija się kawę.

    member(dom(_, Kto, _, rybki, _, _), Domy), %rozwiązanie
    !.


