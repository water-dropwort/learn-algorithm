module Sort.InsertionSort where

-- 挿入ソート
import Data.List (insert)

insertionsort :: Ord a => [a] -> [a]
insertionsort xs = foldr insert [] xs
