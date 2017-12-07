{-# LANGUAGE DataKinds        #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE TypeFamilies     #-}
{-# LANGUAGE TypeOperators    #-}

{-# OPTIONS_GHC -fno-warn-unused-binds #-}

module Rakuten.Test.MockServer
    ( mockServer
    , runMockServer
    ) where

import           Control.Concurrent
import           Control.Exception
import           Network.Wai.Handler.Warp
import           Rakuten.Test.Class
import           Rakuten.Types
import           Servant

type RakutenHeader a = a

type API = "IchibaItem" :> "Search" :> "20170706" :> Get '[JSON] (RakutenHeader IchibaItems)
      :<|> "IchibaGenre" :> "Search" :> "20140222" :> Get '[JSON] (RakutenHeader IchibaGenres)

api :: Proxy API
api = Proxy

server :: Server API
server = searchIchibaItem
    :<|> searchIchibaGenre
  where
    searchIchibaItem = return testData
    searchIchibaGenre = return testData

mockServer :: IO ()
mockServer = run 8000 (serve api server)

runMockServer :: IO () -> IO ()
runMockServer action = do
  tid <- forkIO mockServer
  action `finally` killThread tid
