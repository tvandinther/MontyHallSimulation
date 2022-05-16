module Door (
    Scenario(..),
    containsCar,
    containsCarAfterSwap,
    selectRandom,
    swap
) where

import System.Random ( randomRIO )

data Scenario = Scenario { 
    guess :: Int,
    car :: Int
}

shiftRight :: Int -> Int
shiftRight door = (door + 1) `mod` 3

swapToCar :: Scenario -> Scenario
swapToCar scenario = Scenario{guess=car, car=car}
    where
        Scenario { car=car } = scenario

swapToGoat :: Scenario -> Scenario
swapToGoat scenario = Scenario{guess=shiftRight car, car=car} 
    where
        Scenario { car=car } = scenario

containsCar :: Scenario -> Bool
containsCar scenario = guess == car
    where
        Scenario { guess=guess, car=car } = scenario

containsCarAfterSwap :: Scenario -> Bool
containsCarAfterSwap scenario = containsCar $ swap scenario


swap :: Scenario -> Scenario
swap scenario
    | containsCar scenario = swapToGoat scenario
    | otherwise = swapToCar scenario

selectRandom :: IO Int
selectRandom = randomRIO (0, 2)
