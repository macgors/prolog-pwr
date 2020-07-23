
split([H|T], H, T).

mergelist(A, B, Res) :-
  freeze(A, merge2(A,B,Res)).

merge2(A,B,Res) :-
    freeze(B,
    ( A \= [], !,
        (
          B \= [], !,
          (
            split(A, AHead, ATail),
            split(B, BHead, BTail),
          
            (
              AHead =< BHead,
              !,
               append([AHead], ResTemp, Res),
               mergelist(ATail, B, ResTemp)
              
              ;
              (
                append([BHead], ResTemp, Res),
                mergelist(A, BTail, ResTemp)
              )
            )
          );
          Res = A
        );
        Res = B
      )
    ).

merge(A,B,Res) :- mergelist(A,B,Res).
