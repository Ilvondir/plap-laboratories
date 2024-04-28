odwroc :: Num a => [a] -> [a]
odwroc [] = []
odwroc (x:xs) = odwroc xs ++ [x] 

polinomial :: Num a => [a] -> a -> a
polinomial l y = calculate (odwroc l) y

calculate :: Num a => [a] -> a -> a
calculate [] _ = 0
calculate (x:xs) y = x * y^(length xs) + calculate xs y
{-
ghci> polinomial [1,2,-3] 5
-64
ghci> polinomial [1,2,-3] 0.3
1.33
ghci> polinomial [1,2,-3] 0.333333
1.333333333333
-}