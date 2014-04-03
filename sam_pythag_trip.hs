-- sam_pythag_trip.hs
--
-- finds a pythagorean triples that sums to 1000 as well as its product
-- sam judson | programming workshop | marlboro college | April 2014
--
-- compiling and running on csmarlboro :
--    $ ghc -V
--    The Glorious Glasgow Haskell Compilation System, version 7.4.1
--    $ ghc sam_pythag_trip.hs 
--    [1 of 1] Compiling Main             ( sam_pythag_trip.hs, sam_pythag_trip.o )
--    Linking sam_pythag_trip ...
--    $ ./sam_pythag_trip 
--    Found: 200 + 375 + 425 = 1000 , and 200 * 375 * 425 = 31875000
--

import Data.List
import System.IO

------------------------------------------------------------
--- Recursive Iteration Through Possible Pythag. Triples ---
------------------------------------------------------------

iterateB :: Int -> Int -> (Int, Int)
iterateB a b 
  | a*a + b*b == c*c && a + b + c == 1000 = (b, c)
  | b < 1000 = iterateB a (b+1)
  | otherwise = (b, 0)
  where c = 1000 - a - b

iterateA :: Int -> [Int]
iterateA a =
  let bc = (iterateB a a)
  in if (snd bc) /= 0
     then [a, fst bc, snd bc]
     else iterateA (a + 1)

----------------------------------
--- String Formatting and Main ---
----------------------------------

formatAddString :: [Int] -> String
formatAddString res =
  "Found: " ++ restr !! 0 ++ " + " ++ restr !! 1 ++ " + " ++ restr !! 2 ++ " = 1000 "
  where restr = map show res

formatMultiString :: [Int] -> String
formatMultiString res =
  ", and " ++ restr !! 0 ++ " * " ++ restr !! 1 ++ " * " ++ restr !! 2 ++ " = " ++ show(product res)
  where restr = map show res

main :: IO()
main =
  let res = iterateA 1
  in putStrLn ((formatAddString res) ++ (formatMultiString res))
