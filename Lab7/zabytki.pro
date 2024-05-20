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

% Task 1
sasiad(C1, C2) :- obok(C1, C2) ; obok(C2 , C1).
/*
5 ?- panstwo('Niemcy'), obok('Niemcy', C), polozenie(T, C) , miasto(T) , gdzie(M, T) , zabytek(M). 
C = 'Francja',
T = 'Paryż',
M = 'Wieża Eiffla' ;
C = 'Francja',
T = 'Paryż',
M = 'Katedra Notre-Dame' ;
C = 'Francja',
T = 'Paryż',
M = 'Pałac Elizejski'.

6 ?- panstwo('Niemcy'), sasiad('Niemcy', C), polozenie(T, C) , miasto(T) , gdzie(M, T) , zabytek(M). 
C = 'Francja',
T = 'Paryż',
M = 'Wieża Eiffla' ;
C = 'Francja',
T = 'Paryż',
M = 'Katedra Notre-Dame' ;
C = 'Francja',
T = 'Paryż',
M = 'Pałac Elizejski' ;
C = 'Polska',
T = 'Warszawa',
M = 'Pałac w Wilanowie' ;
C = 'Polska',
T = 'Warszawa',
M = 'Kolumna Zygmunta III Wazy' ;
C = 'Polska',
T = 'Kraków',
M = 'Wawel' ;
C = 'Polska',
T = 'Kraków',
M = 'Sukiennice' ;
C = 'Polska',
T = 'Kraków',
M = 'Kościół Mariacki'.
*/

sasiad2(C1, C2) :- obok(C2, C1) ; obok(C1 , C2).
/*
10 ?- panstwo('Niemcy'), sasiad2('Niemcy', C), polozenie(T, C) , miasto(T) , gdzie(M, T) , zabytek(M). 
C = 'Polska',
T = 'Warszawa',
M = 'Pałac w Wilanowie' ;
C = 'Polska',
T = 'Warszawa',
M = 'Kolumna Zygmunta III Wazy' ;
C = 'Polska',
T = 'Kraków',
M = 'Wawel' ;
C = 'Polska',
T = 'Kraków',
M = 'Sukiennice' ;
C = 'Polska',
T = 'Kraków',
M = 'Kościół Mariacki' ;
C = 'Francja',
T = 'Paryż',
M = 'Wieża Eiffla' ;
C = 'Francja',
T = 'Paryż',
M = 'Katedra Notre-Dame' ;
C = 'Francja',
T = 'Paryż',
M = 'Pałac Elizejski'.
*/