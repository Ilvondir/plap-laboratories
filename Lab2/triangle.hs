module Triangle
where

trArea1 :: Floating a => a -> a -> a
trArea1 a h = 1/2 * a * h

trArea2 :: Floating a => a -> a
trArea2 a = (a^2 * sqrt 3) / 4

p :: Floating a => a -> a -> a -> a
p a b c = (a + b + c) / 2

trArea3 :: Floating a => a -> a -> a -> a
trArea3 a b c = sqrt ( (p a b c) * ((p a b c) - a) * ((p a b c) - b) * ((p a b c) - c) )


-- 2.7
{-
ghci> :l triangle
[1 of 1] Compiling Triangle         ( triangle.hs, interpreted )
Ok, one module loaded.
ghci> trArea1 1 1
0.5
ghci> trArea2 1  
0.4330127018922193
ghci> trArea3 1 1 1
0.4330127018922193
-}