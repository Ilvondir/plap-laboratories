module Main
where

{-
*Main> 'a' == 'a'
True
*Main> 'A' == 'a'
False
*Main> 'c' : "at"
"cat"
*Main> let f (x:xs) = (x,xs)
*Main> f "cat"
('c',"at")
-}

{-
Consider two branches of the clear function with flags:

False - to be invoked if the current character is outside an html tag
True  - to be invoked if the current character is inside an html tag
-}

import System.Environment

clear :: String -> Bool -> String
clear [] _ = []
clear (x:xs) False | x == '<' = clear xs True
                   | otherwise = x : clear xs False
clear (x:xs) True | x == '>' = clear xs False
                  | otherwise = clear xs True


main = do
     [input, output] <- getArgs
     html <- readFile input
     let text = clear html True
     writeFile output text


{-
clear :: String -> Bool -> String
clear ...
clear ... False | if we get '<' then we omit it and change the mode of operation
                | otherwise, we add the current char to the result and continue
clear ... True | if we get '>' then we omit it and change the mode of operation
               | otherwise, we omit the current char and continue
-}

{-
*Main> clear "" False
""
*Main> clear "" True
""
*Main> clear "It is a sentence." False
"It is a sentence."
*Main> clear "It is a sentence." True
""
*Main> clear "<p>It is a paragraph." False
"It is a paragraph."
*Main> clear "<p>It is a paragraph." True
"It is a paragraph."
-}
