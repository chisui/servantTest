{-# LANGUAGE PackageImports #-}
module Api (server, API) where

import           "servant-server" Servant.Server (Server)

import qualified Api.Users as Users 


type API = Users.API

server :: Server API
server = Users.server

