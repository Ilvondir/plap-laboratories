module Exam
where

-- 1.
data Quadrant = I | II | III | IV deriving Show
quadrant :: (Double, Double) -> Quadrant -> Bool
quadrant (0, 0) _ = error("the point lies on the origin")
quadrant (0, _) _ = error("the point lies on the axis Y")
quadrant (_, 0) _ = error("the point lies on the axis X")
quadrant (x, y) I | x > 0 && y > 0 = True
                  | otherwise = False
quadrant (x, y) II | x < 0 && y > 0 = True
                   | otherwise = False
quadrant (x, y) III | x < 0 && y < 0 = True
                    | otherwise = False
quadrant (x, y) IV | x > 0 && y < 0 = True
                   | otherwise = False
{-
ghci> quadrant (1, 1) I
True
ghci> quadrant (1, 1) II
False
ghci> quadrant (-1, 1) II
True
ghci> quadrant (-1, -1) III
True
ghci> quadrant (1, -1) IV  
True
ghci> quadrant (1, 4) IV 
False
-}

-- 2.1
evenElements :: [t] -> [t]
evenElements [] = []
evenElements [x] = []
evenElements (_:x:xs) = x : evenElements xs

suma :: Int -> Int
suma n = sum (evenElements [1..(2*n)])
{-
ghci> suma 0
0
ghci> suma 1
2
ghci> suma 3
12
ghci> suma 4
20
ghci> suma 5
30
-}

-- 2.2
suma2 :: Int -> Double
suma2 0 = 0
suma2 n = 1 / fromIntegral (n ^2) + suma2 (n-1)
{-
ghci> suma2 0
0.0
ghci> suma2 1
1.0
ghci> suma2 10
1.5497677311665408
ghci> suma2 1100
1.6440253890370577
-}

-- 3.
cyfra :: Char -> Int
cyfra c | c >= '0' && c <= '9' = read [c]
        | otherwise = error("not a digit")
{-
ghci> cyfra '4'
4
ghci> cyfra '8'
8
ghci> cyfra 'a'
*** Exception: not a digit
CallStack (from HasCallStack):
  error, called at exam2.hs:72:23 in main:Exam
-}

-- 4.
odwroc :: String -> String
odwroc [] = []
odwroc (x:xs) = odwroc xs ++ [x]
{-
ghci> odwroc ""    
""
ghci> odwroc "To jest palindrom"
"mordnilap tsej oT"
ghci> odwroc "kajak"             
"kajak"
-}

-- 5.
data Tree a = Leaf a
            | Node a (Tree a) (Tree a)
            | Null

bt1 = Null
bt2 = Leaf 5
bt3 = Node 4 (Leaf 1) (Leaf 11)
bt4 = Node 10 (Node 5 (Leaf 1) (Leaf 8)) (Node 15 (Leaf 12) (Leaf 40))

elemTree :: Ord t => Tree t -> t -> Bool
elemTree Null _ = False
elemTree (Leaf x) y | x == y = True
                    | otherwise = False
elemTree (Node x left right) y | x == y = True
                               | x > y = elemTree left y
                               | otherwise = elemTree right y
{-
ghci> elemTree bt1 5 
False
ghci> elemTree bt2 5 
True
ghci> elemTree bt3 5 
False
ghci> elemTree bt4 40
True
ghci> elemTree bt4 41
False
-}