quicksort :: Ord a => [a] -> [a]
quicksort []     = []
quicksort [x]    = [x]
quicksort (pivot:xs) = let (ls,rs) = foldr (partition (<pivot)) ([],[]) xs
                       in  (quicksort ls) ++ pivot:(quicksort rs)
  where
    partition pred x (ls,rs) = if pred x then (x:ls,rs) else (ls,x:rs)
