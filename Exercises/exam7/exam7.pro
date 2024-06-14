panstwo('Polska').
panstwo('Francja').
panstwo('Włochy').
panstwo('Hiszpania').

miasto('Warszawa').
miasto('Kraków').
miasto('Paryż').
miasto('Rzym').
miasto('Wenecja').
miasto('Barcelona').
miasto('Madryt').

polozenie('Warszawa', 'Polska').
polozenie('Kraków', 'Polska').
polozenie('Paryż', 'Francja').
polozenie('Rzym', 'Włochy').
polozenie('Wenecja', 'Włochy').
polozenie('Barcelona', 'Hiszpania').
polozenie('Madryt', 'Hiszpania').

zabytek('Pałac w Wilanowie').
zabytek('Wawel').
zabytek('Sukiennice').
zabytek('Kościół Mariacki').
zabytek('Wieża Eiffla').
zabytek('Katedra Notre-Dame').
zabytek('Pałac Elizejski').
zabytek('Bazylika św. Pawła za Murami').
zabytek('Koloseum').
zabytek('Zamek Świętego Anioła').
zabytek('Bazylika św. Marka').
zabytek('Pałac Dożów').
zabytek('Sagrada Familia').
zabytek('Pałac Kryształowy').

gdzie('Pałac w Wilanowie', 'Warszawa').
gdzie('Wawel', 'Kraków').
gdzie('Sukiennice', 'Kraków').
gdzie('Kościół Mariacki', 'Kraków').
gdzie('Wieża Eiffla', 'Paryż').
gdzie('Katedra Notre-Dame', 'Paryż').
gdzie('Pałac Elizejski', 'Paryż').
gdzie('Bazylika św. Pawła za Murami', 'Rzym').
gdzie('Koloseum', 'Rzym').
gdzie('Zamek Świętego Anioła', 'Rzym').
gdzie('Bazylika św. Marka', 'Wenecja').
gdzie('Pałac Dożów', 'Wenecja').
gdzie('Sagrada Familia', 'Barcelona').
gdzie('Pałac Kryształowy', 'Madryt').

% 1.
% a) Jakie miasta znajduja sie w Hiszpanii?
/*
1 ?- polozenie(C, 'Hiszpania'), miasto(C).
C = 'Barcelona' ;
C = 'Madryt'.

*/

% b) W jakim panstwie jest Sagrada Familia?
/*
2 ?- gdzie('Sagrada Familia', C), polozenie(C, Country), panstwo(Country).
C = 'Barcelona',
Country = 'Hiszpania'.
*/

% c) Jakie zabytki mozna zwiedzac w panstwie, w ktorym znajduje sie Rzym?
/*
8 ?- polozenie('Rzym', Country), panstwo(Country), polozenie(City, Country), gdzie(Monument, City), zabytek(Monument).
Country = 'Włochy',
City = 'Rzym',
Monument = 'Bazylika św. Pawła za Murami' ;
Country = 'Włochy',
City = 'Rzym',
Monument = 'Koloseum' ;
Country = 'Włochy',
City = 'Rzym',
Monument = 'Zamek Świętego Anioła' ;
Country = 'Włochy',
City = 'Wenecja',
Monument = 'Bazylika św. Marka' ;
Country = 'Włochy',
City = 'Wenecja',
Monument = 'Pałac Dożów'.
*/

% d) Czy w bazie sa jakies zabytki zdefiniowane w Rosji?
/*
9 ?- polozenie(City, 'Rosja'), miasto(City), gdzie(Monument, City), zabytek(Monument).
false.
*/


% 2.
listProd([X], X).
listProd([X,Y|T], Prod) :-
  Z is X*Y,
  listProd([Z|T], Prod).

f(X, Y) :- Y is (X-2)/(X*X + 1).

iloczyn(X) :-
  numlist(1, 300, L1),
  maplist(f, L1, L2),
  listProd(L2, X), !.
/*
25 ?- iloczyn(X).
X = -0.0.
*/


% 3.
seq(1, 2) :- !.
seq(2, 3) :- !.
seq(N, X) :-
  N1 is N-1,
  N2 is N-2,
  seq(N1, Y1),
  seq(N2, Y2),
  X is Y1 + (Y2-1).
/*
31 ?- seq(1, X).
X = 2.

32 ?- seq(2, X). 
X = 3.

33 ?- seq(3, X). 
X = 4.

34 ?- seq(4, X). 
X = 6.

*/

% 4.
init2([_, _], []) :- !.
init2(L, R) :-
  reverse(L, L2),
  L2 = [_, _|T],
  reverse(T, R).
/*
40 ?- init2([1,2,3,4], X).
X = [1, 2].

41 ?- init2([1,2], X).     
X = [].

*/

% 5.
assign([], _).
assign([V|Vs], L1) :-
  select(V, L1, L2),
  assign(Vs, L2).

kwadrat :-
  Numbers = [1,2,3,4,5,6,7,8,9],
  Xs = [X11, X12, X13, X21, X22, X23, X31, X32, X33],
  assign(Xs, Numbers),
  Sum is X11 + X13 + X31 + X33,
  X11 + X13 + X31 + X33 =:= Sum,
  X11 + X12 + X21 + X22 =:= Sum,
  X21 + X22 + X31 + X32 =:= Sum,
  X12 + X13 + X22 + X23 =:= Sum,
  X22 + X23 + X32 + X33 =:= Sum,
  X12 + X21 + X23 + X32 =:= Sum,
  writeln(Xs), fail.

/*
50 ?- kwadrat.
[1,6,7,8,5,2,3,4,9]
[1,8,3,6,5,4,7,2,9]
[3,4,9,8,5,2,1,6,7]
[3,8,1,4,5,6,9,2,7]
[7,2,9,6,5,4,1,8,3]
[7,6,1,2,5,8,9,4,3]
[9,2,7,4,5,6,3,8,1]
[9,4,3,2,5,8,7,6,1]
false.

1    6    7

8    5    2

3    4    9
*/