% facts

rodzic(ola,max).     % parent  P ~ K
rodzic(tomek,max).
rodzic(tomek,lila).
rodzic(max,ania).
rodzic(max,kasia).
rodzic(kasia,radek).

kobieta(ola).        % woman  W
kobieta(lila).
kobieta(kasia).
kobieta(ania).

mezczyzna(tomek).    % man  M
mezczyzna(max).
mezczyzna(radek).

% rules

matka(X,Y) :-        % mother(X,Y)  M ~ K
  rodzic(X,Y),
  kobieta(X).

ojciec(X,Y) :-       % father(X,Y)  F ~ K
  rodzic(X,Y),
  mezczyzna(X).

/*
Relations:

parent  P ~ K

Properties:

woman  W
man    M

Predicates:

mother(X,Y)  M ~ K
father(X,Y)  F ~ K
*/

% 8.1.1
siostra(X, Y) :-
  kobieta(X),
  rodzic(P, X),
  rodzic(P, Y),
  X \= Y.
/*
5 ?- siostra(ola, lila).
false.

6 ?- siostra(lila, max).
true.

7 ?- siostra(lila, lila).
false.
*/

% Task 1.1
/*
12 ?- siostra(S, R).
S = lila,
R = max ;
S = kasia,
R = ania ;
S = ania,
R = kasia.
*/

% Task 1.2
siostra2(X, Y) :-
  X \= Y,
  kobieta(X),
  rodzic(P, X),
  rodzic(P, Y).
/*
13 ?- siostra2(S, R).
false.
*/

% 8.1.2
para(X, Y) :-
  kobieta(X),
  mezczyzna(Y),
  rodzic(X, C),
  rodzic(Y, C).
/*
1 ?- para(X, Y)
.
X = ola,
Y = tomek ;
false.
*/

% 8.1.3
brat(X,Y) :- 
  mezczyzna(X),
  rodzic(P, X),
  rodzic(P, Y),
  X \= Y.
/*
1 ?- brat(max, lila).
true.

2 ?- brat(max, max).  
false.

3 ?- brat(radek, max). 
false.
*/

% 8.1.4
rodzina(X, Y, Z1, Z2) :- 
  mezczyzna(X),
  kobieta(Y),
  rodzic(X, Z1),
  rodzic(X, Z2),
  rodzic(Y, Z1),
  rodzic(Y, Z2),
  Z1 \= Z2.
/*
6 ?- rodzina(M, T, D1, D2). 
false.
*/

% 8.2
rodzice(X) :-
  ojciec(F, X),
  matka(M, X),
  write('ojciec: '), writeln(F),
  write('matka: '), writeln(M), !.

rodzice(X) :-
  ojciec(F, X),
  write('ojciec: '), writeln(F), !.
  
rodzice(X) :-
  matka(M, X),
  write('matka: '), writeln(M), !.
  
rodzice(_) :-
  writeln('brak danych').
/*
7 ?- rodzice(max).
ojciec: tomek
matka: ola
true.

8 ?- rodzice(lila).
ojciec: tomek
true.

9 ?- rodzice(radek).
matka: kasia
true.

10 ?- rodzice(ola).
brak danych
true.
*/

% 8.3.1
/*
X is the descendant of Y.

X <- Y
X <- Z <- Y
 \__/ \__/

X <- ... <- Y
*/
potomek(X, Y) :- rodzic(Y, X).
potomek(X, Y) :- rodzic(Y, Z), potomek(X, Z).
/*
12 ?- potomek(ola, tomek).
false.

13 ?- potomek(radek, tomek).
true ;
false.
*/

/* Task 2

1. Na ile sposobow mozna okreslic regule potomek? Na 2.

2. Podaj wszystkie mozliwe rozwiazania dla reguly potomek.

3. Are the rules descendant(X,Y) and descendant2(X,Y) equivalent?
*/

potomek2(X, Y) :- rodzic(Y, X).
potomek2(X, Y) :- rodzic(Z, X), potomek2(Z, Y).
/*
17 ?- potomek(X, Y).   18 ?- potomek2(X, Y).
X = max,               X = max,
Y = ola ;              Y = ola ;
X = max,               X = max,
Y = tomek ;            Y = tomek ;
X = lila,              X = lila,
Y = tomek ;            Y = tomek ;
X = ania,              X = ania,
Y = max ;              Y = max ;
X = kasia,             X = kasia,
Y = max ;              Y = max ;
X = radek,             X = radek,
Y = kasia ;            Y = kasia ;
X = ania,              X = ania,
Y = ola ;              Y = ola ;
X = kasia,             X = ania,
Y = ola ;              Y = tomek ;
X = radek,             X = kasia,
Y = ola ;              Y = ola ;
X = ania,              X = kasia,
Y = tomek ;            Y = tomek ;
X = kasia,             X = radek,
Y = tomek ;            Y = max ;
X = radek,             X = radek,
Y = tomek ;            Y = ola ;
X = radek,             X = radek,
Y = max ;              Y = tomek ;
false.                 false.
*/

% 8.3.2
potomkowie(X) :-
  (potomek(P, X),
  writeln(P), fail) ;
  true.
/*
24 ?- potomkowie(tomek).
max
lila
ania
kasia
radek
true.

25 ?- potomkowie(ola).   
max
ania
kasia
radek
true.

26 ?- potomkowie(max). 
ania
kasia
radek
true.

27 ?- potomkowie(kasia). 
radek
true.
*/