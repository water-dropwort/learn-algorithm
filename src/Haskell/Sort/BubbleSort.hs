module Sort.BubbleSort where

-- バブルソート
-- 一番大きい数値から順に、添え字の老い方へ移動する。
bubblesort :: Ord a => [a] -> [a]
bubblesort [] = []
bubblesort xs = let (xs',x) = splitAt (length xs - 1) $ swap xs
                in  bubblesort xs' ++ x
  where
    swap []         = []
    swap [x]        = [x]
    swap (x0:x1:xs) = if x0 < x1 then x0:swap (x1:xs) else x1:swap (x0:xs)

-- 一番小さい数値から順に、添え字の若い方へ移動する。
bubblesort2 :: Ord a => [a] -> [a]
bubblesort2 [] = []
bubblesort2 xs = let (x:xs') = foldr swap [] xs
                 in  x:bubblesort2 xs'
  where
    swap x []      = [x]
    swap x (y0:ys) = if y0 < x then y0:x:ys else x:y0:ys
