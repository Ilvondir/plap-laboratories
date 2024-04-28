module Trees
where

data Tree a = Leaf a
            | Node a (Tree a) (Tree a)
            | Null

bt1 = Null
bt2 = Leaf 5
bt3 = Node 5 (Leaf 1) (Leaf 11)
bt4 = Node 10 (Node 6 (Leaf 2) (Leaf 7)) (Node 14 (Leaf 12) (Leaf 17))


-- 6.
leafs :: Tree a -> [a]
leafs Null = []
leafs (Leaf x) = [x]
leafs (Node x left right) = leafs left ++ leafs right
{-
ghci> leafs bt1
[]
ghci> leafs bt2
[5]
ghci> leafs bt3
[1,11]
ghci> leafs bt4
[2,7,12,17]
-}

-- 7.
cgtx4tree :: (Num a, Ord a1) => a1 -> Tree a1 -> a
cgtx4tree _ Null = 0
cgtx4tree x (Leaf y) | y > x = 1
                     | otherwise = 0
cgtx4tree x (Node y left right) | y > x = 1 + cgtx4tree y left + cgtx4tree y right
                                | otherwise = cgtx4tree y left + cgtx4tree y right
{-
ghci> cgtx4tree 10 bt1
0
ghci> cgtx4tree 10 bt2
0
ghci> cgtx4tree 10 bt3
1
ghci> cgtx4tree 10 bt4
3
-}

-- 8.
gtx4tree :: Ord a => a -> Tree a -> [a]
gtx4tree x Null = []
gtx4tree x (Leaf y) | y > x = [y]
                    | otherwise = []
gtx4tree x (Node y left right) | y > x = gtx4tree x left ++ [y] ++ gtx4tree x right
                               | otherwise = gtx4tree x left ++ gtx4tree x right
{-
ghci> gtx4tree 10 bt1
[]
ghci> gtx4tree 10 bt2
[]
ghci> gtx4tree 10 bt3
[11]
ghci> gtx4tree 10 bt4
[12,14,17]
-}

-- 9.
cgtx4leafs :: (Num a, Ord a1) => a1 -> Tree a1 -> a
cgtx4leafs _ Null = 0
cgtx4leafs x (Leaf y) | y > x = 1
                      | otherwise = 0
cgtx4leafs x (Node _ left right) = cgtx4leafs x left + cgtx4leafs x right
{-
ghci> cgtx4leafs 10 bt1
0
ghci> cgtx4leafs 10 bt2
0
ghci> cgtx4leafs 10 bt3
1
ghci> cgtx4leafs 10 bt4
2
-}

-- 10.
gtx4leafs :: Ord a => a -> Tree a -> [a]
gtx4leafs _ Null = []
gtx4leafs x (Leaf y) | y > x = [y]
                     | otherwise = []
gtx4leafs x (Node _ left right) = gtx4leafs x left ++ gtx4leafs x right
{-
ghci> gtx4leafs 10 bt1 
[]
ghci> gtx4leafs 10 bt2
[]
ghci> gtx4leafs 10 bt3
[11]
ghci> gtx4leafs 10 bt4
[12,17]
-}

-- 11.
equal :: Eq a => Tree a -> Tree a -> Bool
equal Null Null = True
equal (Leaf a) (Leaf b) = a == b
equal (Node a1 left1 right1) (Node a2 left2 right2) = a1 == a2 && equal left1 left2 && equal right1 right2
equal _ _ = False
{-
ghci> equal bt1 bt3
False
ghci> equal bt1 bt2
False
ghci> equal bt3 bt4
False
ghci> equal bt4 bt4
True
-}

-- 12.
ordered :: Ord a => Tree a -> Bool
ordered Null = True
ordered (Leaf _) = True
ordered (Node a Null Null) = True
ordered (Node a Null right) = a < root right && ordered right
ordered (Node a left Null) = a > root left && ordered left
ordered (Node a left right) = a > root left && a < root right && ordered left && ordered left

root :: Tree t -> t
root Null = error "there is no root in empty tree"
root (Leaf x) = x
root (Node x _ _) = x
{-
ghci> ordered bt1
True
ghci> ordered bt2
True
ghci> ordered bt3
True
ghci> ordered bt4
True
ghci> ordered (Node 10 (Leaf 3) (Leaf 9))
False
-}