module Integration
where

-- 5.2
{-
*Main> :i (/)
class Num a => Fractional a where
  (/) :: a -> a -> a
  ...
        -- Defined in `GHC.Real'
infixl 7 /
*Main> (4 :: Int) / (3 :: Fractional)

<interactive>:3:20:
    Expecting one more argument to `Fractional'
    Expected a type,
      but `Fractional' has kind `* -> GHC.Prim.Constraint'
    In an expression type signature: Fractional
    In the second argument of `(/)', namely `(3 :: Fractional)'
    In the expression: (4 :: Int) / (3 :: Fractional)
*Main> :t fromIntegral
fromIntegral :: (Integral a, Num b) => a -> b
*Main> (3 :: Float) / fromIntegral (5 :: Int)
0.6
*Main> fromIntegral (3 :: Int) * (5 :: Float)
15.0
-}

rectangleRule :: (Float -> Float) -> Float -> Float -> Int -> Float
rectangleRule f a b n = h * sum (map (\x -> f x) points)
  where
    h = (b - a) / fromIntegral(n)
    points = [a + fromIntegral(i) * h | i <- [1 .. n]]

integral1 = rectangleRule sin 0 pi 100
integral1' = rectangleRule sin 0 pi 1000

integral2 = rectangleRule sqrt 0 1 100
integral2' = rectangleRule sqrt 0 1 1000

integral3 = rectangleRule (^2) 0 1 100
integral3' = rectangleRule (^2) 0 1 1000

integral4 = rectangleRule (\x -> x^3 + 2*x) 0 2 100
integral4' = rectangleRule (\x -> x^3 + 2*x) 0 2 1000
{-
*Integration> integral1
1.9998356
*Integration> integral1'
1.9999988
*Integration> integral2
0.6714629
*Integration> integral2'
0.6671604
*Integration> integral3
0.33835
*Integration> integral3'
0.33383355
*Integration> integral4
8.120399
*Integration> integral4'
8.012006
-}

trapezoidalRule :: (Double -> Double) -> Double -> Double -> Integer -> Double
trapezoidalRule f a b n = (h / 2) * (f a + f b) + h * sum (map f points)
  where
    h = (b - a) / fromIntegral(n)
    points = [a + fromIntegral(i) * h | i <- [1..n]]

t_integral1 = trapezoidalRule sin 0 pi 100
t_integral1' = trapezoidalRule sin 0 pi 1000

t_integral2 = trapezoidalRule sqrt 0 1 100
t_integral2' = trapezoidalRule sqrt 0 1 1000

t_integral3 = trapezoidalRule (^2) 0 1 100
t_integral3' = trapezoidalRule (^2) 0 1 1000

t_integral4 = trapezoidalRule (\x -> x^3 + 2*x) 0 2 100
t_integral4' = trapezoidalRule (\x -> x^3 + 2*x) 0 2 1000

{-
ghci> t_integral1
1.9998355038874436
ghci> t_integral1'
1.9999983550656624
ghci> t_integral2 
0.6764629471031477
ghci> t_integral2'
0.6676601343936819
ghci> t_integral3 
0.34335000000000004
ghci> t_integral3'
0.33433349999999995
ghci> t_integral4 
8.2404
ghci> t_integral4'
8.024003999999996
-}