  
program([]) --> [].
program([X|Y]) --> instruction(X), [sep(;)], program(Y).

instruction(assign(X,Y)) -->
                            [id(X)], [sep(':=')], exp(Y).

instruction(read(X)) --> 
                            [key('read')], [id(X)].
                            
instruction(write(X)) --> 
                            [key('write')], exp(X).

instruction(if(X,Y)) -->    [key('if')], 
                            cond(X), 
                            [key('then')], 
                            program(Y), 
                            [key('fi')].

instruction(if(X,Y,C)) -->  [key('if')], 
                            cond(X),
                            [key('then')], 
                            program(Y), 
                            [key('else')], 
                            program(C), 
                            [key('fi')].

instruction(while(X,Y)) --> [key('while')], 
                            cond(X), 
                            [key('do')], 
                            program(Y), 
                            [key('od')].

exp(X+Y) --> partial_exp(X), [sep(+)], exp(Y).
exp(X-Y) --> partial_exp(X), [sep(-)], exp(Y).
exp(X) --> partial_exp(X).

partial_exp(X*Y) --> factor(X), [sep(*)], partial_exp(Y).
partial_exp(X/Y) --> factor(X), [sep(/)], partial_exp(Y).
partial_exp(X mod Y) --> factor(X), [key('mod')], partial_exp(Y).
partial_exp(X) --> factor(X).
simple_exp(X=:=Y) --> exp(X), [sep(=)], exp(Y).
simple_exp(X=\=Y) --> exp(X), [sep('/=')], exp(Y).
simple_exp(X<Y) --> exp(X), [sep(<)], exp(Y).
simple_exp(X>Y) --> exp(X), [sep(>)], exp(Y).
simple_exp(X>=Y) --> exp(X), [sep(>=)], exp(Y).
simple_exp(X=<Y) --> exp(X), [sep(=<)], exp(Y).
simple_exp(X) --> [sep('(')], cond(X), [sep(')')].

factor(id(X)) --> [id(X)].
factor(int(X)) --> [int(X)].
factor(X) --> [sep('(')], exp(X), [sep(')')].

cond(X ; Y) --> logical_and(X), [key('or')], cond(Y).
cond(X) --> logical_and(X).

logical_and(X ',' Y) --> simple_exp(X), [key('and')], logical_and(Y).
logical_and(X) --> simple_exp(X).

