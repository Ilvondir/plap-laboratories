-- 6.1
{-
*Main> :t putStrLn
putStrLn :: String -> IO ()
*Main> :t readLn
readLn :: Read a => IO a
*Main> :t print
print :: Show a => a -> IO ()
*Main> :t read
read :: Read a => String -> a
*Main> :t show
show :: Show a => a -> String
*Main> read "6" :: Integer
6
*Main> read "6" :: Double
6.0
-}

silnia :: Integer -> Integer
silnia n | n == 0 = 1
         | n > 0 = n * silnia (n - 1)
         
main = 
     do putStrLn "Enter natural number:"
        k <- getLine
        let result = silnia (read k)
        putStrLn (k ++ "! = " ++ show result)
        
{-
Enter natural number:
45
45! = 119622220865480194561963161495657715064383733760000000000

Finished. Press any key to exit...

-}