% 12.1
/*
2 ?- atom_chars("ola", L).
L = [o, l, a].

*/

count([], _, 0) :- !.
count([H|T], H, N) :-
  count(T, H, O),
  N is O + 1.

count([H|T], C, N) :-
  H \= C,
  count(T, C, N).

countChars(S, C, N) :-
  atom_chars(S, L),
  count(L, C, N), !.
/*
1 ?- countChars("ala ma kota", a, N).
N = 4.

2 ?- countChars("", a, N).
N = 0.

*/