{-# LANGUAGE CPP                   #-}
{-# LANGUAGE FlexibleContexts      #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE ScopedTypeVariables   #-}
{-# LANGUAGE TypeOperators         #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module Rakuten.Types.Class
    ( ToParam(..)
    , ToParams(..)
    ) where

import           Control.Applicative
import           Data.Bool             (bool)
import           Data.Constraint
import           Data.Default.Class    (Default (..))
import           Data.Extensible
import           Data.Functor.Identity (Identity (..))
import           Data.Monoid           (Endo (..), (<>))
import           Data.String           (fromString)
import           Data.Text             (Text)
import           GHC.TypeLits          (KnownSymbol, symbolVal)
import           Network.HTTP.Req      (QueryParam, (=:))

instance Default a => Default (Identity a) where
  def = Identity def

instance Default Text where
  def = mempty

instance Forall (KeyTargetAre KnownSymbol Default) xs => Default (Record xs) where
  def = runIdentity $ hgenerateFor
    (Proxy :: Proxy (KeyTargetAre KnownSymbol Default)) (const $ pure (Field def))

-- |
-- Helper Type Class of 'QueryParam'

class ToParam a where
  toParam :: (QueryParam param, Monoid param) => Text -> a -> param

instance ToParam Int where
  toParam = (=:)

instance ToParam Double where
  toParam = (=:)

instance ToParam Text where
  toParam _ ""     = mempty
  toParam name txt = name =: txt

instance ToParam Bool where
  toParam name = (=:) name . bool 0 (1 :: Int)

instance ToParam [Text] where
  toParam _ []    = mempty
  toParam name xs = name =: foldl1 (\acc s -> acc <> "," <> s) (fmap show xs)

instance ToParam a => ToParam (Maybe a) where
  toParam = maybe mempty . toParam

instance ToParam a => ToParam (Identity a) where
  toParam name = toParam name . runIdentity

-- |
-- Helper Type Class of 'QueryParam'
-- use to construct request parameter from param type, e.g. 'IchibaItemSearchParam'

class ToParams a where
  toParams :: (QueryParam param, Monoid param) => a -> param

instance Forall (KeyTargetAre KnownSymbol ToParam) xs => ToParams (Record xs) where
  toParams = flip appEndo mempty . hfoldMap getConst . hzipWith
    (\(Comp Dict) -> Const . Endo . (<>) .
      liftA2 toParam (fromString . symbolVal . proxyKeyOf) getField)
    (library :: xs :& Comp Dict (KeyTargetAre KnownSymbol ToParam))
