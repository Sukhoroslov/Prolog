/* Recursion and Lists */

factorial(0,1) :- !.
factorial(N,R) :-
    N1 is N - 1,
    factorial(N1,R1),
    R is R1 * N.


nthpower(_,0,1) :- !.
nthpower(N,E,R) :-
    E > 0,
    E1 is E - 1,
    nthpower(N,E1,R1),
    R is R1 * N. 
nthpower(N,E,R) :-
    E < 0,
    E2 is abs(E),
    nthpower(N,E2,R2),
    R is 1 / R2.


fibonacci(1,1) :- !.
fibonacci(2,1) :- !.
fibonacci(N,R) :-
    N1 is N - 1,
    N2 is N - 2,
    fibonacci(N1,R1),
    fibonacci(N2,R2),
    R is (R1 + R2).


nat(0).
nat(N) :-
    N > 0,
    N1 is N - 1,
    nat(N1).


nat2(0).
nat2(X1):-
	nat2(X),
	succ(X,X1).


sumn(1,1) :- !.
sumn(N,R) :-
    N1 is N - 1,
    sumn(N1,R1),
    R is R1 + N.


divides(X,X).
divides(X,Y) :-
    Y > X,
    Y1 is Y - X,
    divides(X, Y1).


divides2(X,X,1).
divides2(X,Y,R) :-
    Y > X,
    Y1 is Y - X,
    divides2(X,Y1,R1),
    R is R1 + 1.


max([X],X).
max([H|T],H):-
	max(T,MT),
	H>=MT.
max([H|T],MT):-
	max(T,MT),
	H<MT.


list_length( [] , 0 ).   % base case
list_length( [_ | T], L ):-  % recursive definition
	list_length( T, R ),
	L is R+1.


sum([],0).
sum([H|T],S):-
	sum(T,ST),
	S is ST+H.


list_member(X,[X|T]).
list_member(X,[H|T]):-
	list_member(X,T).


last_element([X],X).
last_element([H|T],L) :-
	last_member(T,L).


occurs(_,[],0).
occurs(H,[H|T],X) :-
    occurs(H, T, X1),
    X is X1 + 1.
occurs(H,[A|T],X) :-
	H \= A,
    occurs(H,T,X1),
	X is X1.


count_vowels([],0).
count_vowels([H|T],X) :-
	list_member(H,[a,e,i,o,u]),
	count_vowels(T,X1),
	X is X1 + 1.
count_vowels([H|T],X) :-
	\+ list_member(H,[a,e,i,o,u]),
	count_vowels(T,X1),
	X is X1.


digit(zero,0).
digit(one,1).
digit(two,2).
digit(three,3).
digit(four,4).
digit(five,5).
digit(6,six).
digit(seven,7).
digit(eight,8).
digit(nine,9).

add_verbal([],0).
add_verbal([H|T],S) :-
    digit(H,N),
    add_verbal(T,S1),
    S is N + S1.


writelist([]) :-
	nl.
writelist([H|T]) :-
	H \= nl,
	write(H),
	writelist(T).
writelist([H|T]) :-
	H = nl,
	nl,
	writelist(T).


sum_all_lists([],0).
sum_all_lists([H|T],S) :-
    number(H),
    sum_all_lists(T,S1),
    S is H+S1.
sum_all_lists([H|T],S) :-
    is_list(H),
    sum_all_lists(H,S1),
    sum_all_lists(T,S2),
    S is S1+S2.
