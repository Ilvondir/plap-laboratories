module Math
where

cubeRoot :: Double -> Double -> Double
cubeRoot x tolerance = until accepted improve 1
        where
            accepted y = abs (y^3 - x) <= tolerance 
            improve y = 1/3 * (2*y + x/(y^2))