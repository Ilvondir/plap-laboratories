% 7.1

% Czy Tomek jest mężczyzną?
/*
7 ?- mezczyzna(tomek).
true.
*/

% Czy Tomek jest kobietą?
/*
7 ?- kobieta(tomek).
false.
*/

% Kto jest rodzicem Maxa?
/*
9 ?- rodzic(P, max).   
P = ola ;
P = tomek.
*/

% Czyim rodzicem jest Max?
/*
10 ?- rodzic(max, C). 
C = ania ;
C = kasia.
*/

% Czy Ola jest matką?
/*
12 ?- rodzic(ola, _).   
true.
*/

% Czy Ola ma matkę?
/*
18 ?- matka(_, ola).
false.
*/

% Czy Tomek ma dzieci?
/*
18 ?- ojciec(tomek, _). 
true ;
true.
*/

% Czy Ania ma matkę i ojca?
/*
19 ?- matka(_, ania) , ojciec(_, ania).
false.
*/

% Kto ma wnuka? (bez dodawania nowych reguł)
/*
22 ?- rodzic(P, S) , rodzic(S, A) , mezczyzna(A). 
P = max,
S = kasia,
A = radek ;
false.
*/

% Kto ma prawnuka? (bez dodawania nowych reguł)
/*
23 ?- rodzic(P, S) , rodzic(S, B), rodzic(B, G) , mezczyzna(G). 
P = ola,
S = max,
B = kasia,
G = radek ;
P = tomek,
S = max,
B = kasia,
G = radek ;
false.
*/

% Czy Ola jest kobietą?
/*
24 ?- kobieta(ola).
true.
*/

% Kto jest mężczyzną?
/*
25 ?- mezczyzna(M).
M = tomek ;
M = max ;
M = radek.
*/

% Kto jest matką Maxa?
/*
26 ?- matka(M, max).
M = ola ;
false.
*/

% Kto jest ojcem Maxa?
/*
27 ?- ojciec(M, max). 
M = tomek.
*/

% Kto ma matkę i ojca?
/*
28 ?- matka(M, C) , ojciec(F, C).
M = ola,
C = max,
F = tomek ;
false.
*/

% Kto ma wnuczkę? (bez dodawania nowych reguł)
/*
29 ?- rodzic(P, S) , rodzic(S, A) , kobieta(A).   
P = ola,
S = max,
A = ania ;
P = ola,
S = max,
A = kasia ;
P = tomek,
S = max,
A = ania ;
P = tomek,
S = max,
A = kasia ;
false.
*/

% Kto ma prawnuczkę? (bez dodawania nowych reguł)
/*
30 ?- rodzic(G, P) , rodzic(P, S) , rodzic(S, A) , kobieta(A). 
false.
*/