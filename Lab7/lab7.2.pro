% 7.2.1

rodzic(ola,max).
rodzic(tomek,max).
rodzic(tomek,lila).
rodzic(max,ania).
rodzic(max,kasia).
rodzic(kasia,radek).
rodzic(kasia,malwina).
rodzic(kasia,oliwia).
rodzic(ania,franek).
 
kobieta(ola).
kobieta(lila).
kobieta(kasia).
kobieta(malwina).
kobieta(oliwia).
 
mezczyzna(tomek).
mezczyzna(max).
mezczyzna(radek).
mezczyzna(franek).
 
matka(X,Y) :-
  rodzic(X,Y),
  kobieta(X).
 
ojciec(X,Y) :-
  rodzic(X,Y),
  mezczyzna(X).

/*
2 ?- rodzic(G, P) , rodzic(P, S) , rodzic(S, A) , kobieta(A).
G = ola,
P = max,
S = kasia,
A = malwina ;
G = ola,
P = max,
S = kasia,
A = oliwia ;
G = tomek,
P = max,
S = kasia,
A = malwina ;
G = tomek,
P = max,
S = kasia,
A = oliwia ;
false.

3 ?- rodzic(P, S) , rodzic(S, B), rodzic(B, G) , mezczyzna(G). 
P = ola,
S = max,
B = ania,
G = franek ;
P = ola,
S = max,
B = kasia,
G = radek ;
P = tomek,
S = max,
B = ania,
G = franek ;
P = tomek,
S = max,
B = kasia,
G = radek ;
false.
*/

% 7.2.2
/*
4 ?- listing(kobieta). 
kobieta(ola).
kobieta(lila).
kobieta(kasia).
kobieta(malwina).
kobieta(oliwia).

true.

5 ?- listing(matka).   
matka(X, Y) :-
    rodzic(X, Y),
    kobieta(X).

true.
*/