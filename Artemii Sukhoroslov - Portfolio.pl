/*----------------------------------------------------------------------------
  CCS2200 Logic Programming
  Porfolio Submission Fall 2025
  Student ID: CSY24059
  Date of submission: 21.11.2025
----------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------
  EXERCISE NUMBER:  i.e. 1,2, etc.
----------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------
  PREDICATE: e.g. parent/2 (where /2 is the arity of the predicate)
  TEXTUAL DECRIPTION: i.e. a brief description of what each predicate does
  QUERIES & ANSWERS:
  Here you state the queries you used to test your program and
  you copy-paste the answers that Prolog provies to these queries, e.g.
  ? parent(zeus,X).
  X=athena;
  X=aphrodite,
  false
  ADDITIONAL COMMENTS: i.e. any additional comments about the exercise or 
  any textual answers requested by the exercise
----------------------------------------------------------------------------*/

% You write the Prolog code for each predicate here
% In code all comments should be line commens like this
% You do the same for every predicate for every exercise in the portfolio

% EXERCISE NUMBER: 1

% FACTS:
  
% Folder facts
folder(root1).
folder(root2).
folder(root3).
folder(root4).
folder(proj3_1).
folder(proj3_2).
folder(proj3_3).
folder(proj3_4).
folder(proj3_5).
folder(proj3_6).
folder(subpr3_2_1).
folder(subpr3_2_2).
folder(subpr3_2_3).
folder(subpr3_2_4).
folder(cat3_2_4_1).
folder(cat3_2_4_2).
folder(cat3_2_4_3).
folder(subcat3_2_4_2_1).
folder(subpr3_3_1).


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
contains(root3,proj3_1).
contains(root3,proj3_2).
contains(root3,proj3_3).
contains(root3,proj3_4).
contains(root3,proj3_5).
contains(root3,proj3_6).
contains(proj3_2,subpr3_2_1).
contains(proj3_2,subpr3_2_2).
contains(proj3_2,subpr3_2_3).
contains(proj3_2,subpr3_2_4).
contains(subpr3_2_4,cat3_2_4_1).
contains(subpr3_2_4,cat3_2_4_2).
contains(subpr3_2_4,cat3_2_4_3).
contains(cat3_2_4_2,subcat3_2_4_2_1).
contains(proj3_3,subpr3_3_1).
contains(proj3_1,presentation1).
contains(proj3_1,lab1).
contains(subpr3_2_1,presentation2).
contains(subpr3_2_3,notes1).
contains(subpr3_2_3,lab2).
contains(cat3_2_4_1,report1).
contains(cat3_2_4_2,notes2).
contains(cat3_2_4_2,report2).
contains(subcat3_2_4_2_1,lab3).
contains(subpr3_3_1,lab4).

% 4. Two files are in the same folder
samefolder(A,B,F) :-
    A \= B,
    contains(F,A),
    contains(F,B).

/*----------------------------------------------------------------------------
?- samefolder(notes2,report2,F).
F = cat3_2_4_2 .
----------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------
5. Query for files in a given folder
?- contains(cat3_2_4_2, X).
X = notes2 ;
X = report2 ;
false.
----------------------------------------------------------------------------*/

% 6. Files bigger than N kb
big(N,X) :-
    file(X,_,S,_),
    S > N.

/*----------------------------------------------------------------------------
?- big(100,X).
X = notes1 ;
X = report2 ;
false.
----------------------------------------------------------------------------*/

% 7. Files of given type
oftype(T,X) :-
    file(X,T,_,_).

/*----------------------------------------------------------------------------
?- oftype(pl,X).
X = lab1 ;
X = lab2 ;
X = lab3 ;
X = lab4 ;
false.
----------------------------------------------------------------------------*/

% 8. Files created between years Y1 and Y2 (inclusive)
between(Y1,Y2,X) :-
    file(X,_,_,date(_,_,Y)),
    Y >= Y1,
    Y =< Y2.

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



% ---------------------------------------------
% Part (a): At least ten product/4 facts
% ---------------------------------------------

product(lenovo,856296,laptop,750).
product(dell,017856,laptop,820).
product(hp,842355,laptop,680).
product(apple,417289,laptop,1550).
product(asus,780923,laptop,900).
product(acer,768560,laptop,600).

product(1984,777777,book,25).
product(lord of flies,888888,book,30).
product(dune,999999,book,28).
product(war and peace,121212,book,35).

% ---------------------------------------------
% Part (b): At least five purchase/3 facts
% ---------------------------------------------

purchase(user(alex),bought(lenovo,111111),date(10,5,2023)).
purchase(user(alex),bought(hobbit,777777),date(15,5,2023)).
purchase(user(maria),bought(hp,333333),date(2,8,2022)).
purchase(user(maria),bought(dune,999999),date(12,1,2023)).
purchase(user(john),bought(apple,444444),date(5,3,2024)).
purchase(user(john),bought(foundation,888888),date(22,3,2023)).

% ---------------------------------------------
% Part (c): Recommend items of the same type
% ---------------------------------------------

recommend(Buyer,buy(Brand,ID,Price)) :-
    purchase(user(Buyer),bought(BBrand,BID),_),
    product(BBrand,BID,Type,_),
    product(Brand,ID,Type,Price),
    (Brand \= BBrand ; ID \= BID).

% Example query:
% ?- recommend(alex,X).

% ---------------------------------------------
% Part (d): Products bought by a buyer in a given year
% ---------------------------------------------

products_in_year(Buyer,Year,bought(Brand,ID)) :-
    purchase(user(Buyer),bought(Brand,ID),date(_,_,Year)).

% Example query:
% ?- products_in_year(alex,2023,X).

% ---------------------------------------------
% Part (e): All buyers & products bought in a given year
% ---------------------------------------------

all_buys_year(Year,user(Buyer),bought(Brand,ID)) :-
    purchase(user(Buyer),bought(Brand,ID),date(_,_,Year)).

% Example query:
% ?- all_buys_year(2023,U,X).