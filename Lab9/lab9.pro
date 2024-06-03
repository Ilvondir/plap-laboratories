test(X, X).

/*
1 ?- test(5, X).
X = 5.

2 ?- test(X, 6).
X = 6.

3 ?- test(5, 5).
true.

4 ?- test(5, 6).
false.
*/

test2(X, Y) :- X = Y.

/*
6 ?- test2(5, X).
X = 5.

7 ?- test2(X, 6).
X = 6.

8 ?- test2(5, 5).
true.

9 ?- test2(5, 6).
false.
*/

% 9.1
/*
W pliku listy.pl zdefiniuj predykat take/3 pobierajacy N poczatkowych elementow z listy. Argumenty:

liczba naturalna,
lista poczatkowa,
lista wynikowa.
Uwaga: Nalezy rozpatrzec dwa warunki koncowe: pobieranie z pustej listy i pobieranie 0 elementow.
*/

take(_, [], []) :- !.
take(0, _, []) :- !.
take(N, [H|T], [H|L]) :-
  M is N-1,
  take(M, T, L).

/*
11 ?- take(3, [], X).
X = [].

12 ?- take(0, [2, 4, 6, 7, 99], X).
X = [].

13 ?- take(2, [2, 4, 6, 7, 99], X).
X = [2, 4].

14 ?- take(4, [2, 4, 6, 7, 99], X).
X = [2, 4, 6, 7].

15 ?- take(1, [2, 4, 6, 7, 99], X).
X = [2].
*/
/*
16 ?- take(2, [a, b, c], X).
X = [a, b].

1. Przebieg z góry do dołu                       2. Przebieg z dołu do gory

* 1 take(2, [a, b, c, d], X) =>                  * 1 take(2, [a, b, c, d], X) => X = [a, b]
  N = 2                                            N = 2                                       
  [H|T] = [a, b, c, d] => H = a, T = [b, c, d]     [H|T] = [a, b, c, d] => H = a, T = [b, c, d]
  X := [H|L] = [a|L] =                             X := [H|L] = [a|L] = [a|[b]] = [a, b]
  :-                                               :-
  M is 2 - 1                                       M is 2 - 1
  2 take(1, [b, c, d], L) =>                       2 take(1, [b, c, d], L) => L = [b]

* 2 take(1, [b, c, d], L) =>                     * 2 take(1, [b, c, d], L) => L = [b]
  N = 1                                            N = 1
  [H|T] = [b, c, d] => H = b, T = [c, d]           [H|T] = [b, c, d] => H = b, T = [c, d]      
  L := [H,L] = [b|L] =                             L := [H,L] = [b|L] = [b|[]] = [b]                       
  :-                                               :-
  M is 1-1                                         M is 1-1                                    
  3 take(0, [c, d], L) =>                          3 take(0, [c, d], L) => L = []

* 3 take(0, [c, d], L) =>                        * 3 take(0, [c, d], L) => L = []
  0 = 0                                            0 = 0                                       
  _ = [c, d]                                       _ = [c, d]                                  
  L := []                                          L := []


[trace] 17 ?- take(2, [a, b, c, d], X).
   Call: (12) take(2, [a, b, c, d], _4992) ? creep
   Call: (13) _6370 is 2+ -1 ? creep
   Exit: (13) 1 is 2+ -1 ? creep
   Call: (13) take(1, [b, c, d], _6362) ? creep
   Call: (14) _8818 is 1+ -1 ? creep
   Exit: (14) 0 is 1+ -1 ? creep
   Call: (14) take(0, [c, d], _8810) ? creep
   Exit: (14) take(0, [c, d], []) ? creep
   Exit: (13) take(1, [b, c, d], [b]) ? creep
   Exit: (12) take(2, [a, b, c, d], [a, b]) ? creep
X = [a, b].
*/

% 9.3
/*
W pliku listy.pl zdefiniuj predykat init/2 pobierajacy z listy L wszystkie elementy poza ostatnim. Pierwszym argumentem predykatu jest lista wejsciowa, a drugim wynik. Podaj dwie definicje tego predykatu:

z zastosowaniem predykatu reverse;
*/

/*
L          R          T        I
[a,b,c] -> [c,b,a] -> [b,a] -> [a, b]
*/

init2(L, I) :-
  reverse(L, R),
  R = [_|T],
  reverse(T, I).

/*
1 ?- init2([1, 2, 3], X).
X = [1, 2].
*/

init(L, I) :-
  reverse(L, [_|T]),
  reverse(T, I).

/*
3 ?- init2([1, 2, 3], X).
X = [1, 2].
*/


% 9.4
/*
W pliku listy.pl zdefiniuj predykat middle/2 pobierajacy z listy L wszystkie elementy poza pierwszym i ostatnim. Pierwszym argumentem predykatu jest lista wejsciowa, a drugim wynik.
*/

/*
L               T            M
[a, b, c, d] -> [b, c, d] -> [b, c]
*/

middle2(L, M) :-
  L = [_|T],
  init(T, M).
  
/*
2 ?- middle2([a,b,c,d], X).
X = [b, c].
*/

middle([_|T], M) :-
  init(T, M).
  
/*
1 ?- middle([a, b, c, d], X).
X = [b, c].

3 ?- middle([a, b], X).
X = [].

4 ?- middle([a], X).
false.
*/
  
% 9.2
drop(_, [], []) :- !.
drop(0, L, L) :- !.
drop(N, [_|L], X) :- 
  M is N-1,
  drop(M, L, X).
/*
33 ?- drop(12, [], X).             
X = [].

34 ?- drop(0, [a, b, c], X). 
X = [a, b, c].

35 ?- drop(2, [a, b, c], X). 
X = [c].
*/

% 9.3.2
length_([], 0).
length_([_|T], L) :-
	length_(T, X),
	L is X+1.

init_take(L, I) :-
  length_(L, N),
  take(N-1, L, I).
/*
41 ?- init_take([1,2,3], X).
X = [1, 2].

42 ?- init_take([1,2,3, 6], X). 
X = [1, 2, 3].
*/

% 9.5
split(L, R) :-
  length_(L, N),
  Middle is N//2,
  take(Middle, L, R).

split(L, R) :-
  length_(L, N),
  Middle is N//2,
  drop(Middle, L, R).
/*
63 ?- split([], X).        
X = [] ;
X = [].

64 ?- split([1,2,3,4,5], X). 
X = [1, 2] ;
X = [3, 4, 5].

65 ?- split([1,2,3,4,5, 6], X). 
X = [1, 2, 3] ;
X = [4, 5, 6].
*/

% 9.6
/*
1 ?- append([a,b], [c, d], X).
X = [a, b, c, d].

3 ?- append(X, Y, [a,b,c]).
X = [],
Y = [a, b, c] ;
X = [a],
Y = [b, c] ;
X = [a, b],
Y = [c] ;
X = [a, b, c],
Y = [] ;
false.
*/

permutation([], []).
 
permutation(P, [H|T]) :-
    permutation(P1, T),
    append(A, B, P1),      % P1 dzielimy na dwie
    append(A, [H|B], P).   % P powstaje poprzez wstawienie
                           % elementu H w pewne miejsce listy P1
/*
1 ?- permutation(P, [a,b,c]).
P = [a, b, c] ;
P = [b, a, c] ;
P = [b, c, a] ;
P = [a, c, b] ;
P = [c, a, b] ;
P = [c, b, a] ;
false.
*/


% 9.9
/*
1 ?- numlist(1,5, X).
X = [1, 2, 3, 4, 5].
*/
% suma od 1 do 100 liczb postaci 1/n
f1(X, Y) :- Y is 1/X.

listSum([X], X).
listSum([X,Y|T], Sum) :-
  Z is X + Y,
  listSum([Z|T], Sum).

s1(X) :-
  numlist(1, 100, L1),
  maplist(f1, L1, L2),
  listSum(L2, X), !.
/*
1 ?- s1(X).
X = 5.187377517639621.
*/

f2(X, Y) :- Y is (1+X)/(2+X).

listProd([X], X).
listProd([X,Y|T], Prod) :-
  Z is X * Y,
  listProd([Z|T], Prod).

p1(X) :-
  numlist(1, 50, L1),
  maplist(f2, L1, L2),
  listProd(L2, X), !.
/*
2 ?- p1(X).
X = 0.03846153846153846.
*/

% 9.7
middle(N, L, R) :- 
  length(L, S1),
  (S1 =< 2*N ->
    R = []
    ;
    drop(N, L, Temp),
    length(Temp, S2),
    T is S2 - N,
    take(T, Temp, R)
  ).
/*
27 ?- middle(0, [1, 2, 3, 4, 5], R).
R = [1, 2, 3, 4, 5].

28 ?- middle(1, [1, 2, 3, 4, 5], R). 
R = [2, 3, 4].

29 ?- middle(2, [1, 2, 3, 4, 5], R). 
R = [3].

30 ?- middle(3, [1, 2, 3, 4, 5], R). 
R = [].
*/

% 9.8
move(L, X) :-
  take(1, L, Elem),
  drop(1, L, Core),
  append(Core, Elem, X).
/*
35 ?- move([1,2,3,4], X), move(X, Y), move(Y, Z).
X = [2, 3, 4, 1],
Y = [3, 4, 1, 2],
Z = [4, 1, 2, 3].
*/

% 9.9
f3(X, Y) :- Y is 1/(X*X).

s2(X) :-
  numlist(1, 1000, L1),
  maplist(f3, L1, L2),
  listSum(L2, X), !.
/*
39 ?- s2(X).
X = 1.6439345666815615.
*/

f4(X, Y) :- Y is sqrt(X) - 1/X.

s3(X) :-
  numlist(1, 1000, L1),
  maplist(f4, L1, L2),
  listSum(L2, X), !.
/*
41 ?- s3(X).
X = 21089.970416620185.
*/

f5(X, Y) :- Y is (X+1)/(X*X*X).

p2(X) :-
  numlist(1, 1000, L1),
  maplist(f5, L1, L2),
  listProd(L2, X), !.
/*
49 ?- p2(X).
X = 0.0.
*/