module Exam
where

-- 1.
ltx :: [Double] -> Double -> [Double]
ltx [] x = []
ltx (y:ys) x  | y < x = y : ltx ys x 
             | otherwise = ltx ys x 
{-
ghci> ltx [] 5
[]
ghci> ltx [1,4,6,9] 0
[]
ghci> ltx [1,4,6,9] 6
[1.0,4.0]
ghci> ltx [1,4,6,9] 10
[1.0,4.0,6.0,9.0]
-}

-- 2.
data Tree a = Leaf a
            | Node a (Tree a) (Tree a)
            | Null

bt1 = Null
bt2 = Leaf 5
bt3 = Node 5 (Leaf 2) (Leaf 11)
bt4 = Node 10 (Node 6 (Leaf 2) (Leaf 9)) (Node 15 (Leaf 12) (Leaf 20))

ltx4tree :: Ord t => Tree t -> t -> [t]
ltx4tree Null _ = []
ltx4tree (Leaf y) x | x > y = [y]
                    | otherwise = []
ltx4tree (Node y left right) x | x > y = ltx4tree left x ++ [y] ++ ltx4tree right x
                               | otherwise = ltx4tree left x ++ ltx4tree right x
{-
ghci> ltx4tree bt1 6
[]
ghci> ltx4tree bt2 6
[5]
ghci> ltx4tree bt2 5
[]
ghci> ltx4tree bt3 5
[2]
ghci> ltx4tree bt3 6
[2,5]
ghci> ltx4tree bt4 6
[2]
ghci> ltx4tree bt4 14
[2,6,9,10,12]
-}