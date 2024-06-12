:- use_module(library(clpfd)).
 
sudoku(Rows) :-
  length(Rows, 9),                
  maplist(length_(9), Rows),      
  append(Rows, Vs),               
  Vs ins 1..9,                    
  maplist(all_distinct, Rows),    
  transpose(Rows, Columns),       
  maplist(all_distinct, Columns), 
  Rows = [A,B,C,D,E,F,G,H,I],     
  blocks(A, B, C),                
  blocks(D, E, F), 
  blocks(G, H, I).
% sudoku(Rows) - na wejściu podajemy macierz 9x9
% musimy podać listę o długości 9
% każdy element jest listą o długości 9
% zamienia listę list na pojedynczą listę
% wszystkie elementy z Vs muszą być z zakresu 1..9
% żaden wiersz nie zawiera powtarzających się wartości
% transpozycja macierzy
% żadna kolumna nie zawiera powtarzających się wartości
% nazwanie wierszy
% bloki 3x3 z wierszy A, B i C nie zawierają powtarzających się wartości
% bloki 3x3 z wierszy D, E i F nie zawierają powtarzających się wartości
% bloki 3x3 z wierszy G, H i I nie zawierają powtarzających się wartości

length_(N, L) :- length(L, N).    % odwrócona kolejność argumentów

% do predykatu blocks wysyłamy 3 wiersze
% wybieramy 3 pierwsze elementy z każdego z nich
% tworzą one blok, który nie może zawierać powtarzających się wartości
blocks([], [], []).
blocks([A,B,C|Bs1], [D,E,F|Bs2], [G,H,I|Bs3]) :-
  all_distinct([A,B,C,D,E,F,G,H,I]),
  blocks(Bs1, Bs2, Bs3).
  
% łatwe wywołanie zadania ;)
go(N) :- 
  problem(N, Rows),
  sudoku(Rows),
  maplist(writeln, Rows).
 
problem(1, [[_,_,_,_,_,_,_,_,_],
            [_,_,_,_,_,3,_,8,5],
            [_,_,1,_,2,_,_,_,_],
            [_,_,_,5,_,7,_,_,_],
            [_,_,4,_,_,_,1,_,_],
            [_,9,_,_,_,_,_,_,_],
            [5,_,_,_,_,_,_,7,3],
            [_,_,2,_,1,_,_,_,_],
            [_,_,_,_,4,_,_,_,9]]).
            
problem(2, [[2,_,_,6,_,7,5,_,_],
            [_,_,_,_,_,_,_,9,6],
            [6,_,7,_,_,1,3,_,_],
            [_,5,_,7,3,2,_,_,_],
            [_,7,_,_,_,_,_,2,_],
            [_,_,_,1,8,9,_,7,_],
            [_,_,3,5,_,_,6,_,4],
            [8,4,_,_,_,_,_,_,_],
            [_,_,5,2,_,6,_,_,8]]).
            
problem(3, [[2,_,_,6,_,7,5,_,_],
            [_,3,_,_,_,_,_,9,6],
            [6,_,7,_,_,1,3,_,_],
            [_,5,_,7,3,2,_,_,_],
            [_,7,_,_,_,_,_,2,_],
            [_,_,_,1,8,9,_,7,_],
            [_,_,3,5,_,_,6,_,4],
            [8,4,_,_,_,_,_,_,_],
            [_,_,5,2,_,6,_,_,8]]).
