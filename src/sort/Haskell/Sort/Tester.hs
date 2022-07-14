module Sort.Tester where

import Control.Monad
import Data.List

test :: ([Int] -> [Int]) -> IO ()
test sortfunc = do
  let test_pattern = [([],[])] ++ [([1],[1])]
                     ++ [(input, [1,2,3]) | input <- permutations [1,2,3]]
                     ++ [(input, [1,2,3,4]) | input <- permutations [1,2,3,4]]
                     ++ [(input, [1,1,2,2]) | input <- permutations [1,1,2,2]]
  putStrLn "=== START ==="
  forM test_pattern $ \(input, answer) -> do
    let sorted = sortfunc input
    when (sorted /= answer) $ putStrLn $ concat["Failed to sort. "
                                               , show input, " --> "
                                               , show sorted, "."]
  putStrLn "=== END ==="
