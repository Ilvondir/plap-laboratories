-- 3.1
{-
*Main> not True
False
*Main> True && False
False
*Main> True || False
True
*Main> let f1 x | x == 0 = "zero"
*Main> f1 3
"*** Exception: <interactive>:6:5-26: Non-exhaustive patterns in function f1

*Main> f1 0
"zero"
*Main> let f2 x = if x == 0 then "zero" else undefined
*Main> f2 3
"*** Exception: Prelude.undefined
*Main> f2 1
"*** Exception: Prelude.undefined
*Main> f2 0
"zero"
*Main> :t otherwise
otherwise :: Bool
*Main> otherwise
True
*Main> :l math
[1 of 1] Compiling Math             ( math.hs, interpreted )
Ok, modules loaded: Math.
*Math> f (-13)
169.0
*Math> f (-pi)
-1.2246063538223773e-16
*Math> f 1
1.0
*Math> 5
5
*Math> f 5
*** Exception: math.hs:(4,1)-(6,30): Non-exhaustive patterns in function f
-}

-- 3.4
{-
*Main> :t rem
rem :: Integral a => a -> a -> a
*Main> rem 3 2
1
*Main> rem 3 1
0
*Main> rem 3 3
0
-}

-- 3.7
{-
*Main> 3 * 5
15
*Main> (*) 3 5
15
*Main> :t gcd
gcd :: Integral a => a -> a -> a
*Main> gcd 12 5
1
*Main> gcd 12 6
6
*Main> gcd 15 6
3
-}