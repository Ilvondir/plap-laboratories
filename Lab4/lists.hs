module Lists
where

import Data.Char

-- 4.1
{-
ghci> :t map
map :: (a -> b) -> [a] -> [b]
ghci> map (^2) [1,2,3,4]
[1,4,9,16]
ghci> map (\x -> x*x) [1,3,4]
[1,9,16]
ghci> let f = (^2) in map f [1,2,3]
[1,4,9]
ghci> sum [1,3,4]
8
ghci> sqrt (sum [1,3,4])
2.8284271247461903
-}
sumOfSquares :: [Double] -> Double
sumOfSquares l = sum (map (\x -> x*x) l)
{-
ghci> sumOfSquares [1, 2, 4]
21    
ghci> sumOfSquares [9, 0, 1, 1, 1, 4]
100
-}

sumOfSquares' [] = 0
sumOfSquares' (x:xs) = x^2 + sumOfSquares' xs
{-
ghci> sumOfSquares' [1, 2, 4]
21
ghci> sumOfSquares' [9, 0, 1, 1, 1, 4]
100
-}

-- 4.2
{-
*Lists> let f0 (x:xs) = x
*Lists> let f1 (_:x:xs) = x
*Lists> let f2 (_:_:x:xs) = x
*Lists> f0 [1, 2, 3]
1
*Lists> f2 [1, 2, 3]
3
*Lists> f1 [1, 2, 3]
2
*Lists> f0 []
*** Exception: <interactive>:3:5-17: Non-exhaustive patterns in function f0
-}
sum1 :: [Double] -> Double
sum1 [] = 0
sum1 [_] = 0
sum1 (_:x:xs) = x + sum1 xs
{-
[1,2,3,4] -> [3,4] -> []
[1,2,3] -> [3]
-}
{-
*Lists> sum1 [1,2,3,4]
6.0
*Lists> sum1 [1,2,3]
2.0
-}
sum2 :: [Double] -> Double
sum2 [] = 0
sum2 [_] = 0
sum2 (x:_:xs) = x + sum2 xs
{-
ghci> sum2 [0, 3, 3,4]
3.0
ghci> sum2 [1, 3, 3,4]
4.0
-}
sum3 :: [Double] -> Double
sum3 [] = 0
sum3 [_] = 0
sum3 [_, _] = 0
sum3 (_:_:x:xs) = x + sum3 xs
{-
ghci> sum3 [0,5,4,4,4,4,4,4,4]
12.0
ghci> sum3 [0,5,4,4,4,4,4,4]  
8.0
ghci> sum3 [0,5,4,4,4,1,4,4]
5.0
ghci> sum3 []
0.0
ghci> sum3 [3]
0.0
ghci> sum3 [3, 5]
0.0
-}
{-
sum1 [3, 5, 7] = 
(x:xs) = [3, 5, 7]
x = 5
xs = [7]
= 5 + sum1 [7] =
[_] = 7
= 5 + 0 = 5
-}

-- 4.3
{-
*Lists> :t "cute cat"
"cute cat" :: [Char]
*Lists> ['c', 'a', 't']
"cat"
*Lists> 3 : [5,7]
[3,5,7]
*Lists> [3,5] ++ [7]
[3,5,7]
*Lists> 'c' : "at"
"cat"
*Lists> "c" ++ "at"
"cat"
*Lists> let small x = 'a' <= x && x <= 'z'
*Lists> small 'c'
True
*Lists> small 'X'
False
-}
countLower :: String -> Int
countLower [] = 0
countLower (x:xs) | 'a' <= x && x <= 'z' = 1 + countLower xs
                  | otherwise = countLower xs
{-
*Lists> countLower "ala ma Koma"
8
*Lists> countLower "aBCdA"
2
*Lists> countLower "aBCdAefG"
4
-}
countUpper :: String -> Int
countUpper [] = 0
countUpper (x:xs) | 'A' <= x && x <= 'Z' = 1 + countUpper xs
                  | otherwise = countUpper xs

countLowerUpper :: String -> (Int, Int)
countLowerUpper str = (countLower str, countUpper str)
{-
ghci> countLowerUpper "Ala MA Kota"
(5,4)
ghci> countLowerUpper "Snail Bob"  
(6,2)
-}

-- 4.4
string2bools :: String -> [Bool]
string2bools [] = []
string2bools (x:xs) | 'a' <= x && x <= 'z' = True : string2bools xs
                    | otherwise = False : string2bools xs
{-
ghci> string2bools "Ala"
[False,True,True]
ghci> string2bools "AnnA Żyto"
[False,True,True,False,False,False,True,True,True]
ghci> string2bools ""         
[]
-}

-- 4.5
cgtx :: [Double] -> Double -> Integer
cgtx [] num = 0
cgtx (x:xs) num | x > num = 1 + cgtx xs num
                | otherwise = cgtx xs num
{-
*Lists> cgtx [1,2,3,4] 2
2
*Lists> cgtx [1,2,3,4] 3
1
-}

cltx :: [Double] -> Double -> Integer
cltx [] y = 0
cltx (x:xs) y | x < y = 1 + cltx xs y
              | otherwise = cltx xs y
{-
ghci> cltx [-1,3,4] 0
1
ghci> cltx [2,5,6,7] 4
1
ghci> cltx [2,5,6,7] 8
4
-}

gtx :: [Double] -> Double -> [Double]
gtx [] num = []
gtx (x:xs) num | x > num = x : gtx xs num
               | otherwise = gtx xs num 
{-
*Lists> gtx [1,2,3,4] 2s
[3.0,4.0]
*Lists> gtx [1,2,3,4] 1
[2.0,3.0,4.0]
ghci> gtx [] 4
[]
-}

ltx :: [Double] -> Double -> [Double]
ltx [] y = []
ltx (x:xs) y | x < y = x : ltx xs y
             | otherwise = ltx xs y
{-
ghci> ltx [2,5,6,7] 8 
[2.0,5.0,6.0,7.0]
ghci> ltx [2,5,6,7] 4 
[2.0]
ghci> ltx [-1,3,4] 0 
[-1.0]
-}

-- 4.6
{-
*Lists> :t read
read :: Read a => String -> a
*Lists> :t show
show :: Show a => a -> String
*Lists> read "35"
*** Exception: Prelude.read: no parse
*Lists> read "35" :: Int
35
*Lists> show 35
-}

string2int :: [Char] -> Int
string2int str = read str :: Int
{-
*Lists> string2int "234"
234
*Lists> string2int "23401"
23401
-}

string2int' :: String -> Int
string2int' x = read x
{-
*Lists> string2int' "2340"
2340
*Lists> string2int' "234023"
234023
-}

-- 4.7
{-
*Lists> :t sum
sum :: (Num a, Foldable t) => t a -> a
*Lists> :t product
product :: (Num a, Foldable t) => t a -> a
*Lists> sum [1,2,4]
7
*Lists> product [1,2,4]
8
*Lists> [1..67]
[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,3
0,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,
57,58,59,60,61,62,63,64,65,66,67]
*Lists> [n | n <- [1..5]]
[1,2,3,4,5]
-}

suma1 :: Double
suma1 = sum (map (1/) [1..100])
suma1' = sum (map (\ x -> 1/x) [1..100])
suma1'' = sum [1/x | x <- [1..100]]
{-
ghci> suma1
5.187377517639621
ghci> suma1'
5.187377517639621
ghci> suma1''
5.187377517639621
-}

iloczyn1 = product (map (\ x -> (1+x)/(2+x)) [1..50])
iloczyn1' = product [(1+x)/(2+x) | x <- [1..50]]