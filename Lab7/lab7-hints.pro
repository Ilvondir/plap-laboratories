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

/*
https://pl.wikipedia.org/wiki/Predykat
*/

% 7.1

% operator and

/*
1 ?- true, true.
true.

2 ?- false, true.
false.

3 ?- true, false.
false.

4 ?- false, false.
false.
*/

% operator or

/*
1 ?- true; true.
true .

2 ?- true; true.
true ;
true.

3 ?- false; true.
true.

4 ?- true; false.
true .

5 ?- true; false.
true ;
false.

6 ?- false; false.
false.
*/

predykat1 :- true.  % mozna zmienic na false
predykat2 :- true.  % mozna zmienic na false

% zamiast uzywac operatora ;

lub :- predykat1 ; predykat2.

/*
1 ?- lub.
true ;
true.
*/

% przewaznie bedziemy robic:

lub2 :- predykat1.
lub2 :- predykat2.

/*
2 ?- lub2.
true ;
true.
*/

% 7.1.1

/*
Paste here the solution from the console.
*/

% 7.1.9

% G -> P -> K (man)

% 7.2 *

/*
Place the solution in a separate file, for example, lab7_2.pro
*/

% 7.3

/*
Copy knowledge database from the site: http://www.balois.pl/jipp/help/
*/

/*
Properties:

country   C
city      T
monument  M

Relations:

location  T ~ C
where     M ~ T
next      C1 ~ C2
*/

% 7.3.6

% solution here

/* Task 1

Dodaj dodatkowo na dwa sposoby regule sasiad i sasiad2 i wykorzytaj je w zapytaniach.
*/

silnia(0, 1) :- !.
silnia(N, S) :-
    N1 is N - 1,
    silnia(N1, S1),
    S is N * S1.
    
