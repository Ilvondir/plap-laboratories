cyfra :: Num a => Char -> a
cyfra '0' = 0
cyfra '1' = 1
cyfra '2' = 2
cyfra '3' = 3
cyfra '4' = 4
cyfra '5' = 5
cyfra '6' = 6
cyfra '7' = 7
cyfra '8' = 8
cyfra '9' = 9

string2int x = read x :: Integer

string2int'2 "" = error "Pusty string"
string2int'2 [x] = cyfra x
string2int'2 (x:xs) = (cyfra x) * 10 ^ length xs + string2int'2 xs

string2int'3 "" = error "Pusty string"
string2int'3 (x:xs) = if length xs == 0 then cyfra x else (cyfra x) * 10 ^ length xs + string2int'3 xs

string2int'4 str = foldl (\a x -> a * 10 + cyfra x) 0 str

{-
ghci> string2int "34"
34
ghci> string2int'2 "34"
34
ghci> string2int'3 "34"
34
ghci> string2int'4 "34"
34
-}