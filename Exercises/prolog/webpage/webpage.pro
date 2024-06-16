% rodzina.pro

rodzic(ola,max).
rodzic(tomek,max).
rodzic(tomek,lila).
rodzic(max,ania).
rodzic(max,kasia).
rodzic(kasia,radek).
 
kobieta(ola).
kobieta(lila).
kobieta(kasia). 
kobieta(ania).
 
mezczyzna(tomek).
mezczyzna(max).
mezczyzna(radek).
 
matka(X,Y) :-
  rodzic(X,Y),
  kobieta(X).
 
ojciec(X,Y) :-
  rodzic(X,Y),
  mezczyzna(X).

% 1.
potomek(1, X, Y) :-
  rodzic(Y, X).

potomek(N, X, Y) :-
  M is N-1,
  rodzic(Y, Z),
  potomek(M, X, Z).
/*
15 ?- potomek(2, ola, kasia). 
false.

16 ?- potomek(2, kasia, ola). 
true.
*/

% b)
potomkowie(N, X) :-
  potomek(N, Y, X),
  writeln(Y),
  fail.
/*
49 ?- potomkowie(2, tomek). 
ania
kasia
false.

50 ?- potomkowie(1, ola).   
max
false.
*/

% 2.
sum([], 0).
sum(L, N) :- acc(L, 0, N).

acc([], A, A).
acc([H|T], A, N) :-
  A1 is A + H,
  acc(T, A1, N).
/*
57 ?- sum([1,2,3,4], N).
N = 10.

58 ?- sum([1,2,3,4,34], N). 
N = 44.

*/

% 3.
% a)
cia2ele(X) :-
  member(A, X),
  member(B, X),
  write('('), write(A), tab(1), write(B), writeln(')'),
  fail.
/*
73 ?- cia2ele([1,2,3]).
(1 1)
(1 2)
(1 3)
(2 1)
(2 2)
(2 3)
(3 1)
(3 2)
(3 3)
false.
*/

% b)
pod2ele(X) :-
  member(A, X),
  member(B, X),
  A @< B,
  write('('), write(A), tab(1), write(B), writeln(')'),
  fail.
/*
78 ?- pod2ele([1,2,3]).
(1 2)
(1 3)
(2 3)
false.
*/

% 4.
printList(L, N) :- printList(L, N, N).

printList([], _, _).
printList([H|T], N, 1) :- write(H), nl, printList(T, N, N), !.
printList([H|T], N, M) :-
  M1 is M - 1,
  write(H), tab(1),
  printList(T, N, M1).
/*
83 ?- printList([1,2,3,4], 2).
1 2
3 4
true.

84 ?- printList([1,2,3,4,3,4,5,5], 3). 
1 2 3
4 3 4
5 5
true.

*/

printSquare(L) :-
  length(L, N),
  A is ceiling(sqrt(N)),
  printList(L, A).
/*
102 ?- printSquare([1,2,3,4,3,4,5,5]).
1 2 3
4 3 4
5 5
true.

103 ?- printSquare([1,2,3,4,3,4,5,5, 0, 9, 1]). 
1 2 3 4
3 4 5 5
0 9 1
true.
*/