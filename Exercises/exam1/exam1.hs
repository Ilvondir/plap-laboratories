module Exam
where

-- 1.
infixl 4 ??
(??) :: (Double, Double) -> (Double, Double) -> Bool
(a, b) ?? (c, d) | a == c = True
                 | b == d = True
                 | otherwise = False
{-
ghci> (4, 5) ?? (4, 1)
True
ghci> (4, 1) ?? (6, 1)
True
ghci> (4, 2) ?? (6, 5)
False
-}

-- 2.
oddElements :: [t] -> [t]
oddElements [] = []
oddElements [x] = [x]
oddElements (x:_:xs) = x : oddElements xs
{-
ghci> oddElements []
[]
ghci> oddElements [4]
[4]
ghci> oddElements [4, 5, 6, 7, 8]
[4,6,8]
-}


-- 3.
litera :: Char -> Bool
litera x | x >= 'a' && x <= 'z' = True
         | x >= 'A' && x <= 'Z' = True
         | otherwise = False
{-
ghci> litera 'a'
True
ghci> litera 'b'
True
ghci> litera 'z'
True
ghci> litera 'A'
True
ghci> litera 'B'
True
ghci> litera 'Z'
True
ghci> litera '3'
False
-}

-- 4.1
iloczyn :: Int -> Double
iloczyn 1 = 1
iloczyn n = ((fromIntegral (n + 1)) / (fromIntegral (n ^ 3))) * iloczyn (n - 1)
{-
ghci> iloczyn 1
1.0
ghci> iloczyn 2
0.375
ghci> iloczyn 3
5.555555555555555e-2
-}

-- 4.2
suma :: Int -> Int
suma n = sum (oddElements [1..(2*n-1)])
{-
ghci> suma 1
1
ghci> suma 3
9
ghci> suma 10
100
-}

-- 5.
data Tree a = Leaf a
        | Node a (Tree a) (Tree a)
        | Null

t1 = Null
t2 = Leaf 5
t3 = Node 2 (Null) (Leaf 4)
t4 = Node 10 (Node 5 (Leaf 1) (Leaf 7)) (Node 12 (Leaf 11) (Null))

tree2list :: Tree a -> [a]
tree2list Null = []
tree2list (Leaf x) = [x]
tree2list (Node x left right) = tree2list left ++ [x] ++ tree2list right
{-
ghci> tree2list t1
[]
ghci> tree2list t2
[5]
ghci> tree2list t3
[2,4]
ghci> tree2list t4
[1,5,7,10,11,12]
-}