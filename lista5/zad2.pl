board(Hetmany) :-
  length(Hetmany, Len),
  rysujWiersz(Len, Len, Hetmany),
  granica(Len),
  !.  

granica(Len) :-
  write("+"),
  rysujGranice(Len),
  write("\n").

rysujGranice(Len) :-
  Len > 0,
  write("-----+"),
  Len2 is Len - 1,
  rysujGranice(Len2).

rysujGranice(0).


rysujWiersz(Wiersz, Wid, Hetmany) :-
    Wiersz > 0,
    (0 is Wiersz mod 2 -> ogarnijBialeStart(Wid,Wiersz,Hetmany); ogarnijCzarneStart(Wid,Wiersz,Hetmany)),
    Wiersz2 is Wiersz - 1,
    rysujWiersz(Wiersz2, Wid, Hetmany).
  
rysujWiersz(0, _, _).

ogarnijCzarneStart(Wid,Wiersz,Hetmany) :-
    granica(Wid),
    write("|"),
    rysujCzarne(Wiersz, Hetmany),
    write("\n"),
    write("|"),
    rysujCzarne(Wiersz, Hetmany),
    write("\n").
   

ogarnijBialeStart(Wid,Wiersz,Hetmany) :-
    granica(Wid),
    write("|"),
    rysujBiale(Wiersz, Hetmany),
    write("\n"),
    write("|"),
    rysujBiale(Wiersz, Hetmany),
    write("\n").

rysujCzarne(I, [Hs|Ts]) :-
  I =\= Hs,
  write(":::::|"),
  rysujBiale(I, Ts).

rysujCzarne(I, [Hs|Ts]) :-
  I =:= Hs,
  write(":###:|"),
  rysujBiale(I, Ts).

rysujCzarne(_, []).

rysujBiale(I, [Hs|Ts]) :-
  I =\= Hs,
  write("     |"),
  rysujCzarne(I, Ts).

rysujBiale(I, [Hs|Ts]) :-
  I =:= Hs,
  write(" ### |"),
  rysujCzarne(I, Ts).

rysujBiale(_, []).
