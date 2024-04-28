module Exam
where

-- 1.
f1 :: Fractional a => a -> a -> a
f1 a b = a * b
{-
ghci> f1 0 8
0.0
ghci> f1 2 8
16.0
-}

f2 :: Fractional a => a -> a -> a
f2 = (*)
{-
ghci> f2 0 8
0.0
ghci> f2 2 8
16.0
-}

-- 2.
hexDigit :: Char -> Bool
hexDigit x = x `elem` ['0'..'9'] ++ ['a'..'f'] ++ ['A'..'F']
{-
ghci> hexDigit '4'
True
ghci> hexDigit 'A'
True
ghci> hexDigit 'b'
True
ghci> hexDigit 'n'
False
-}

isHexByte :: String -> Bool
isHexByte [] = True
isHexByte (x:xs) | hexDigit x = isHexByte xs
                 | otherwise = False
{-
ghci> isHexByte ""     
True
ghci> isHexByte "A12"
True
ghci> isHexByte "A1D"
True
ghci> isHexByte "aaa4"
True
ghci> isHexByte "aaa4y"
False
-}

-- 3.
type Vector = (Double, Double, Double)

infixr 4 *.
(*.) :: Vector -> Vector -> Double
(a, b, c) *. (d, e, f) = a*d + b*e + c*f
{-
ghci> (1, 2, 3) *. (3, 2, 1)
10.0
ghci> (1, 1, 1) *. (3, 5, 5)
13.0
-}

-- 4.
factors :: Int -> [Int]
factors n = temp n [1..n]
{-
ghci> factors 10
[1,2,5,10]
ghci> factors 100
[1,2,4,5,10,20,25,50,100]
ghci> factors 1000
[1,2,4,5,8,10,20,25,40,50,100,125,200,250,500,1000]
-}

temp n [] = []
temp n (x:xs) | n `mod` x == 0 = x : temp n xs
              | otherwise = temp n xs
{-
ghci> temp 10 [1..10]
[1,2,5,10]
-}

-- 5.
data Tree a = Leaf a
            | Node a (Tree a) (Tree a)
            | Null

bt1 = Null
bt2 = Leaf 6
bt3 = Node 7 (Node 4 (Leaf 2) (Leaf 5)) (Leaf 10)

evenLeafs :: Integral a => Tree a -> [a]
evenLeafs Null = []
evenLeafs (Leaf x) | x `mod` 2 == 0 = [x]
                 | otherwise = []
evenLeafs (Node x left right) | x `mod` 2 == 0 = evenLeafs left ++ [x] ++ evenLeafs right
                              | otherwise = evenLeafs left ++ evenLeafs right
{-
ghci> evenLeafs bt1
[]
ghci> evenLeafs bt2
[6]
ghci> evenLeafs bt3
[2,4,10]
-}