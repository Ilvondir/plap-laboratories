-- a
notBin :: Int -> Bool
notBin b = b /= 0 && b /= 1

bin2dec :: [Int] -> Int
bin2dec [] = 0
bin2dec (x:xs) | not (notBin x) = bin2dec xs + x * 2^(length xs)
               | otherwise = error "Not a binary number"
{-
ghci> bin2dec []                
0
ghci> bin2dec [1]
1
ghci> bin2dec [1, 1, 0, 1]
13
ghci> bin2dec [1, 1, 0, 3]
*** Exception: Not a binary number
CallStack (from HasCallStack):
  error, called at ex4.hs:7:30 in main:Main
-}

-- b
isGood :: [Int] -> Bool
isGood [] = True
isGood (x:xs) | notBin x = False
              | otherwise = isGood xs

bin2dec' :: [Int] -> Int
bin2dec' xs | isGood xs = foldl (\acc x -> acc * 2 + x) 0 xs
            | otherwise = error "Not a binary number"
{-
ghci> bin2dec' []  
0
ghci> bin2dec' [1] 
1
ghci> bin2dec' [1, 1, 0, 1]
13
ghci> bin2dec' [1, 1, 0, 3]
*** Exception: Not a binary number
CallStack (from HasCallStack):
  error, called at ex4.hs:30:27 in main:Main
-}

