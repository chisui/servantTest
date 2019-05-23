{-# LANGUAGE EmptyDataDecls             #-}
{-# LANGUAGE FlexibleContexts           #-}
{-# LANGUAGE GADTs                      #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses      #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE QuasiQuotes                #-}
{-# LANGUAGE DeriveGeneric              #-}
{-# LANGUAGE TemplateHaskell            #-}
{-# LANGUAGE TypeFamilies               #-}
{-# LANGUAGE PackageImports             #-}
module Db.User where

import           "persistent-template" Database.Persist.TH 
  (share, mkPersist, sqlSettings, mkMigrate, persistLowerCase)


share [mkPersist sqlSettings, mkMigrate "migrateAll"] [persistLowerCase|
  User
    name String
    age Int Maybe
    deriving Eq
    deriving Ord
    deriving Show
|]
