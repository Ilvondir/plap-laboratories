-- 1
leg :: Int -> Int -> Int
leg a b | a < b = 1
        | a > b = -1
        | a == b = 0
{-
ghci> leg 4 5
1
ghci> leg 4 (-6)
-1
ghci> leg 4 4   
0
-}

-- 2
type Complex = (Double, Double)
mul :: Complex -> Complex -> Complex
mul (r1, i1) (r2, i2) = (r1*r2 - i1*i2, r1*i2+r2*i1)
{-
ghci> mul (1, 0) (7, 0)
(7.0,0.0)
ghci> mul (1, 1) (7, 0)
(7.0,7.0)
ghci> mul (1, 1) (7, 8)
(-1.0,15.0)
-}

-- 3
odds :: [a] -> [a]
odds [] = []
odds [x] = [x]
odds (x:_:xs) = x : odds xs
{-
ghci> odds []
[]
ghci> odds [5]
[5]
ghci> odds [5, 6, 7, 0, 9, 8]
[5,7,9]
ghci> odds "TO JEST NAPIS"   
"T ETNPS"
-}

-- 4.1
sum1 = sum (map (\i -> 2/(i*i + 1)) [1..2000])
sum1' = foldl (+) 0 [2/(i^2 + 1) | i <- [1..2000]]
{-
ghci> sum1
2.1523483449787726
ghci> sum1'
2.1523483449787726
-}

 -- 4.2
product1 = product (map (\i -> sin i * cos i) [20..45])
product1' = foldl (*) 1 [sin i * cos i | i <- [20..45]]
{-
ghci> product1
1.7351710457045287e-17
ghci> product1'
1.7351710457045287e-17
-}

-- 5
data Tree a = Leaf a
            | Node a (Tree a) (Tree a)
            | Null

bt1 = Null
bt2 = Leaf 5
bt3 = Node 5 (Leaf 4) (Leaf 1)
bt4 = Node 5 (Leaf 4) (Node 5 (Leaf 9) (Leaf 1))

sumTree :: Num a => Tree a -> a
sumTree Null = 0
sumTree (Leaf x) = x
sumTree (Node x left right) = x + sumTree left + sumTree right
{-
ghci> sumTree bt1
0
ghci> sumTree bt2
5
ghci> sumTree bt3
10
ghci> sumTree bt4
24
-}