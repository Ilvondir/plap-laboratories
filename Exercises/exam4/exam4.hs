module Exam
where

import Data.Char

-- 1.
f1 :: Double -> Double
f1 a = (a^2 * sqrt 3) / 4
{-
ghci> f1 0
0.0
ghci> f1 2
1.7320508075688772
ghci> f1 5
10.825317547305483
-}

f2 :: Double -> Double
f2 = (/ 4) . (* sqrt 3) . (^2)
{-
ghci> f2 0
0.0
ghci> f2 2
1.7320508075688772
ghci> f2 5
10.825317547305483
-}

-- 2.
dec :: Char -> Int
dec x | elem x ['0'..'9'] = ord x - ord '0'
      | elem x ['A'..'F'] = ord x - ord 'A' + 10
      | otherwise = error("Not a hex digit")
{-
ghci> dec '0'
0
ghci> dec '2'
2
ghci> dec '9'
9
ghci> dec 'A'
10
ghci> dec 'B'
11
ghci> dec 'F'
15
-}

byte2int :: String -> Int
byte2int [] = 0
byte2int (x:xs) = (dec x) * (16 ^ length xs) + byte2int xs
{-
ghci> byte2int ""   
0
ghci> byte2int "12"
18
ghci> byte2int "1A"
26
ghci> byte2int "AAA"
2730
-}

-- 3.
infixl 7 *.
(*.) :: (Double, Double) -> (Double, Double) -> (Double, Double)
(a, b) *. (c, d) = (a*c - b*d, a*d + b*c)
{-
ghci> (1, 2) *. (1, 0)
(1.0,2.0)
ghci> (1, 2) *. (2, 0)
(2.0,4.0)
ghci> (1, 2) *. (2, 5)
(-8.0,9.0)
-}

-- 4.
digits :: Int -> Int
digits x | x >= 0 && x <= 9 = 1
digits x = 1 + digits (x `quot` 10)
{-
ghci> digits 0  
1
ghci> digits 34
2
ghci> digits 3400
4
-}

-- 5.
data Tree a = Leaf a
            | Node a (Tree a) (Tree a)
            | Null

bt1 = Null
bt2 = Leaf 5
bt3 = Node 7 (Node 4 (Leaf 2) (Leaf 5)) (Leaf 10)

addOddNodes :: Integral a => Tree a -> a
addOddNodes Null = 0
addOddNodes (Leaf x) | x `mod` 2 == 1 = x
                     | otherwise = 0
addOddNodes (Node x left right) | x `mod` 2 == 1 = x + addOddNodes left + addOddNodes right
                                | otherwise = addOddNodes left + addOddNodes right
{-
ghci> addOddNodes bt1 
0
ghci> addOddNodes bt2
5
ghci> addOddNodes bt3
12
-}
