module Sort.MergeSort where

-- マージソート

mergesort :: Ord a => [a] -> [a]
mergesort [] = []
mergesort [x] = [x]
mergesort xs = let (l,r) = splitAt (length xs `div` 2) xs
               in  merge (mergesort l) (mergesort r)

merge :: Ord a => [a] -> [a] -> [a]
merge ls [] = ls
merge [] rs = rs
merge ls@(l0:l) rs@(r0:r) = if l0 < r0 then l0:merge l rs else r0:merge ls r
