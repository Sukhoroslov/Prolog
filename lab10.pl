/*--------------------------------------------------------------
	LAB#10: GRAPHS

	VARIOUS SEARCHES by P.Kefalas
--------------------------------------------------------------*/
/*--------------------------------------------------------------
  REPRESENTATION OF NODES AND LINKS IN UNDIRECTED GRAPH
--------------------------------------------------------------*/

link(a, b).
link(a, d).
link(b, c).
link(b, e).
link(d, e).
%... put more here

next(X, Y) :- link(X, Y).
next(X, Y) :- link(Y, X).


/*--------------------------------------------------------------
  NAIVE SEARCH (No LOOP)
--------------------------------------------------------------*/

path(Node, FinalNode, [Node, FinalNode]):-
	next(Node, FinalNode).
path(Node, FinalNode, [Node | RestRoute]):-
	next(Node, SomeNextNode),
	path(SomeNextNode, FinalNode, RestRoute).

/*--------------------------------------------------------------
  SEARCH WITH LOOP CHECK
--------------------------------------------------------------*/


path_loopcheck(InitialNode, FinalNode, Route):-
	path_loopcheck(InitialNode, FinalNode, [InitialNode], Route).

path_loopcheck(Node, FinalNode, _, [Node, FinalNode]) :-
	next(Node, FinalNode).
path_loopcheck(Node, FinalNode, VisitedNodes, [Node | RestRoute]) :-
	next(Node, SomeNextNode),
	not(member(SomeNextNode, VisitedNodes)),
	path_loopcheck(SomeNextNode, FinalNode, [SomeNextNode|VisitedNodes], RestRoute).


/*--------------------------------------------------------------
  SEARCH WITH LOOP CHECK (WITH ACCUMULATING PARAMETER)
--------------------------------------------------------------*/


path_loopcheck_alt(InitialNode, FinalNode, Route) :-
	path_loopcheck_alt(InitialNode, FinalNode, [InitialNode], Route).

path_loopcheck_alt(Node, FinalNode, Route, [FinalNode|Route]):-
	next(Node, FinalNode).
path_loopcheck_alt(Node, FinalNode, VisitedNodes, Route) :-
	next(Node, SomeNextNode),
	not(member(SomeNextNode, VisitedNodes)),
	path_loopcheck_alt(SomeNextNode, FinalNode, [SomeNextNode|VisitedNodes], Route).



/*--------------------------------------------------------------
  SEARCH WITH POSITIVE AND NEGATIVE CONSTRAINTS
--------------------------------------------------------------*/

positive_constraint(Path):-
	member(b, Path),
	member(g, Path).

negative_constraint(Path):-
	member(e, Path);
	member(i, Path).

path_constraint(InitialNode, FinalNode, Route) :-
	path_constraint(InitialNode, FinalNode, [InitialNode], Route).

path_constraint(Node, FinalNode, Route, [FinalNode|Route]):-
	next(Node, FinalNode),
	positive_constraint([FinalNode|Route]).
path_constraint(Node, FinalNode, VisitedNodes, Route):-
	next(Node, SomeNextNode),
	not(member(SomeNextNode, VisitedNodes)),
	not(negative_constraint([SomeNextNode|VisitedNodes])),
	path_constraint(SomeNextNode, FinalNode, [SomeNextNode|VisitedNodes], Route).


/*--------------------------------------------------------------
  REPRESENTATION OF NODES AND LINKS IN WEIGHTED GRAPH
--------------------------------------------------------------*/

link(a,b,2).
link(a,d,9).
link(b,c,5).
link(b,e,7).
link(d,e,1).
%... put more here


/*--------------------------------------------------------------
  SEARCH IN A WEIGHTED GRAPH
--------------------------------------------------------------*/

path_weight(InitialNode, FinalNode, Route, Cost):-
	path_weight(InitialNode, FinalNode, [InitialNode], Route, Cost).

path_weight(Node, FinalNode, Route, [FinalNode|Route], Cost) :-
	next(Node, FinalNode, Cost).
path_weight(Node, FinalNode, VisitedNodes, Route, TotalCost):-
	next(Node, NextNode, Cost),
	not(member(NextNode, VisitedNodes)),
	path_weight(NextNode, FinalNode, [NextNode|VisitedNodes], Route, RestCost),
	TotalCost is RestCost + Cost.


/*--------------------------------------------------------------
  My work
--------------------------------------------------------------*/

link(baker_street, great_portland_street,2).
link(great_portland_street, euston,3).
link(euston, barbican,4).
link(barbican, moorgate,5).

link(old_street, moorgate,2).
link(moorgate, bank,3).

link(warren_street, kings_cross,4).
link(warren_street, goodge_street,5).
link(goodge_street, tottenham_court_road,2).
link(tottenham_court_road, leicester_square,3).
link(leicester_square, charing_cross,4).

link(oxford_circus, tottenham_court_road,5).
link(tottenham_court_road, holborn,2).
link(holborn, chancery_lane,3).
link(chancery_lane, st_pauls,4).
link(st_pauls, bank,5).

link(kings_cross, russell_square,2).
link(russell_square, holborn,3).
link(holborn, covent_garden,4).
link(covent_garden, leicester_square,5).
link(leicester_square, piccadilly_circus,2).
link(piccadilly_circus, green_park,3).

link(warren_street, oxford_circus,4).
link(oxford_circus, green_park,5).

link(oxford_circus, piccadilly_circus,2).

next(X, Y, Z) :- link(X, Y, Z).
next(X, Y, Z) :- link(Y, X, Z).

colour(red, oxford_circus).
colour(red, tottenham_court_road).
colour(red, holborn).
colour(red, chancery_lane).
colour(red, st_pauls).
colour(red, bank).

colour(yellow, baker_street).
colour(yellow, great_portland_street).
colour(yellow, euston).
colour(yellow, barbican).
colour(yellow, moorgate).

colour(black, old_street).
colour(black, moorgate).
colour(black, bank).

colour(brown, warren_street).
colour(brown, goodge_street).
colour(brown, tottenham_court_road).
colour(brown, leicester_square).
colour(brown, charing_cross).
colour(brown, kings_cross).

colour(purple, kings_cross).
colour(purple, russell_square).
colour(purple, holborn).
colour(purple, covent_garden).
colour(purple, leicester_square).
colour(purple, piccadilly_circus).
colour(purple, green_park).

colour(orange, oxford_circus).
colour(orange, piccadilly_circus).

colour(light_blue, warren_street).
colour(light_blue, oxford_circus).
colour(light_blue, green_park).


line(Colour,Stations) :-
    findall(Station,colour(Colour,Station),Stations).

in_which_line(Line,Station) :-
    colour(Line,Station).

travel(InitialNode, FinalNode, Route):-
	travel(InitialNode, FinalNode, [InitialNode], Route).

travel(Node, FinalNode, _, [Node, FinalNode]) :-
	next(Node, FinalNode).
travel(Node, FinalNode, VisitedNodes, [Node | RestRoute]) :-
	next(Node, SomeNextNode),
	not(member(SomeNextNode, VisitedNodes)),
	travel(SomeNextNode, FinalNode, [SomeNextNode|VisitedNodes], RestRoute).

travel_time(InitialNode, FinalNode, Route, Cost):-
	travel_time(InitialNode, FinalNode, [InitialNode], Route, Cost).

travel_time(Node, FinalNode, Route, [FinalNode|Route], Cost) :-
	next(Node, FinalNode, Cost).
travel_time(Node, FinalNode, VisitedNodes, Route, TotalCost):-
	next(Node, NextNode, Cost),
	not(member(NextNode, VisitedNodes)),
	travel_time(NextNode, FinalNode, [NextNode|VisitedNodes], Route, RestCost),
	TotalCost is RestCost + Cost.
