{-# LANGUAGE PackageImports   #-}
{-# LANGUAGE TypeApplications #-}
module Main (main) where

import           "base" Data.Proxy               (Proxy (..))

import           "warp" Network.Wai.Handler.Warp (defaultSettings, runSettings,
                                                  setLogger, setPort)
import           "wai" Network.Wai               (Application)

import           "wai-logger" Network.Wai.Logger (withStdoutLogger)

import           "servant-server" Servant        (serve)


import           "servantExample" Users          (UsersServiceAPI,
                                                  usersServiceHandler)


serveUsers :: Application
serveUsers = serve (Proxy @UsersServiceAPI) usersServiceHandler

main :: IO ()
main = withStdoutLogger serveWithLogger
  where
    serveWithLogger logger
      = let settings = setPort 8080 . setLogger logger $ defaultSettings
         in runSettings settings serveUsers

