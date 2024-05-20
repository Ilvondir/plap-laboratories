panstwo('Polska').
panstwo('Niemcy').
panstwo('Francja').
panstwo('Włochy').
panstwo('Hiszpania').
panstwo('Wielka Brytania').

miasto('Warszawa').
miasto('Kraków').
miasto('Berlin').
miasto('Paryż').
miasto('Rzym').
miasto('Wenecja').
miasto('Barcelona').
miasto('Madryt').
miasto('Londyn').

polozenie('Warszawa', 'Polska').
polozenie('Kraków', 'Polska').
polozenie('Berlin', 'Niemcy').
polozenie('Paryż', 'Francja').
polozenie('Rzym', 'Włochy').
polozenie('Wenecja', 'Włochy').
polozenie('Barcelona', 'Hiszpania').
polozenie('Madryt', 'Hiszpania').
polozenie('Londyn', 'Wielka Brytania').

zabytek('Pałac w Wilanowie').
zabytek('Kolumna Zygmunta III Wazy').
zabytek('Wawel').
zabytek('Sukiennice').
zabytek('Kościół Mariacki').
zabytek('Brama Brandenburska').
zabytek('Reichstag').
zabytek('Wieża Eiffla').
zabytek('Katedra Notre-Dame').
zabytek('Pałac Elizejski').
zabytek('Bazylika św. Pawła za Murami').
zabytek('Koloseum').
zabytek('Zamek Świętego Anioła').
zabytek('Bazylika św. Marka').
zabytek('Pałac Dożów').
zabytek('Sagrada Familia').
zabytek('Pałac Kryształowy').
zabytek('Tower Bridge').
zabytek('Pałac Buckingham').
zabytek('Katedra Świętego Pawła').

gdzie('Pałac w Wilanowie', 'Warszawa').
gdzie('Kolumna Zygmunta III Wazy', 'Warszawa').
gdzie('Wawel', 'Kraków').
gdzie('Sukiennice', 'Kraków').
gdzie('Kościół Mariacki', 'Kraków').
gdzie('Brama Brandenburska', 'Berlin').
gdzie('Reichstag', 'Berlin').
gdzie('Wieża Eiffla', 'Paryż').
gdzie('Katedra Notre-Dame', 'Paryż').
gdzie('Pałac Elizejski', 'Paryż').
gdzie('Bazylika św. Pawła za Murami', 'Rzym').
gdzie('Koloseum', 'Rzym').
gdzie('Zamek Świętego Anioła', 'Rzym').
gdzie('Bazylika św. Marka', 'Wenecja').
gdzie('Pałac Dożów', 'Wenecja').
gdzie('Sagrada Familia', 'Barcelona').
gdzie('Pałac Kryształowy', 'Madryt').
gdzie('Tower Bridge', 'Londyn').
gdzie('Pałac Buckingham', 'Londyn').
gdzie('Katedra Świętego Pawła', 'Londyn').

obok('Polska', 'Niemcy').
obok('Niemcy', 'Francja').
obok('Francja', 'Wielka Brytania').
obok('Francja', 'Włochy').
obok('Francja', 'Hiszpania').

% 8.4
zabytki_m(M) :- 
    miasto(M),
    zabytek(Z),
    gdzie(Z, M),
    writeln(Z), fail.
zabytki_m(M) :- true.
/*
1 ?- zabytki_m('Berlin').
Brama Brandenburska
Reichstag
true.
*/

zabytki_mp(M) :-
  miasto(M),
  zabytek(Z),
  panstwo(P),
  polozenie(M, P),
  gdzie(Z, M),
  write(P), tab(1), write(M), tab(1), writeln(Z), 
  fail.
zabytki_mp(_) :- true.
/*
6 ?- zabytki_mp('Berlin'). 
Niemcy Berlin Brama Brandenburska
Niemcy Berlin Reichstag
true.
*/

zabytki_p(P) :-
  zabytek(Z),
  panstwo(P),
  miasto(M),
  polozenie(M, P),
  gdzie(Z, M),
  writeln(Z),
  fail.
zabytki_p(_) :- true.
/*
13 ?- zabytki_p('Niemcy').
Brama Brandenburska
Reichstag
true.
*/

zabytki_ps(P1) :-
  lokalne_zabytki(P1),
  panstwo(P1),
  panstwo(P2),
  miasto(M),
  zabytek(Z),
  (obok(P1, P2) ; obok(P2, P1)),
  polozenie(M, P2),
  gdzie(Z, M),
  write(P2), tab(1), write(M), tab(1), writeln(Z),
  fail.
zabytki_ps(_) :- true.

lokalne_zabytki(P) :- 
  panstwo(P),
  miasto(M),
  zabytek(Z),
  polozenie(M, P),
  gdzie(Z, M),
  write(P), tab(1), write(M), tab(1), writeln(Z),
  fail.
lokalne_zabytki(_) :- true.
/*
38 ?- zabytki_ps('Niemcy').
Niemcy Berlin Brama Brandenburska
Niemcy Berlin Reichstag
Polska Warszawa Pałac w Wilanowie
Polska Warszawa Kolumna Zygmunta III Wazy
Polska Kraków Wawel
Polska Kraków Sukiennice
Polska Kraków Kościół Mariacki
Francja Paryż Wieża Eiffla
Francja Paryż Katedra Notre-Dame
Francja Paryż Pałac Elizejski
true.
*/