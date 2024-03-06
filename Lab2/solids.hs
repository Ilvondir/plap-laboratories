module Solids
where

sphereVolume :: Floating a => a -> a  -- obliczenie objetosci kuli
sphereVolume r = 4/3 * pi * r^3

coneVolume :: Floating a => a -> a -> a  -- obliczenie objetosci stozka
coneVolume r h = 1/3 * pi * r^2 * h

cuboidVolume :: Floating a => a -> a -> a -> a  -- obliczenie objetosci prostopadloscianu
cuboidVolume a b h = a * b * h

pyramidVolume :: Floating a => a -> a -> a  -- obliczenie objetosci ostroslupa o podstawie kwadratu
pyramidVolume a h = 1/3 * a^2 * h


-- 2.4, 2.5
{-
ghci> :l solids
[1 of 1] Compiling Solids           ( solids.hs, interpreted )
Ok, one module loaded.
ghci> sphereVolume 3
113.09733552923254
ghci> coneVolume 3 4
37.69911184307752
ghci> cuboidVolume 4 5 2
40.0
ghci> pyramidVolume 4 5
26.666666666666664
-}