writelist([]).
writelist([nl|T]) :-
    nl, !,
    writelist(T).
writelist([H|T]) :-
    write(H),
    writelist(T).

square(N, S) :-
    S is N * N.

sumn(1,1) :- !.
sumn(N,R) :-
    N1 is N - 1,
    sumn(N1,R1),
    R is R1 + N.

factorial(0,1) :- !.
factorial(N,R) :-
    N1 is N - 1,
    factorial(N1,R1),
    R is R1 * N.

dialogue :-
    repeat,
    write('Enter a positive number (or exit to finish):'),
    read(N),
    ( N = exit, !
    ;
      nl,
      writelist(['1. Calculate the square of the entered number', nl,
                 '2. Calculate the factorial of the entered number', nl,
                 '3. Calculate the sum of all numbers from 1 up to the entered number', nl,
                 'Choice: ']),
      read(Choice),
      ( Choice = 1 -> 
        square(N, R),  
        writelist(['The square is ', N, '^2 = ', R, nl])
      ; Choice = 2 -> 
        factorial(N, R), 
        writelist(['The factorial is ', N, '! = ', R, nl])
      ; Choice = 3 -> 
        sumn(N, R), 
        writelist(['The sum of all numbers from 1 up to the entered number is = ', R, nl])
      ; writelist(['There is no such option. Choose again!', nl])
      ),
      fail
    ).
