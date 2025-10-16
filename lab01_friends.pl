/*--------------------------------------------------------------
	LAB#1: Social Network

	Partial solution by P.Kefalas
	Rest of the Solution by A.Sukhoroslov
--------------------------------------------------------------*/

follows(ilias, petros).
follows(petros, ilias).
follows(petros, demos).
follows(petros, sofia).
follows(nikos, petros).
follows(nikos, ilias).
follows(demos, sofia).
follows(demos, petros).
follows(ilias, katerina).
follows(katerina, petros).
follows(sofia, helen).
follows(helen, sofia).

belongs_to(a, ilias).
belongs_to(a ,petros).
belongs_to(b, ilias).
belongs_to(b, demos).
belongs_to(b, nikos).
belongs_to(c, petros).
belongs_to(c, katerina).
belongs_to(c, nikos).
belongs_to(c,sofia).

male(petros).
male(ilias).
male(demos).
male(nikos).
female(sofia).
female(helen).
female(katerina).

same_group(X,Y) :-
	belongs_to(A,X),
	belongs_to(A,Y).

friends(X,Y) :-
	follows(Y,X),
	follows(X,Y).

friends_same_gender(X,Y) :-
	follows(Y,X),
	follows(X,Y),
	male(X),
	male(Y).

friends_same_gender(X,Y) :-
	follows(Y,X),
	follows(X,Y),
	female(X),
	female(Y).


recommend(X,Y) :-
	friend(I,X),
	friend(X,I).
/*--------------------------------------------------------------
relationship_degree/3: relationship_degree(+/-,+/-,+/-)
1st argument: A user X
2nd argument: A user Y
3rd argument: the degree of their relationship
Predicate succeeds if X and Y are not friends
but have a common friend.
--------------------------------------------------------------*/
