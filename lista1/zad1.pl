matka(a,b).
jest_matka(X) :- matka(X,Y).
jest_ojcem(X) :- ojciec(X,Y).
jest_synem(X) :- mezczyzna(X), rodzic(Y,X).
siostra(X,Y) :- kobieta(X), rodzic(Z,X), rodzic(Z,Y), diff(X,Y).
rodzenstwo(X,Y) :- rodzic(Z,X), rodzic(Z,Y), diff(X,Y).
dziadek(X,Y) :- mezczyzna(X), rodzic(X,Z), rodzic(Z,Y).
