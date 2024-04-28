module Integration
where

-- 5.1
infix 5 ~=
(~=) :: Double -> Double -> Bool
a ~= b = abs (b - a) <= 0.001

cubeRoot :: Double -> Double
cubeRoot x = until check calculate 1.0
    where
        check y = (y^3 ~= x)
        calculate y = 1/3 * (2*y + x/(y^2))
{-
ghci> cubeRoot 1
1.0
ghci> cubeRoot 9
2.080103525509573
ghci> cubeRoot 27
3.0000005410641766
ghci> cubeRoot 270
6.463304085080172
ghci> cubeRoot 1000
10.000000145265766
-}

-- 5.2
f1 x = 1 -- (0, 10) 10
f2 x = sin x -- (0, pi) 2
f3 x = sqrt x -- (0, 1) 2/3
f4 x = x^2 -- (0, 1) 1/3
f5 x = x^3 + 2*x -- (0,2) 8

rectangleRule :: (Float -> Float) -> Float -> Float -> Int -> Float
rectangleRule f a b n = h * sum (map (\y -> f y) points) 
    where
        h = (b - a) / fromIntegral n
        points = [a + fromIntegral(i) * h | i <- [1..n]] 
{-
ghci> rectangleRule f1 0 10 1000
10.0
ghci> rectangleRule f2 0 pi 1000
1.9999988
ghci> rectangleRule f3 0 1 1000 
0.6671604
ghci> rectangleRule f4 0 1 1000 
0.33383355
ghci> rectangleRule f5 0 2 1000 
8.012006
-}

trapezoidRule :: (Float -> Float) -> Float -> Float -> Int -> Float
trapezoidRule f a b n = h/2 * (f a + f b) + h * sum (map (\x -> f x) points)
    where
        h = (b - a) / fromIntegral(n)
        points = [a + fromIntegral i * h | i <- [1..n-1]]
{-
ghci> trapezoidRule f1 0 10 1000
10.0
ghci> trapezoidRule f2 0 pi 1000
1.9999988
ghci> trapezoidRule f3 0 1 1000 
0.66666037
ghci> trapezoidRule f4 0 1 1000
0.33333352
ghci> trapezoidRule f5 0 2 1000
8.000006
-}