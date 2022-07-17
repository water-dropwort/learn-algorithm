module Sort.QuickSort2 where

quicksort2 :: Ord a => [a] -> [a]
quicksort2 [] = []
quicksort2 [x] = [x]
quicksort2 xs = let (ls,ms,rs) = foldl partition ([],[],[]) xs
                in  quicksort2 ls ++ (ms ++ quicksort2 rs)
  where
    pivot = med (head xs) (xs!!(length xs`div`2)) (last xs)
    partition (ls,ms,rs) x
      | x <  pivot = (x:ls,ms  ,rs  )
      | x == pivot = (ls  ,x:ms,rs  )
      | x >  pivot = (ls  ,ms  ,x:rs)

med :: Ord a => a -> a -> a -> a
med x y z = if x < y then
              if y < z then y else if z < x then x else z
            else
              if z < y then y else if x < z then x else z 

