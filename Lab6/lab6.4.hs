module Main
where

import System.Environment

merge :: Ord a => [a] -> [a] -> [a]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys) | x <= y = x : merge xs (y:ys)
                    | otherwise = y : merge (x:xs) ys

mergeSort :: Ord a => [a] -> [a]
mergeSort xs | len <= 1 = xs
             | otherwise = merge (mergeSort ys) (mergeSort zs)
    where
        len = length xs
        half = len `div` 2
        ys = take half xs
        zs = drop half xs
{-
ghci> mergeSort [2,4,1,(-9), 9, 3, 11]
[-9,1,2,3,4,9,11]
-}

paste :: [[Char]] -> [Char]
paste [x] = x
paste (x:xs) = x ++ "\n" ++ paste xs

main = do
    [input, output] <- getArgs
    text <- readFile input
    let unsorted = lines text
    let sorted = mergeSort unsorted
    let result = paste sorted
    writeFile output result