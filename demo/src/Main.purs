module Main where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, logShow)
import Data.Array ((..))
import Data.Date (Date)
import Data.Generic (class Generic, gShow)
import Data.Traversable (for_)
import Data.Tuple (Tuple(Tuple))

data Answer 
  = Fizz
  | Buzz
  | FizzBuzz
  | Natural Int

derive instance genericAnswer :: Generic Answer

instance showAnswer :: Show Answer where
  show = gShow

------------------------------------------------------------

fizzBuzz :: Int -> Answer
fizzBuzz n =
  case Tuple (mod n 3) (mod n 5) of
    Tuple 0 0 -> FizzBuzz
    Tuple 0 _ -> Fizz
    Tuple _ 0 -> Buzz
    Tuple _ _ -> Natural n

------------------------------------------------------------

main :: forall e. Eff (console :: CONSOLE | e) Unit
main =
  for_ (1..20)
    (fizzBuzz >>> logShow)
