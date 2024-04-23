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
        k <- readLn
        print (silnia k)
        
{-
Enter natural number:
4
24

Finished. Press any key to exit...
-}