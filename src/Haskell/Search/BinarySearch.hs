module Search.BinarySearch where

import Data.List (sort)

binarySearch :: Ord a => a -> [a] -> Bool
binarySearch _ [] = False
binarySearch x xs = if sorted_xs!!0 <= x && x <= sorted_xs!!(length xs - 1) then
                      binarySearch' 0 (length xs - 1)
                    else
                      False
  where
    medianindex st en = (st + en) `div` 2
    sorted_xs = sort xs
    binarySearch' st en
      | st > en   = False
      | st == en  = x == sorted_xs!!en
      | otherwise = let med = medianindex st en
                    in  case compare x (sorted_xs!!med) of
                          LT -> binarySearch' st (med-1)
                          EQ -> True
                          GT -> binarySearch' (med+1) en
