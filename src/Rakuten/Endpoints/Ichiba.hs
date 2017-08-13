{-# LANGUAGE OverloadedStrings #-}

module Rakuten.Endpoints.Ichiba
    ( searchIchibaItem
    ) where

import           Data.Monoid      ((<>))
import           Network.HTTP.Req (GET (..), JsonResponse, MonadHttp,
                                   NoReqBody (..), jsonResponse, req, (/:))
import           Rakuten.Client
import           Rakuten.Types

searchIchibaItem :: (MonadHttp m, Client c) =>
  c -> IchibaItemSearchParam -> m (JsonResponse IchibaItems)
searchIchibaItem c param = req GET url NoReqBody jsonResponse option
  where
    url = baseUrl c /: "IchibaItem" /: "Search" /: "20170706"
    option = baseParam c <> toParams param 
