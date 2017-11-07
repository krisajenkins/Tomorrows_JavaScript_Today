module Payments where

import           Data.Date (Date)

data PaymentResponse
  = Paid { receiptId :: String
        ,  amount    :: Number}
  | CardExpired { expiryDate     :: Date
               ,  lastFourDigits :: String}
  | HttpError { statusCode :: Int
             ,  message    :: String}
  | AuthError

handleResponse :: PaymentResponse -> String
