dec2bin :: Int -> [Int]
dec2bin x | x == 0 || x == 1 = [x]
          | otherwise = dec2bin (x `quot` 2) ++ [(x `rem` 2)]
{-
ghci> dec2bin 1
[1]
ghci> dec2bin 0
[0]
ghci> dec2bin 10
[1,0,1,0]
ghci> dec2bin 100
[1,1,0,0,1,0,0]
ghci> dec2bin 1000
[1,1,1,1,1,0,1,0,0,0]
-}