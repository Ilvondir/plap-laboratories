-- 2.1
{-
*Main> 2^100
1267650600228229401496703205376
*Main> (12+23)*(40-21)
665
*Main> 2^100 / ((12+23)*(40-21))
1.9062415041026007e27
*Main> sqrt 2
1.4142135623730951
*Main> sqrt (12+23)*(40-21)
112.4055158788927
*Main> sqrt ((12+23)*(40-21))
25.787593916455254
*Main> 2 + -3

<interactive>:11:1:
    Precedence parsing error
        cannot mix `+' [infixl 6] and prefix `-' [infixl 6] in the same infix ex
pression
*Main> 2 + (-3)
-1
*Main> :i -
class Num a where
  ...
  (-) :: a -> a -> a
  ...
        -- Defined in `GHC.Num'
infixl 6 -
*Main> :i +
class Num a where
  (+) :: a -> a -> a
  ...
        -- Defined in `GHC.Num'
infixl 6 +

ghci> :i *
type Num :: * -> Constraint
class Num a where
  ...
  (*) :: a -> a -> a
  ...
        -- Defined in `GHC.Num'
infixl 7 *
ghci> :i /
type Fractional :: * -> Constraint
class Num a => Fractional a where
  (/) :: a -> a -> a
  ...
        -- Defined in `GHC.Real'
infixl 7 /
ghci> :i ^
(^) :: (Num a, Integral b) => a -> b -> a       -- Defined in `GHC.Real'
infixr 8 ^
-}

-- 2.2
{-
*Main> rem 1234 2
0
*Main> rem 1234 3
1
*Main> rem 1234 4
2
*Main> 1234 `rem` 3
1

ghci> sqrt 113
10.63014581273465
ghci> rem 113 2
1
ghci> rem 113 3
2
ghci> rem 113 4
1
ghci> rem 113 5
3
ghci> rem 113 6
5
ghci> rem 113 7
1
ghci> rem 113 8
1
ghci> rem 113 9
5
ghci> rem 113 10
3

113 jest liczba pierwsza
-}


-- 2.3
{-
*Main> :t pi
pi :: Floating a => a
*Main> pi
3.141592653589793
*Main> let f x = 2*x + 1
*Main> f 5
11

*Main> let sphereVolume r = 4/3 * pi * r^3
*Main> sphereVolume 1
4.1887902047863905
*Main> sphereVolume 10
4188.790204786391

*Main> let coneVolume r h = 1/3 * pi * r^2 * h
*Main> coneVolume 1 2
2.0943951023931953

ghci> let cuboidVolume a b h = a*b*h
ghci> cuboidVolume 1 3 5
15
-}