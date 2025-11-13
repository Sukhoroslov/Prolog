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
