module Simulation (
    countTimesCarWon,
    run
) where

import Door(Scenario(..))
import qualified Door

countTimesCarWon :: [Bool] -> Int
countTimesCarWon results = length $ filter (== True) results

run :: Bool -> Scenario -> Bool
run swapDoor scenario
    | swapDoor = Door.containsCar $ Door.swap scenario
    | otherwise = Door.containsCar scenario
