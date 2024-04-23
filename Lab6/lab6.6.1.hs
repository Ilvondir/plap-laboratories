module Main
where

import System.Environment

-- 6.6.1
{-
*Main> :t elem
elem :: (Eq a, Foldable t) => a -> t a -> Bool
*Main> elem 1 [1,3,5]
True
*Main> elem 2 [1,3,5]
False
*Main> let f [a,b,_] = (a,b)
*Main> f "cat"
('c','a')
*Main> f "zonk"
*** Exception: <interactive>:6:5-21: Non-exhaustive patterns in function f

*Main> lines "It is the first line.\nIt is the second line."
["It is the first line.","It is the second line."]
-}

womenCount :: [[Char]] -> Int
womenCount [] = 0
womenCount ([_,_, _, _, _, _, _, _, _, p, _]:xs)
    | elem p ['2', '4', '6', '8', '0'] = 1 + womenCount xs
    | otherwise = womenCount xs
    
pesels = ["86080941169", "83041812338"]
{-
*Main> womenCount pesels
1
-}

womenCount' :: [[Char]] -> Int
womenCount' [] = 0
womenCount' (x:xs)
    | x !! 9 == '0' || x !! 9 == '2' || x !! 9 == '4' || x !! 9 == '6' || x !! 9 == '8' = 1 + womenCount' xs
    | otherwise = womenCount' xs

womenCount'' :: [[Char]] -> Int
womenCount'' [] = 0
womenCount'' (x:xs)
    | elem ((drop 9 x) !! 0) ['2', '4', '6', '8', '0'] = 1 + womenCount'' xs
    | otherwise = womenCount'' xs


main = do
     [f] <- getArgs
     text <- readFile f
     let women = womenCount'' (lines text)
     putStrLn ("Liczba kobiet: " ++ show women)

{-
PS C:\Users\Ilvondir\Desktop\Studia\JiPP\Lab6> ./lab6.6.1 pesel.txt
Liczba kobiet: 74
PS C:\Users\Ilvondir\Desktop\Studia\JiPP\Lab6> ./lab6.6.1 pesel.txt
Liczba kobiet: 74
PS C:\Users\Ilvondir\Desktop\Studia\JiPP\Lab6> ./lab6.6.1 pesel.txt
Liczba kobiet: 74
-}