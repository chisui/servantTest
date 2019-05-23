{-# LANGUAGE DataKinds      #-}
{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DeriveGeneric  #-}
{-# LANGUAGE PackageImports #-}
{-# LANGUAGE TypeOperators  #-}
module Api.Users
    ( API
    , server
    ) where

import           "base" GHC.Generics             (Generic)

import           "text" Data.Text (Text)

import           "aeson" Data.Aeson.Types        (ToJSON, FromJSON)

import           "servant" Servant.API

import           "servant-server" Servant.Server (Server, Handler)


data User = User
    { name :: String
    , age  :: Int
    }
  deriving (Eq, Show, Generic, ToJSON, FromJSON)


type CRUD a = 
         Get '[JSON] [a]
    :<|> Capture "name" Text :> Get '[JSON] a
    :<|> ReqBody '[JSON] a :> Post '[JSON] ()

type API = "users" :> CRUD User

server :: Server API
server = allUsers :<|> singleUser :<|> createUser


allUsers :: Handler [User]
allUsers = pure []

singleUser :: Text -> Handler User
singleUser _ = error ""

createUser :: User -> Handler ()
createUser _ = pure ()
