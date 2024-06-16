kobieta(ola).
kobieta(kasia).
kobieta(ania).

mezczyzna(tomek).
mezczyzna(maks).
mezczyzna(adam).

pizza(capriciosa,24.90).
pizza(roma,27.00).
pizza(califfo,30.40).

skladnik(ser,capriciosa).
skladnik(szynka,capriciosa).
skladnik(pieczarki,capriciosa).
skladnik(ser,roma).
skladnik(salami,roma).
skladnik(kabanosy,roma).
skladnik(papryka,roma).
skladnik(ser,califfo).
skladnik(szynka,califfo).
skladnik(kabanosy,califfo).
skladnik(papryka,califfo).
skladnik(oliwki,califfo).

lubi(ola,szynka).
lubi(ola,oliwki).
lubi(kasia,szynka).
lubi(kasia,salami).
lubi(ania,oliwki).
lubi(ania,papryka).
lubi(ania,pieczarki).
lubi(tomek,szynka).
lubi(tomek,oliwki).
lubi(maks,salami).
lubi(maks,szynka).
lubi(maks,kabanosy).
lubi(maks,pieczarki).
lubi(adam,szynka).



% ----------------------------------------------------------------


% 1.
/*
1 ?- lubi(ania, I).
I = oliwki ;
I = papryka ;
I = pieczarki.


2 ?- lubi(ola, I), lubi(tomek, I). 
I = szynka ;
I = oliwki.


4 ?- pizza(Pizza, Price), Price > 30.
Pizza = califfo,
Price = 30.4.


5 ?- skladnik(kabanosy, Pizza).
Pizza = roma ;
Pizza = califfo.
*/



% 2.
dobrapizza(X, Y) :-
  lubi(X, I),
  lubi(X, I2),
  skladnik(I, Y),
  skladnik(I2, Y),
  I \= I2, !.
/*
45 ?- dobrapizza(ania, Pizza).
Pizza = califfo.

46 ?- dobrapizza(tomek, Pizza). 
Pizza = califfo.

47 ?- dobrapizza(maks, Pizza).  
Pizza = roma.
*/



% 3.
f(X, Y) :- Y is (X+1)/(X*X + 2).

listSum([], 0).
listSum([M], M) :- !.
listSum([X,Y|T], M) :-
  Y1 is X+Y,
  listSum([Y1|T], M).

suma(Y) :-
  numlist(2, 1500, L1),
  maplist(f, L1, L2),
  listSum(L2, Y).
/*
57 ?- suma(Y).
Y = 7.116163439283606.
*/


% 4. 
drop(0, X, X) :- !.
drop(N, X, Y) :- 
  X = [_|T],
  N1 is N-1,
  drop(N1, T, Y).
/*
59 ?- drop(0, [1,2,3], Y).
Y = [1, 2, 3].

60 ?- drop(1, [1,2,3], Y). 
Y = [2, 3].

61 ?- drop(2, [1,2,3], Y). 
Y = [3].
*/


% 5.
assign([], _).
assign([V|Vs], L1):-
  select(V, L1, L2),
  assign(Vs, L2).

szescian :-
  X = [XP1, XP2, XP3, XP4, XS1, XS2, XS3, XS4],
  N = [1, 2, 3, 4, 5, 6, 7, 8],
  assign(X, N),
  Sum is XP1 + XP2 + XS1 + XS2,
  XP2 + XP3 + XS2 + XS3 =:= Sum,
  XP3 + XP4 + XS3 + XS4 =:= Sum,
  XP4 + XP1 + XS4 + XS1 =:= Sum,
  XP1 + XP2 + XP3 + XP4 =:= Sum,
  XS1 + XS2 + XS3 + XS4 =:= Sum,
  writeln(X), !.

/*
74 ?- szescian.
[1,4,5,8,6,7,2,3]
true.

  6        3
     7        2


  1        8
     4        5
*/