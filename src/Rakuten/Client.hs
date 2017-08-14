{-# LANGUAGE DataKinds            #-}
{-# LANGUAGE FlexibleContexts     #-}
{-# LANGUAGE FlexibleInstances    #-}
{-# LANGUAGE KindSignatures       #-}
{-# LANGUAGE OverloadedLabels     #-}
{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE TypeFamilies         #-}
{-# LANGUAGE TypeOperators        #-}
{-# LANGUAGE TypeSynonymInstances #-}

module Rakuten.Client (
      AppId
    , RakutenClient
    , defaultRaktenClient
    , Client(..)
    ) where

import           Control.Lens       hiding ((:>))
import           Data.Default.Class (Default (def))
import           Data.Extensible
import           Data.Function      ((&))
import           Data.Text          (Text)
import           Network.HTTP.Req   (Option, Scheme (Https), Url, https, (/:),
                                     (=:))
import           Rakuten.Types

type AppId = Text

type RakutenClient =
  Record '[
    "applicationId" ':> Text,
    "affiliateId" ':> Maybe Text,
    "callback" ':> Maybe Text,
    "elements" ':> [Text]
  ]

defaultRaktenClient :: AppId -> RakutenClient
defaultRaktenClient appId = def & #applicationId .~ appId

-- |
-- By using type class, the same functions can be used for mock servers and local hosts.
class Client a where
  type ClientScheme a :: Scheme
  baseUrl :: a -> Url (ClientScheme a)
  mkHeader :: a -> Option scheme

instance Client RakutenClient where
  type ClientScheme RakutenClient = 'Https
  baseUrl = const (https "app.rakuten.co.jp" /: "services" /: "api")
  mkHeader = mappend ("format" =: ("json" :: Text)) . toParams
