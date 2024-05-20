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