/*
1 ?- \+ false.
true.

2 ?- \+ true.  
false.

3 ?- not(true). 
false.

4 ?- not(false). 
true.

5 ?- X = Y.
X = Y.

6 ?- \+ X = Y. 
false.

7 ?- not(X = Y).    
false.

8 ?- X \= Y.
false.
*/


% 8.5
delta(A, B, C, Delta) :- Delta is B*B - 4*A*C.

trojmian(A, B, C, X) :- 
  delta(A, B, C, Delta),
  Delta > 0,
  X1 is (-B - sqrt(Delta)) / (2*A),
  X2 is (-B + sqrt(Delta)) / (2*A),
  X = [X1, X2].

trojmian(A, B, C, X) :- 
  delta(A, B, C, Delta),
  Delta = 0,
  X1 is (-B) / (2*A),
  X = [X1].

trojmian(A, B, C, X) :- 
  delta(A, B, C, Delta),
  Delta < 0,
  X = [].
/*
1 ?- trojmian(1, 0, -1, X).
X = [-1.0, 1.0] ;
false.

2 ?- trojmian(1, -2, 1, X). 
X = [1] ;
false.

3 ?- trojmian(1, 0, 1, X).  
X = [].
*/

% Task 3
trojmian2(A, B, C, X) :- 
  delta(A, B, C, Delta),
  Delta > 0,
  X1 is (-B - sqrt(Delta)) / (2*A),
  X2 is (-B + sqrt(Delta)) / (2*A),
  X = [X1, X2], !.

trojmian2(A, B, C, X) :- 
  delta(A, B, C, Delta),
  Delta = 0,
  X1 is (-B) / (2*A),
  X = [X1], !.

trojmian2(A, B, C, X) :- X = [].
/*
7 ?- trojmian2(1, 0, -1, X).
X = [-1.0, 1.0].

8 ?- trojmian2(1, -2, 1, X). 
X = [1].

9 ?- trojmian2(1, 0, 1, X). 
X = [].
*/

% 8.6
seq(1, X) :- X = 3.
seq(2, X) :- X = 4.
seq(N, X) :-
    N > 2,
    N1 is N - 1,
    N2 is N - 2,
    seq(N1, Value1),
    seq(N2, Value2),
    X is (Value1 + 3 * Value2).
/*
66 ?- seq(3, X). 
X = 13 ;
false.

67 ?- seq(4, X). 
X = 25 ;
false.
*/

% 8.7
liczba(X) :-
  between(100, 999, X),
  X mod 3 =:= 0,
  X mod 5 =:= 0,
  X mod 7 =:= 0.
/*
69 ?- liczba(X).
X = 105 ;
X = 210 ;
X = 315 ;
X = 420 ;
X = 525 ;
X = 630 ;
X = 735 ;
X = 840 ;
X = 945 ;
false.
*/

riddle(Coins) :-
  between(0, 99, Coins),
  Coins mod 3 =:= 1,
  Coins mod 4 =:= 2,
  Coins mod 5 =:= 3,
  Coins mod 6 =:= 4.
/*
71 ?- riddle(Coins).
Coins = 58 ;
false.
*/


% 8.8
exercise(X) :- 
  between(100, 999, X1),
  swapDigits(X1, X2),
  X1 + X2 =:= 1187,
  X = [X1, X2].

swapDigits(Old, New) :- 
  Units is Old mod 10,
  Tens is (Old // 10) mod 10,
  Hundreds is Old // 100,
  New is Hundreds * 100 + Units * 10 + Tens.
/*
75 ?- exercise(X).
X = [589, 598] ;
X = [598, 589] ;
false.
*/