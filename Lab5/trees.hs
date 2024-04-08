module Trees
where

-- 5.4
data Tree a = Leaf a
            | Node a (Tree a) (Tree a)
            | Null

bt_1 = Null
bt_2 = Leaf 5
bt_3 = Node 5 (Leaf 3) Null
bt_4 = Node 5 Null (Leaf 7)
bt_5 = Node 5 (Leaf 3) (Leaf 7)

-- 5.4.1
treeSize :: Tree a -> Int
treeSize Null = 0
treeSize (Leaf _) = 1
treeSize (Node _ left right) = 1 + treeSize left + treeSize right
{-
*Trees> treeSize bt_1
0
*Trees> treeSize bt_2
1
*Trees> treeSize bt_3
2
*Trees> treeSize bt_4
2
*Trees> treeSize bt_5
3
-}

-- 5.4.2
showTree :: Show a => Tree a -> String
showTree Null = "()"
showTree (Leaf x) = show x
showTree (Node v left right) = show v ++ " L(" ++ showTree left ++ ") R(" ++ showTree right ++ ")"

bt1 = Node 7 (Node 4 (Leaf 2) (Leaf 5)) (Leaf 10)
 
bt2 = Node 7 (Node 4 (Leaf 2) (Leaf 5)) 
             (Node 10 (Leaf 9) (Node 13 (Leaf 11) (Leaf 15)))
 
bt3 = Node 7 (Leaf 1) Null
{-
*Trees> showTree bt1
"7 L(4 L(2) R(5)) R(10)"
*Trees> showTree bt2
"7 L(4 L(2) R(5)) R(10 L(9) R(13 L(11) R(15)))"
*Trees> showTree bt3
"7 L(1) R(())"
-}

-- 5.5
add :: (Ord a) => a -> Tree a -> Tree a
add x Null = Leaf x
add x (Leaf y) | x == y = Leaf y
               | x > y = Node y Null (Leaf x)
               | otherwise = Node y (Leaf x) Null
add x (Node y left right) | x == y = Node y left right
                          | x > y = Node y left (add x right)
                          | otherwise = Node y (add x left) right
{-
*Trees> showTree bt1
"7 L(4 L(2) R(5)) R(10)"
*Trees> showTree (add 6 bt1)
"7 L(4 L(2) R(5 L(()) R(6))) R(10)"
*Trees> showTree (add 8 bt1)
"7 L(4 L(2) R(5)) R(10 L(8) R(()))"
*Trees> showTree (add 8 (add 6 bt1))
"7 L(4 L(2) R(5 L(()) R(6))) R(10 L(8) R(()))"
-}

-- 5.6.1
elemTree :: Ord a => a -> Tree a -> Bool
elemTree x Null = False
elemTree x (Leaf y) | x == y = True
                  | otherwise = False
elemTree x (Node y left right) | x == y = True
                               | x > y = elemTree x right
                               | otherwise = elemTree x left
{-
ghci> elemTree 3 Null
False
ghci> elemTree 3 (Leaf 3)
True
ghci> elemTree 3 (Leaf 5)
False
ghci> elemTree 3 bt1
False
ghci> elemTree 4 bt1
True
-}

-- 5.6.2
countLeaves :: 
countLeaves Null = 0
countLeaves (Leaf _) = 1
countLeaves (Node _ left right) = countLeaves left + countLeaves right
{-
ghci> countLeaves Null
0
ghci> countLeaves (Leaf 4)
1
ghci> countLeaves (add 4 bt1)
3
-}

-- 5.7.1
tree2list :: Tree t -> [t]
tree2list Null = []
tree2list (Leaf x) = [x]
tree2list (Node x left right) = tree2list left ++ [x] ++ tree2list right
{-
*Trees> tree2list bt1
[2,4,5,7,10]
*Trees> tree2list bt2
[2,4,5,7,9,10,11,13,15]
*Trees> tree2list bt3
[1,7]
-}

-- 5.7.2
{-
ghci> let list = [1, 3, 5, 7]
ghci> list
[1,3,5,7]
ghci> length list
4
ghci> length list `div` 2
2
ghci> list !! 2
5
ghci> :t take
take :: Int -> [a] -> [a]
ghci> take 2 list
[1,3]
ghci> :t drop
drop :: Int -> [a] -> [a]
ghci> drop (2+1) list
-}
list2tree :: Ord a => [a] -> Tree a
list2tree [] = Null
list2tree [x] = Leaf x
list2tree l = Node (l !! m) (list2tree (take m l)) (list2tree (drop (m+1) l)) 
    where
        m = length l `div` 2
{-
ghci>  showTree (list2tree [])
"()"
ghci> showTree (list2tree [5])
"5"
ghci> showTree (list2tree [1,3,5,7])
"5 L(3 L(1) R(())) R(7)"
ghci> showTree (add 6 bt1)
"7 L(4 L(2) R(5 L(()) R(6))) R(10)"
ghci> showTree (list2tree (tree2list (add 6 bt1)))
"6 L(4 L(2) R(5)) R(10 L(7) R(()))"
-}


















