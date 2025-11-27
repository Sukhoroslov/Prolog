% 1a)
letter_map(x,t).
letter_map(g,o).
letter_map(l,p).
letter_map(o,m).
letter_map(p,a).
letter_map(q,e).
letter_map(r,i).
letter_map(y,z).
% 1b)
encrypt([],[]).
encrypt([H|T],[H1|T1]) :-
    letter_map(H,H1),
    encrypt(T,T1).

% 1c) I'd add a variable representing the type of mapping in the letter_map rules

% extra
conc([],L,L).
conc([H|T],L,[H|TL]) :-
    conc(T,L,TL).

del(X,[],[]).
del(X,[H|T],[H|TD]) :-
    del(X,T,TD).

% 2
/*
reverse([],[]).
reverse([H|T],E) :-
    conc(E,H,E1),
    reverse(T,E1).
 This is wrong */

reverse2([],[]).
reverse2([H|T],E) :-
    reverse2(T,RT),
    conc(RT,[H],E).

% 3a)
reverse_relation([],[],[]).
reverse_relation([H|T],A,B) :-
    H is [H1|T1],
    conc(A,H1,A1),
    conc(B,T1,B1),
    reverse_relation(T,A1,B1).


% 4a)
simmetric(L) :-
    append(X,X,L).

% 4b)
end_sublist(X,L) :-
    append(_,X,L).

% 4c)
twice_sublist(X,List) :-
    append(_,[X|Rest1],List),      
    append(X,Rest2,Rest1),
    append(_,[X|_],Rest2),   
    \+ (append(_,T,List),
        append(X,U,T),
        append(X,V,U),
        append(X,_,V)).

