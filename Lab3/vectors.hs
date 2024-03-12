module Vectors
where

type Vector = (Double, Double, Double)

-- 3.9.1
(+.) :: Vector -> Vector -> Vector
(a, b, c) +. (d, e, f) = (a+d, b+e, c+f)
{-
ghci> (9, 5.3, 0) +. (1, 1, 1)
(10.0,6.3,1.0)
ghci> (5, -5.3, 0.99) +. (1, -1, -1)
(6.0,-6.3,-1.0000000000000009e-2)
-}

-- 3.9.2
(-.) :: Vector -> Vector -> Vector
(a, b, c) -. (d, e, f) = (a-d, b-e, c-f)
{-
ghci> (5, -5.3, 0.99) -. (1, -1, -1)
(4.0,-4.3,1.99)
ghci> (9, 5.3, 0) -. (1, 1, 1)      
(8.0,4.3,-1.0)
-}

-- 3.9.3
(*.) :: Vector -> Vector -> Double
(a, b, c) *. (d, e, f) = a*d + b*e + c*f
{-
ghci> (9, 5.3, 0) *. (1, 1, 1)
14.3
ghci> (5, -5.3, 0.99) *. (1, -1, -1)
9.31
-}

-- 3.9.4
(***) :: Vector -> Vector -> Vector
(a, b, c) *** (d, e, f) = (b*f - c*e, c*d - a*f, a*e - b*d)
{-
ghci> (1,2,3) *** (4,5,6)
(-3.0,6.0,-3.0)
ghci> (1,2,3) *** (3,2,-1)
(-8.0,10.0,-4.0)
-}