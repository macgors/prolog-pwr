:- use_module(library(random)).


filozofowie :-
	mutex_create(Widelec5),
	mutex_create(Widelec1),
	mutex_create(Widelec2),
	mutex_create(Widelec3),
	mutex_create(Widelec4),
    thread_create(main_loop(1,Widelec1,Widelec5),ID1,[]),
    thread_create(main_loop(2,Widelec2,Widelec1),ID2,[]),
    thread_create(main_loop(3,Widelec3,Widelec2),ID3,[]),
    thread_create(main_loop(4,Widelec4,Widelec3),ID4,[]),
	thread_create(main_loop(5,Widelec5,Widelec4),ID5,[]),
	thread_join(ID1,_),
	thread_join(ID2,_),
	thread_join(ID3,_),
	thread_join(ID4,_),
	thread_join(ID5,_).


output(ID, TEXT) :- with_mutex(print,format('[~w] ~w~n',[ID,TEXT])).

main_loop(ID,Lewy,Prawy) :- random(0.5,1,R), sleep(R), myslenie(ID,Lewy,Prawy). %Filozofiowie mysla i jedza przez losowy czas, w celu pokazania tego ladniej

myslenie(ID,Lewy,Prawy) :- 
		output(ID,'  mysli'),
        random(0.5,2,R),
		sleep(R),
		widelce(ID,Lewy,Prawy).
		
widelce(ID,Lewy,Prawy):- 
		output(ID,'  chce/czeka na prawy widelec'),
		mutex_lock(Prawy),
		output(ID,'  podniosl prawy widelec'),
		output(ID,'  chce/czeka na na lewy widelec'),
		mutex_lock(Lewy),
		output(ID,'  podniosl lewy widelec'),
        %jedzenie
		output(ID,'  je'),
        random(1.0,2.5,R),
		sleep(R),
        %odkladanie
		mutex_unlock(Prawy),
		output(ID,'  odklada prawy widelec'),
		mutex_unlock(Lewy),
		output(ID,'  odklada lewy widelec'),
		myslenie(ID,Lewy,Prawy).

