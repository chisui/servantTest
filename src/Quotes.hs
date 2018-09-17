{-# LANGUAGE DataKinds      #-}
{-# LANGUAGE DeriveGeneric  #-}
{-# LANGUAGE PackageImports #-}
{-# LANGUAGE TypeOperators  #-}
module Quotes (QuoteServiceAPI, quoteServiceHandler) where

import           "aeson" Data.Aeson.Types        (ToJSON)
import           "base" GHC.Generics             (Generic)
import           "servant" Servant.API           ((:>), Get, JSON)
import           "servant-server" Servant.Server (Server)


data User = User
    { name :: String
    , age  :: Int
    }
  deriving (Eq, Show, Generic)

instance ToJSON User


type QuoteServiceAPI = "users" :> Get '[JSON] User


quoteServiceHandler :: Server QuoteServiceAPI
quoteServiceHandler = pure $ User "asdf" 12

