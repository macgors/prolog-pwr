le(3,3).
le(3,5).
%tragedia
%slaboantysymetruczna,zwrotna,przechodnia:

czesciowy_porzadek :- (\+(le(X,Y); \+le(Y,X)),\+X=Y), (le(X,X)), (\+(\+le(X, Y); \+le(Y,Z)), \+le(X,Z)).

czesciowy_porzadek.
