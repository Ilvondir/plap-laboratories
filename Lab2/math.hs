module Math
where

f1 :: Num a => a -> a  -- f1 zmniejsza pobierany argument o 2
f1 x = x - 2
f1' :: Integer -> Integer
f1' = (+ (-2))

f2 :: Integral a => a -> a  -- f2 zwraca reszte z dzielenia argumentu przez 5
f2 x = x `mod` 5
f2' :: Integer -> Integer
f2' = (`mod` 5)
 
f3 :: (Eq a, Num a) => a -> Bool  -- f3 zwraca wynik porownania argumentu z liczba 10
f3 x = x == 10
f3' :: Integer -> Bool
f3' = (== 10)

f4 :: Integral a => a -> a  -- f4 zwraca czesc calkowita z dzielenia argumentu przez 8
f4 x = x `div` 8
f4' :: Integer -> Integer
f4' = (`div` 8)

f5 :: (Ord a, Num a) => a -> Bool  -- f5 zwraca True, jezeli argument jest wiekszy od 100 i False w przeciwnym przypadku
f5 x = x > 100
f5' :: Integer -> Bool
f5' = (> 100)

f6 :: Integral a => a -> a  -- f6 zwraca reszte z dzielenia liczby 5 przez argument funkcji
f6 x = 5 `mod` x
f6' :: Integer -> Integer
f6' = (5 `mod`)

f7 :: Integral a => a -> a  -- f7 zwraca czesc calkowita z dzielenia liczby 8 przez argument funkcji
f7 x = 8 `div` x
f7' :: Integer -> Integer
f7' = (8 `div`)

f8 :: Num a => a -> a  -- f8 potraja pobierany argument
f8 x = x * 3
f8' :: Integer -> Integer
f8' = (* 3)


-- 2.6
{-
ghci> :l math
[1 of 1] Compiling Math             ( math.hs, interpreted )
Ok, one module loaded.
ghci> f1 5
3
ghci> f1' 2
0
ghci> f2 12
2
ghci> f2' 13
3
ghci> f3 13
False
ghci> f3' 13
False
ghci> f4 13
1
ghci> f4' 13
1
ghci> f5 13
False
ghci> f5' 130
True
ghci> f6 18
5
ghci> f6' 3
2
ghci> f7 30
0
ghci> f7' 3
2
ghci> f8 3
9
ghci> f8' 13
39
-}