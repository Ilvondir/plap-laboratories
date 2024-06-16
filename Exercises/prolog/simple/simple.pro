% 1.
% a)
ciag1(1) :- writeln(1), !.
ciag1(N) :-
  writeln(N),
  N1 is N-1,
  ciag1(N1).
/*
2 ?- ciag1(5).
5
4
3
2
1
true.
*/

% b)
ciag2(N, N) :- writeln(N), !.
ciag2(N, M) :-
  writeln(M),
  M1 is M+1,
  ciag2(N, M1).

ciag2(N) :- ciag2(N, 1).
/*
8 ?- ciag2(5).  
1
2
3
4
5
true.
*/


% 2.
equal(P, Q) :-
  (\+P ; Q) , (\+Q ; P).
/*
19 ?- equal(true, true).   
true.

20 ?- equal(true, false).
false.

21 ?- equal(false, true). 
false.

*/