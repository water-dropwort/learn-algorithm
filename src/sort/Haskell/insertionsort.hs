-- 挿入ソート
import Data.List (insert)

insertionsort :: Ord a => [a] -> [a]
insertionsort [] = []
insertionsort xs = foldl (flip insert) [] xs
