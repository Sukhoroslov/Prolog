/*--------------------------------------------------------------
	LAB#1: Family Tree

	Patial Solution by P.Kefalas
	Rest of the Solution by A.Sukhoroslov
--------------------------------------------------------------*/

parent(kronos,demeter).
parent(kronos,hades).
parent(kronos,poseidon).
parent(kronos,zeus).
parent(kronos,hera).
parent(kronos,hestia).

parent(rhea,demeter).
parent(rhea,hades).
parent(rhea,poseidon).
parent(rhea,zeus).
parent(rhea,hera).
parent(rhea,hestia).

parent(demeter,persephone).

parent(zeus,persephone).
parent(zeus, ares).
parent(zeus, eileithyia).
parent(zeus,hebe).
parent(zeus, athena).
parent(zeus, aphrodite).
parent(zeus,apollo).
parent(zeus, artemis).
parent(zeus, hermes).
parent(zeus,dionysus).

parent(hera, ares).

male(kronos).
male(hades).
male(zeus).
male(poseidon).
male(ares).
male(apollo).
male(hermes).
male(dionysus).

female(rhea).
female(hera).
female(demeter).
female(hestia).
female(persephone).
female(hebe).
female(athena).
female(aphrodite).
female(artemis).
female(eileithyia).

father(X,Y) :-
	parent(X,Y),
	male(X).

not_father(X, Y) :- 
	\+ father(X,Y).

mother(X,Y) :-
	parent(X,Y),
	female(X).

not_mother(X, Y) :- 
	\+ mother(X,Y).

sister(X,Y) :-
	father(J,X),
	female(X),
	father(J,Y),
 X \= Y,
	mother(I,X),
	mother(I,Y).

step_sister(X,Y) :-
	female(X),
	parent(I,X),
	parent(I,Y),
	parent(J,X),
 X \= Y,
	\+ parent(J,Y).

brother(X,Y) :-
	father(J,X),
	male(X),
	father(J,Y),
 X \= Y,
	mother(I,X),
	mother(I,Y).

step_broter(X,Y) :-
	male(X),
	parent(I,X),
	parent(I,Y),
 X \= Y,
	parent(J,X),
	\+ parent(J,Y).

grandparent(X,Y) :-
	parent(J,Y),
	parent(X,J).

grandfather(X,Y) :-
	grandparent(X,Y),
	male(X).


grandmother(X,Y) :-
	parent(X,Y),
	female(X).

ancestor(X,Y) :-
    parent(X,Y).                         

ancestor(X,Y) :-
    parent(I,Y),
    ancestor(X,I).                     

