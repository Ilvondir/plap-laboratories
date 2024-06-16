kobieta(ola).
kobieta(lila).
kobieta(kasia).
kobieta(ania).
kobieta(ewa).

mezczyzna(tomek).
mezczyzna(adam).
mezczyzna(radek).
mezczyzna(karol).
mezczyzna(wojtek).
mezczyzna(artur).

% najpierw matka potem dziecko
matka(ola, lila).
matka(ola, kasia).
matka(lila, ania).
matka(lila, karol).
matka(kasia, wojtek).

% najpierw ojciec, potem dziecko
ojciec(tomek, lila).
ojciec(tomek, kasia).
ojciec(adam, ania).
ojciec(adam, karol).
ojciec(radek, wojtek).

adres(ola, krakow, kwiatowa).
adres(tomek, krakow, kwiatowa).
adres(lila, krakow, wiosenna).
adres(karol, krakow, wiosenna).
adres(artur, krakow, wiosenna).
adres(kasia, wieliczka, kwiatowa).
adres(radek, wieliczka, kwiatowa).
adres(wojtek, wieliczka, kwiatowa).
adres(ania, krakow, wiosenna).



% -------------------------------------------------------------------------------------------


% 1.
% a)
/*
1 ?- matka(M, ania).
M = lila.

2 ?- ojciec(M, ania). 
M = adam.
*/

% b)
/*
3 ?- ojciec(karol, D). 
false.
*/

% c)
/*
4 ?- matka(lila, D).
D = ania ;
D = karol.
*/

% d)
/*
5 ?- adres(O, M, kwiatowa).
O = ola,
M = krakow ;
O = tomek,
M = krakow ;
O = kasia,
M = wieliczka ;
O = radek,
M = wieliczka ;
O = wojtek,
M = wieliczka.
*/

% 2. 
rodzic(X, Y) :-
  ojciec(X, Y);
  matka(X, Y).

dziadek(X, Y) :-
  mezczyzna(X),
  ojciec(X, C),
  rodzic(C, Y), !.
/*
24 ?- dziadek(tomek, ania).
true.
*/

siostra(X, Y) :-
  kobieta(X),
  rodzic(P, X),
  rodzic(P, Y),
  X \= Y, !.

/*
30 ?- siostra(lila, kasia). 
true.

33 ?- siostra(karol, ania). 
false.
*/

% 3.
seq(1, 0) :- !.
seq(2, 2) :- !.
seq(N, X) :-
  N1 is N-1,
  N2 is N-2,
  seq(N1, Y1),
  seq(N2, Y2),
  X is Y1 + 2*Y2.
/*
24 ?- seq(1, X).   
X = 0.

25 ?- seq(2, X). 
X = 2.

26 ?- seq(3, X). 
X = 2.

27 ?- seq(4, X). 
X = 6.
*/

% 4.
maxList([X], X).

maxList([X,Y|T], M) :-
  X >= Y,
  maxList([X|T], M).

maxList([X,Y|T], M) :-
  X < Y,
  maxList([Y|T], M).
/*
33 ?- maxList([1,2,4,5,6,9,-1,2], M).
M = 9 ;
false.

*/

% 5.
assign([], _).
assign([V|Vs], L1) :-
  select(V, L1, L2),
  assign(Vs, L2).

gwiazda :-
  X = [X11, X21, X22, X23, X24, X31, X32, X41, X42, X43, X44, X51],
  Numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
  assign(X, Numbers),
  X11 + X22 + X31 + X41 =:= 26,
  X11 + X23 + X32 + X44 =:= 26,
  X21 + X22 + X23 + X24 =:= 26,
  X41 + X42 + X43 + X44 =:= 26,
  X21 + X31 + X42 + X51 =:= 26,
  X24 + X32 + X43 + X51 =:= 26,
  writeln(X), fail.
/*
5 ?- gwiazda.
[1,2,4,12,8,10,6,11,5,3,7,9]
[1,2,6,10,8,12,4,7,3,5,11,9]
[1,2,7,11,6,8,5,10,4,3,9,12]
[1,2,7,12,5,10,4,8,3,6,9,11]
[1,2,8,9,7,11,4,6,3,5,12,10]
[1,2,8,10,6,12,4,5,3,7,11,9]
[1,2,9,8,7,10,12,6,11,4,5,3]
[1,2,9,12,3,6,8,10,7,4,5,11]
[1,2,10,5,9,11,8,4,7,3,12,6]
[1,2,10,9,5,7,12,8,11,3,4,6]
[1,2,10,11,3,8,5,7,4,6,9,12]
[1,2,12,5,7,10,9,3,8,4,11,6]
[1,2,12,8,4,10,6,3,5,7,11,9]
[1,2,12,9,3,6,11,7,10,4,5,8]
...

      1
2   4   12  8
  10      6
11  5   3   7
      9
*/
