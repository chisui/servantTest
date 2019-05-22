{-# LANGUAGE DataKinds      #-}
{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DeriveGeneric  #-}
{-# LANGUAGE PackageImports #-}
{-# LANGUAGE TypeOperators  #-}
module Users 
  ( UsersServiceAPI
  , usersServiceHandler
  ) where

import           "base" GHC.Generics             (Generic)

import           "aeson" Data.Aeson.Types        (ToJSON)

import           "servant" Servant.API           ((:>), Get, JSON)

import           "servant-server" Servant.Server (Server)


data User = User
    { name :: String
    , age  :: Int
    }
  deriving (Eq, Show, Generic, ToJSON)


type UsersServiceAPI = "users" :> Get '[JSON] User


usersServiceHandler :: Server UsersServiceAPI
usersServiceHandler = pure User{ name = "asdf", age = 12 }

