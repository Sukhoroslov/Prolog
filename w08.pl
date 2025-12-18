% Ex. 1
intersection(X,Y,L) :-
    findall(N,(member(N,X),member(N,Y)),L).

union(X,Y,L) :-
    findall(N,(member(N,X) ; member(N,Y)),L).

difference(X,Y,L) :-
    findall(N,(member(N,X),not(member(N,Y))),L).

% Ex. 2
list_to_set(X,L) :-
    setof(N,member(N,X),L).

% Ex. 3
cartesian(X,Y,L) :-
    findall([N,M],(member(N,X),member(M,Y)),L).

% Ex. 4
greater_than(X,Y,L) :-
    findall(N,(member(N,X),N>Y),L).

% Ex. 5
my_map(Pred,List,Result) :-
    Pred =.. [PredName,X,XRes],                 
    findall(XRes,(member(X,List),Y),Result),
    Y =.. [PredName,X,XRes].               

% Ex. 6
writelist([]).
writelist([nl|T]):-
	nl,!,
	writelist(T).
writelist([H|T]):-
	write(H),
	writelist(T).

:- dynamic(capital/2). 
capital(greece, athens).
capital(uk, london).

learn :-
    write('what country?'),
    read(N),
    writelist(['what is the capital of ',N,'?']),
    read(M),
    assert(capital(N,M)).

geography :-
    write('what country?'),
    read(N),
    (capital(N,M) ->
        writelist(['the capital of ',N,' is ',M,'.']);
        write('idk lol. do you know?'),
        read(Answer),
        (
            Answer=...
        )
        )