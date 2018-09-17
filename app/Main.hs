{-# LANGUAGE PackageImports   #-}
{-# LANGUAGE TypeApplications #-}
module Main (main) where

import           "base" Data.Proxy               (Proxy (..))
import           "warp" Network.Wai.Handler.Warp (defaultSettings, runSettings,
                                                  setLogger, setPort)
import           "wai-logger" Network.Wai.Logger (withStdoutLogger)
import           "quoteService" Quotes           (QuoteServiceAPI,
                                                  quoteServiceHandler)
import           "servant-server" Servant        (serve)


main :: IO ()
main = withStdoutLogger $ \ logger -> let
    settings = setPort 8080 $ setLogger logger defaultSettings
    in runSettings settings app
  where app = serve (Proxy @QuoteServiceAPI) quoteServiceHandler

