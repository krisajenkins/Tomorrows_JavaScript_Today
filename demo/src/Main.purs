module Main where

import Prelude

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Data.Date (Date)

data PaymentResponse
  = Paid { receiptId :: String, amount :: Number }
  | CardExpired { expiryDate :: Date, lastFourDigits :: String }
  | HttpError { statusCode :: Int, message :: String }
  | AuthError

handleResponse :: PaymentResponse -> String
handleResponse (Paid {receiptId}) = ?q
handleResponse (CardExpired {lastFourDigits}) = ?q

main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  log "Hello sailor!"
