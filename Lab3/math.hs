module Math
where

f x | x < -10 = x*x
    | x >= -10 && x < 0 = sin x
    | x >= 0 && x < 2 = sqrt x
    
f' x | x < -10 = x*x
     | x >= -10 && x < 0 = sin x
     | x >= 0 && x < 2 = sqrt x
     | otherwise = undefined

-- 3.2
factorial :: Integral a => a -> a
factorial x | x == 0 = 1
            | otherwise = x * factorial (x - 1)

binomialCoefficient :: Integral a => a -> a -> a
binomialCoefficient n k | 0 <= k && k <= n = factorial n `div` (factorial k * factorial (n - k))
{-
*Math> :l math
[1 of 1] Compiling Math             ( math.hs, interpreted )
Ok, modules loaded: Math.
*Math> factorial -4

<interactive>:21:1:
    Non type-variable argument in the constraint: Num (a -> a)
    (Use FlexibleContexts to permit this)
    When checking that `it' has the inferred type
      it :: forall a. (Integral a, Num (a -> a)) => a -> a
*Math> factorial 1
1
*Math> factorial 5
120
*Math> binomialCoefficient 5 6
*** Exception: math.hs:19:1-96: Non-exhaustive patterns in function binomialCoef
ficient

*Math> binomialCoefficient 5 3
10
*Math> binomialCoefficient 5 2
10
*Math> binomialCoefficient 21 3
1330
-}

-- 3.3
factorial2 :: Integral a => a -> a
factorial2 n | n <= 1 = 1
             | n > 1 = n * factorial2 (n - 2)          
{-
*Math> factorial2 5
15
*Math> factorial2 10
3840
-}

-- 3.4
divides :: Int -> Int -> Bool
divides k n = rem n k == 0
{-
[1 of 1] Compiling Math             ( math.hs, interpreted )
Ok, modules loaded: Math.
*Math> divides 3 9
True
*Math> divides 3 8
False
*Math> divides 10 101
False
*Math> divides 10 10101
False
*Math> divides 10 1010
True
-}

-- 3.5
seq' :: (Integral a, Fractional b) => a -> b
seq' 1 = 3
seq' 2 = 4
seq' n = 0.5 * seq' (n - 1) + 2 * seq' (n - 2)
{-
Prelude> :l math
[1 of 1] Compiling Math             ( math.hs, interpreted )
Ok, modules loaded: Math.
*Math> seq' 1
3.0
*Math> seq' 2
4.0
*Math> seq' 3
8.0
*Math> seq' 4
12.0
-}
seq'' :: (Integral a, Fractional b) => a -> b
seq'' n | n == 1 = 3
        | n == 2 = 4
        | n > 2 = 0.5 * seq'' (n - 1) + 2 * seq'' (n - 2)
{-
ghci> seq'' 1
3.0
ghci> seq'' 2
4.0
ghci> seq'' 3
8.0
ghci> seq'' 4
12.0
-}

-- 3.6
gcd' :: Integral a => a -> a -> a
gcd' a b | rem a b == 0 = b
         | otherwise = gcd' b (rem a b)
{-
ghci> :l math
[1 of 1] Compiling Math             ( math.hs, interpreted )
Ok, one module loaded.
ghci> gcd' 45 4
1
ghci> gcd' 45 5
5
ghci> gcd' 45 15
15
ghci> gcd' 45 12
3
-}

-- 3.7
(><) :: Integral a => a -> a -> Bool
x >< y = gcd x y == 1
{-
*Math> 12 >< 2
False
*Math> 12 >< 1
True
*Math> 12 >< 11
True
*Math> 12 >< 10
False
*Math> 15 >< 11
True
*Math> :t (><)
(><) :: Integral a => a -> a -> Bool
-}