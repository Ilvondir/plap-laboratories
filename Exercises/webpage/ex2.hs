horner :: Num a => [a] -> a -> a
horner [] p = 0
horner (x:xs) p = x + p * horner xs p
{-
ghci> horner [] 4      
0
ghci> horner [5] 4     
5
ghci> horner [4,-1,3] 5
74
ghci> horner [4,-1,3] 1
6
-}

horner' xs p = foldr (\a x -> a + p*x) 0 xs
{-
ghci> horner' [4,-1,3] 1
6
ghci> horner' [4,-1,3] 5
74
ghci> horner' [4] 5     
4
ghci> horner' [] 5 
0
-}