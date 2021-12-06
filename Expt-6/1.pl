parent(usha, devendra).
parent(usha, kamlesh).
parent(dilip, devendra).
parent(dilip, kamlesh).
parent(devendra, yash).
parent(alpa, yash).

female(usha).
female(alpa).
female(sayali).
male(devendra).
male(yash).
male(dilip).
male(kamlesh).

mother(X, Y):- parent(X, Y), female(X).
father(X, Y):- parent(X, Y), male(X).

son(X, Y):- parent(Y, X), male(X).
daughter(X, Y):- parent(Y, X), female(X).

grandfather(X, Y):- parent(X, A), parent(A, Y), male(X).
grandmother(X, Y):- parent(X, A), parent(A, Y), female(X).

sister(X, Y):- parent(A, X), parent(A, Y), female(X), X \= Y.
brother(X, Y):- parent(A, X), parent(A, Y), male(X), X \= Y.

aunt(X, Y):- sister(X, Z), parent(Z, Y).
uncle(X, Y):- brother(X, Z), parent(Z, Y).

predecessor(X, Y) :- parent(X, Y).
predecessor(X, Y) :- parent(X, A),predecessor(A, Y).

successor(X, Y):- son(Y, X).
successor(X, Y):- daughter(Y, X).
successor(X, Y):- son(A, X), successor(A, Y).
successor(X, Y):- daughter(A, X), successor(A, Y).