-- |
-- see: https://webservice.rakuten.co.jp/document/#ichibaApi

{-# LANGUAGE OverloadedStrings #-}

module Rakuten.Endpoints.Ichiba
    ( searchIchibaItem
    , searchIchibaGenre
    ) where

import           Data.Monoid      ((<>))
import           Network.HTTP.Req (GET (..), JsonResponse, MonadHttp,
                                   NoReqBody (..), jsonResponse, req, (/:))
import           Rakuten.Client
import           Rakuten.Types

-- |
-- Rakuten Ichiba Item Search API
-- more info: https://webservice.rakuten.co.jp/api/ichibaitemsearch

searchIchibaItem :: (MonadHttp m, Client c) =>
  c -> IchibaItemSearchParam -> m (JsonResponse IchibaItems)
searchIchibaItem c param = req GET url NoReqBody jsonResponse option
  where
    url = baseUrl c /: "IchibaItem" /: "Search" /: "20170706"
    option = mkHeader c <> toParams param

-- |
-- Rakuten Ichiba Genre Search AppId
-- more info: https://webservice.rakuten.co.jp/api/ichibagenresearch

searchIchibaGenre :: (MonadHttp m, Client c) =>
  c -> IchibaGenreSearchParam -> m (JsonResponse IchibaGenres)
searchIchibaGenre c param = req GET url NoReqBody jsonResponse option
  where
    url = baseUrl c /: "IchibaGenre" /: "Search" /: "20140222"
    option = mkHeader c <> toParams param
