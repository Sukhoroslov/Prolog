figure(1, middle(triangle, square)).
figure(2, middle(circle, triangle)).
figure(3, middle(square, circle)).
figure(4, middle(square, square)).
figure(5, middle(square, triangle)).
figure(6, middle(triangle, circle)).
figure(7, middle(circle, square)).
figure(8, middle(triangle, triangle)).

relation(middle(Shape1, Shape2), middle(Shape2, Shape1), inverse).

relation(middle(Shape1, _), middle(Shape1, _), ssi).
relation(middle(_, Shape2), middle(_, Shape2), sso).
relation(middle(Shape1, Shape1), middle(Shape2, Shape2), copy).

analogy(X, Y, A, B, R) :-
    figure(X, SX),
    figure(Y, SY),
    relation(SX, SY, R),
    figure(A, SA),
    figure(B, SB),
    relation(SA, SB, R).
