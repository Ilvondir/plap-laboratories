module Main
where

import System.Environment

decemberCount :: [[Char]] -> Int
decemberCount [] = 0
decemberCount ([_,_, a, b, _, _, _, _, _, _, _]:xs)
    | a == '1' && b == '2' = 1 + decemberCount xs
    | otherwise = decemberCount xs
    
pesels = ["86080941169", "83041812338", "75121005045", "74121108598"]
{-
ghci> decemberCount pesels
2
-}

main = do
     [f] <- getArgs
     text <- readFile f
     let num = decemberCount (lines text)
     putStrLn ("Liczba osób urodzonych w grudniu: " ++ show num)
