% 7.3

% Jakie zabytki znajdują się w Berlinie?
/*
4 ?- gdzie(M, 'Berlin'), zabytek(M). 
M = 'Brama Brandenburska' ;
M = 'Reichstag'.
*/

% Jakie miasta znajdują się w Hiszpani?
/*
5 ?- polozenie(C, 'Hiszpania') , miasto(C). 
C = 'Barcelona' ;
C = 'Madryt'.
*/

% Jakie zabytki znajdują się we Włoszech?
/*
20 ?- polozenie(M, 'Włochy') , miasto(M) , gdzie(Z, M) , zabytek(Z).
M = 'Rzym',
Z = 'Bazylika św. Pawła za Murami' ;
M = 'Rzym',
Z = 'Koloseum' ;
M = 'Rzym',
Z = 'Zamek Świętego Anioła' ;
M = 'Wenecja',
Z = 'Bazylika św. Marka' ;
M = 'Wenecja',
Z = 'Pałac Dożów'.
*/

% W jakim mieście znajduje się Bazylika św. Pawła za Murami?
/*
25 ?- gdzie('Bazylika św. Pawła za Murami', C) , miasto(C). 
C = 'Rzym'.
*/

% W jakim państwie jest Sagrada Familia?
/*
26 ?- gdzie('Sagrada Familia', C) , miasto(C) ,  polozenie(C, V) , panstwo(V).
C = 'Barcelona',
V = 'Hiszpania'.
*/

% Jakie zabytki można zwiedzać w Państwach sąsiadujących z Francją?
/*
1 ?- (obok('Francja', K) ; obok(K, 'Francja')), panstwo(K) , polozenie(C
iasto(C) , gdzie(M, C) , zabytek(M).
K = 'Wielka Brytania',
C = 'Londyn',
M = 'Tower Bridge' ;
K = 'Wielka Brytania',
C = 'Londyn',
M = 'Pałac Buckingham' ;
K = 'Wielka Brytania',
C = 'Londyn',
M = 'Katedra Świętego Pawła' ;
K = 'Włochy',
C = 'Rzym',
M = 'Bazylika św. Pawła za Murami' ;
K = 'Włochy',
C = 'Rzym',
M = 'Koloseum' ;
K = 'Włochy',
C = 'Rzym',
M = 'Zamek Świętego Anioła' ;
K = 'Włochy',
C = 'Wenecja',
M = 'Bazylika św. Marka' ;
K = 'Włochy',
C = 'Wenecja',
M = 'Pałac Dożów' ;
K = 'Hiszpania',
C = 'Barcelona',
M = 'Sagrada Familia' ;
K = 'Hiszpania',
C = 'Madryt',
M = 'Pałac Kryształowy' ;
K = 'Niemcy',
C = 'Berlin',
M = 'Brama Brandenburska' ;
K = 'Niemcy',
C = 'Berlin',
M = 'Reichstag'.
*/

% Jakie zabytki można zwiedzać w państwie, w którym znajduje się Barcelona?
/*
29 ?- polozenie('Barcelona', C) , panstwo(C) , polozenie(T, C) , miasto(T) , gdzie(M, T) , zabytek(M).
C = 'Hiszpania',
T = 'Barcelona',
M = 'Sagrada Familia' ;
C = 'Hiszpania',
T = 'Madryt',
M = 'Pałac Kryształowy'.
*/

% Jakie miasta znajdują się w Państwach sąsiadujących z Niemcami?
/*
41 ?- obok('Niemcy', C) , obok(K, 'Niemcy') , polozenie(T, C) , polozenie(P, K). 
C = 'Francja',
K = 'Polska',
T = 'Paryż',
P = 'Warszawa' ;
C = 'Francja',
K = 'Polska',
T = 'Paryż',
P = 'Kraków'.
*/

% Czy w Wielkiej Brytanii znajdują się jakieś zabytki?
/*
45 ?- polozenie(T, 'Wielka Brytania') , miasto(T) , gdzie(_, T). 
T = 'Londyn' ;
T = 'Londyn' ;
T = 'Londyn'.
*/

% Czy istnieje państwo, które sąsiaduje z państwem, w którym znajduje się Madryt?
/*
53 ?- polozenie('Madryt', C) , panstwo(C) , obok(C1, C). 
C = 'Hiszpania',
C1 = 'Francja'.
*/