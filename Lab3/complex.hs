module Complex
where

-- 3.8.1
{-
z1 = a + b*i  i*i=-1
z2 = c + d*i
z1 + z2 = a + b*i + c + d*i = a + c + (b + d)*i = (a+c, b+d)
-}
infixl 6 +.
(+.) :: (Double, Double) -> (Double, Double) -> (Double, Double)
(a, b) +. (c, d) = (a+c, b+d)
{-
ghci> (3.14, -1) +. (-1, 5)
(2.14,4.0)
ghci> (-9, 10) +. (3, 5)   
(-6.0,15.0)
-}

-- 3.8.2
{-
z1 = a + b*i  i*i=-1
z2 = c + d*i
z1 - z2 = a + b*i - c - d*i = a - c + (b - d)*i = (a-c, b-d)
-}
infixl 6 -.
(-.) :: (Double, Double) -> (Double, Double) -> (Double, Double)
(a, b) -. (c, d) = (a-c, b-d)
{-
ghci> (-9, 10) -. (3, 5)
(-12.0,5.0)
ghci> (0, 1) -. (-3, 1) 
(3.0,0.0)
-}


-- 3.8.3
{-
z1 = (a, b) = a + b*i  i*i=-1
z2 = (c, d) = c + d*i

z1 + z2 = (a + b*i) * (c + d*i) = a*c + a*d*i + c*b*i - b*d
        = a*c - b*d + (c*b + a*d) * i = (a*c - b*d, c*b + a*d)
-}
infixl 7 *.
(*.) :: (Double, Double) -> (Double, Double) -> (Double, Double)
(a, b) *. (c, d) = (a*c - b*d, c*b + a*d)
{-
ghci> (-1, 4) *. (3, 0)
(-3.0,12.0)
ghci> (-1.5, 0.9) *. (1.1, 2)
(-3.45,-2.01)
-}

-- 3.8.4
re :: (Double, Double) -> Double
re (a, b) = a
{-
ghci> re (3, 4)
3.0
ghci> re (-0.1, 0)
-0.1
-}

im :: (Double, Double) -> Double
im (a, b) = b
{-
ghci> im (-0.1, 0)
0.0
ghci> im (3, 4)   
4.0
-}

-- 3.8.5
i :: Fractional a => (a, a)
i = (0, 1)
{-
ghci> i
(0,1)
-}

i' :: (Double, Double)
i' = (0, 1)
{-
ghci> i'
(0.0,1.0)
-}

i'' :: Fractional a => (a, a)
i'' = i
{-
ghci> i''
(0.0,1.0)
-}