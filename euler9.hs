-- euler9.hs
--
--  $ ghc euler9.hs
--  $ time ./euler9
--  (a,b,c)=(200,375,425); a*b*c=31875000
--  user 0m0.047s
--
-- Jim Mahoney (after lots of web surfing, head banging,
--              and some tips from Isaac Dupree's 2010 code
-- April 2014 | cs.marlboro.edu | MIT License

pythagorean :: Int -> Int -> Int -> Bool
pythagorean a b c = a*a + b*b == c*c

validTriples :: Int -> [(Int, Int, Int)]
validTriples perimeter =
        [(a,b,c) | a <- [1 .. hi], b <- [1 .. hi],
                   let c = perimeter - a - b,
                   c > 0, a < b,
                   pythagorean a b c]
        where hi = quot perimeter 2

answer :: Int -> String
answer perimeter =
       "(a,b,c)=" ++ show((a,b,c)) ++ "; a*b*c=" ++ show(a*b*c)
       where (a,b,c) = head (validTriples perimeter)

main :: IO()
main = putStrLn (answer 1000)
