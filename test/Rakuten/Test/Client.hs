{-# LANGUAGE DataKinds         #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeFamilies      #-}

module Rakuten.Test.Client (
      TestClient(..)
    ) where

import           Data.Text        (Text)
import           Network.HTTP.Req (Scheme (Http), http, port, (=:))
import           Rakuten.Client   (Client (..), RakutenClient)
import           Rakuten.Types    (ToParams (toParams))

newtype TestClient = TestClient RakutenClient

instance Client TestClient where
  type ClientScheme TestClient = 'Http
  baseUrl = const (http "localhost")
  mkHeader (TestClient c) =
    mconcat [port 8000, "format" =: ("json" :: Text), toParams c]
