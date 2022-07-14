-- 選択ソート
import Data.List (delete)

selectionsort :: Ord a => [a] -> [a]
selectionsort xs = case xs of
  [] -> []
  _  -> let x = minimum xs in x : (selectionsort $ delete x xs)
