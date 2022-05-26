module DoorTest(
    tests
) where

import Test.HUnit
import Door

tests :: Test
tests = TestList [
    TestLabel "Swap Scenario" $ TestCase $ assertBool "Swap to lose" $ 1 /= guess (Door.swap Scenario{guess=1, car=1})
    ]
