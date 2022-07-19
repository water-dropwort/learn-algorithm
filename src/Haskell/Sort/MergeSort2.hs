-- bottom up merge sort
module Sort.MergeSort2 where

import Sort.MergeSort (merge)

mergesort2 :: Ord a => [a] -> [a]
mergesort2 [] = []
mergesort2 xs = head $ merge' $ map (:[]) xs

merge' :: Ord a => [[a]] -> [[a]]
merge' [] = []
merge' [x] = [x]
merge' (x:y:xs) = merge' $ (merge x y) : merge' xs
