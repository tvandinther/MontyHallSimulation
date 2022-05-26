module Lib
    ( runSimulations
    ) where

import qualified Door
import qualified Simulation
import Door(Scenario(..))
import Text.Printf (printf)
import Control.Monad.IO.Class (MonadIO(liftIO))
import Control.Monad (replicateM)

runSimulations :: Int -> IO ()
runSimulations numberOfSimulations = do
  scenarios <- replicateM numberOfSimulations (
    Door.selectRandom >>= 
      \door1 -> Door.selectRandom >>= 
        \door2 -> return $ Scenario{guess=door1, car=door2})
  let carWinsNoSwap = map (Simulation.run False) scenarios
  let carWinsSwap = map (Simulation.run True) scenarios
  printf "Out of %d simulations:\n" numberOfSimulations
  printf "Car wins no swap: %d\n" (Simulation.countTimesCarWon carWinsNoSwap)
  printf "Car wins swap: %d\n" (Simulation.countTimesCarWon carWinsSwap)
