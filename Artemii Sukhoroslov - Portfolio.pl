/*----------------------------------------------------------------------------
  CCS2200 Logic Programming
  Porfolio Submission Fall 2025
  Student ID: CSY24059
  Date of submission: 21.11.2025
----------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------
  EXERCISE NUMBER: 1
----------------------------------------------------------------------------*/

% Folder facts
folder(root1). folder(root2). folder(root3). folder(root4).
folder(proj3_1). folder(proj3_2). folder(proj3_3). folder(proj3_4).
folder(proj3_5). folder(proj3_6). folder(subpr3_2_1). folder(subpr3_2_2).
folder(subpr3_2_3). folder(subpr3_2_4). folder(cat3_2_4_1). folder(cat3_2_4_2).
folder(cat3_2_4_3). folder(subcat3_2_4_2_1). folder(subpr3_3_1).

% File facts
file(presentation1,pptx,133,date(25,10,2023)).
file(presentation2,pptx,148,date(25,10,2023)).
file(lab1,pl,12,date(1,11,2023)).
file(lab2,pl,8,date(25,10,2023)).
file(lab3,pl,15,date(16,11,2023)).
file(lab4,pl,11,date(8,11,2021)).
file(notes1,docx,757,date(25,10,2023)).
file(report1,pdf,99,date(25,10,2023)).
file(notes2,docx,77,date(25,10,2023)).
file(report2,pdf,252,date(25,10,2023)).

% Containment facts
contains(root3,proj3_1). contains(root3,proj3_2). contains(root3,proj3_3).
contains(root3,proj3_4). contains(root3,proj3_5). contains(root3,proj3_6).
contains(proj3_2,subpr3_2_1). contains(proj3_2,subpr3_2_2).
contains(proj3_2,subpr3_2_3). contains(proj3_2,subpr3_2_4).
contains(subpr3_2_4,cat3_2_4_1). contains(subpr3_2_4,cat3_2_4_2).
contains(subpr3_2_4,cat3_2_4_3). contains(cat3_2_4_2,subcat3_2_4_2_1).
contains(proj3_3,subpr3_3_1).
contains(proj3_1,presentation1). contains(proj3_1,lab1).
contains(subpr3_2_1,presentation2). contains(subpr3_2_3,notes1).
contains(subpr3_2_3,lab2). contains(cat3_2_4_1,report1).
contains(cat3_2_4_2,notes2). contains(cat3_2_4_2,report2).
contains(subcat3_2_4_2_1,lab3). contains(subpr3_3_1,lab4).

% Two files are in the same folder
samefolder(A,B,F) :- A \= B, contains(F,A), contains(F,B).

/*----------------------------------------------------------------------------
?- samefolder(notes2,report2,F).
F = cat3_2_4_2 ;
false.
----------------------------------------------------------------------------*/

% Files bigger than N kb
big(N,X) :- file(X,_,S,_), S > N.

/*----------------------------------------------------------------------------
?- big(100,X).
X = notes1 ;
X = report2 ;
false.
----------------------------------------------------------------------------*/

% Files of given type
oftype(T,X) :- file(X,T,_,_).

/*----------------------------------------------------------------------------
?- oftype(pl,X).
X = lab1 ;
X = lab2 ;
X = lab3 ;
X = lab4 ;
false.
----------------------------------------------------------------------------*/

% Files created between years Y1 and Y2 (inclusive)
between(Y1,Y2,X) :- file(X,_,_,date(_,_,Y)), Y >= Y1, Y =< Y2.

/*----------------------------------------------------------------------------
?- between(2023,2023,X).
X = presentation1 ;
X = presentation2 ;
X = lab1 ;
X = lab2 ;
X = lab3 ;
X = notes1 ;
X = report1 ;
X = notes2 ;
X = report2 ;
false.
----------------------------------------------------------------------------*/


/*----------------------------------------------------------------------------
  EXERCISE NUMBER: 2
----------------------------------------------------------------------------*/

% Basic logic gates
and(0,0,0). and(0,1,0). and(1,0,0). and(1,1,1).
or(0,0,0).  or(0,1,1). or(1,0,1).  or(1,1,1).
xor(0,0,0). xor(0,1,1). xor(1,0,1). xor(1,1,0).
not(0,1).   not(1,0).

full_adder(A,B,Ci,S,Co) :-
    xor(A,B,T1), xor(T1,Ci,S),
    and(T1,Ci,T2), and(A,B,T3), or(T3,T2,Co).

circuit(A2,A1,A0,B2,B1,B-B0,O1,O2,O3) :-
    full_adder(A0,B0,0,O1,C1),
    full_adder(A1,B1,C1,O2,C2),
    full_adder(A2,B2,C2,O3,_).

/*----------------------------------------------------------------------------
?- circuit(0,0,0,0,0,0,O1,O2,O3).
O1 = 0, O2 = 0, O3 = 0 ;
false.

?- circuit(0,0,1,0,0,1,O1,O2,O3).
O1 = 0, O2 = 1, O3 = 0 ;
false.

?- circuit(0,1,1,0,0,1,O1,O2,O3).
O1 = 0, O2 = 0, O3 = 1 ;
false.

?- circuit(1,0,1,1,1,1,O1,O2,O3).
O1 = 0, O2 = 0, O3 = 1 ;
false.
----------------------------------------------------------------------------*/

% Description: 3-bit adder (mod 8). If you give O1,O2,O3 as input and ask for A/B,
% Prolog backtracks through all 8 pairs that give the same sum mod 8.


/*----------------------------------------------------------------------------
  EXERCISE NUMBER: 3
----------------------------------------------------------------------------*/

% At least ten product/4 facts (laptops + books)
product(lenovo,856296,laptop,750).
product(dell,017856,laptop,820).
product(hp,842355,laptop,680).
product(apple,417289,laptop,1550).
product(asus,780923,laptop,900).
product(acer,768560,laptop,600).
product(1984,789523,book,25).
product(lord_of_flies,124865,book,30).
product(dune,742355,book,28).
product(war_and_peace,121212,book,35).

% At least five purchase/3 facts
purchase(user(alex),bought(lenovo,856296),date(10,5,2023)).
purchase(user(alex),bought(1984,789523),date(15,5,2023)).
purchase(user(maria),bought(hp,842355),date(2,8,2022)).
purchase(user(maria),bought(dune,742355),date(12,1,2023)).
purchase(user(john),bought(apple,417289),date(5,3,2024)).

% c) Recommend items of the same type (not the exact same product)
recommend(Buyer,buy(Brand,ID,Price)) :-
    purchase(user(Buyer),bought(BBrand,BID),_),
    product(BBrand,BID,Type,_),
    product(Brand,ID,Type,Price),
    (Brand \= BBrand ; ID \= BID).

/*----------------------------------------------------------------------------
?- recommend(alex,X).
X = buy(dell, 17856, 820) ;
X = buy(hp, 842355, 680) ;
X = buy(apple, 417289, 1550) ;
X = buy(asus, 780923, 900) ;
X = buy(acer, 768560, 600) ;
X = buy(lord_of_flies, 124865, 30) ;
X = buy(dune, 742355, 28) ;
X = buy(war_and_peace, 121212, 35) ;
false.
----------------------------------------------------------------------------*/

% d) Products bought by a buyer in a given year
products_in_year(Buyer,Year,bought(Brand,ID)) :-
    purchase(user(Buyer),bought(Brand,ID),date(_,_,Year)).

/*----------------------------------------------------------------------------
?- products_in_year(alex,2023,X).
X = bought(lenovo, 856296) ;
X = bought(1984, 789523) ;
false.
----------------------------------------------------------------------------*/

% e) All buyers & products bought in a given year
all_buys_year(Year,user(Buyer),bought(Brand,ID)) :-
    purchase(user(Buyer),bought(Brand,ID),date(_,_,Year)).

/*----------------------------------------------------------------------------
?- all_buys_year(2023,U,X).
U = alex, X = bought(lenovo, 856296) ;
U = alex, X = bought(1984, 789523) ;
U = maria, X = bought(dune, 742355) ;
false.
----------------------------------------------------------------------------*/


/*----------------------------------------------------------------------------
  EXERCISE NUMBER: 4
----------------------------------------------------------------------------*/

	% AND simplifications
	simplify_and(and(X,true),X).
	simplify_and(and(true,X),X).
	simplify_and(and(X,false),false).
	simplify_and(and(false,X),false).
	simplify_and(and(X,X),X).
	simplify_and(and(X,not(X)),false).
	simplify_and(and(not(X),X),false).
	simplify_and(Expr,Expr).

	% OR simplifications
	simplify_or(or(X,false),X).
	simplify_or(or(false,X),X).
	simplify_or(or(X,true),true).
	simplify_or(or(true,X),true).
	simplify_or(or(X,X),X).
	simplify_or(or(X,not(X)),true).
	simplify_or(or(not(X),X),true).
	simplify_or(Expr,Expr).

	% NOT simplifications
	simplify_not(not(true),false).
	simplify_not(not(false),true).
	simplify_not(not(not(X)),X).
	simplify_not(not(and(X,Y)),or(not(X),not(Y))).
	simplify_not(not(or(X,Y)),and(not(X),not(Y))).
	simplify_not(Expr,Expr).

	% Recursive traversal
	simplify(and(A,B),R) :- simplify(A,A1), simplify(B,B1), simplify_and(and(A1,B1),R).
	simplify(or(A,B),R)  :- simplify(A,A1), simplify(B,B1), simplify_or(or(A1,B1),R).
	simplify(not(A),R)   :- simplify(A,A1), simplify_not(not(A1),R).
	simplify(X,X).

	% Apply until fixed point
	full_simplify(E,R) :- simplify(E,T), T \= E, !, full_simplify(T,R).
	full_simplify(E,E).

/*----------------------------------------------------------------------------
?- full_simplify(and(x,and(true,x)),X).
X = x ;
false.

?- full_simplify(or(false,or(y,not(y))),X).
X = true ;
false.

?- full_simplify(not(and(z,not(z))),X).
X = true ;
false.

?- full_simplify(or(and(a,a),or(a,false)),X).
X = a ;
false.

?- full_simplify(not(not(or(false,b))),X).
X = b ;
false.

?- full_simplify(not(and(or(p,not(q)),and(not(p),q))),X).
X = true ;
false.
----------------------------------------------------------------------------*/
