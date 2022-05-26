import Test.HUnit

import DoorTest

main :: IO ()
main = runTestTTAndExit allTests

allTests :: Test
allTests = TestList [TestLabel "Door" DoorTest.tests]

test1 :: Test
test1 = TestCase $ assertEqual "1 + 1 = 2" 3 (1 + 1)