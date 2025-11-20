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
