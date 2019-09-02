{-# LANGUAGE CPP                   #-}
{-# LANGUAGE FlexibleContexts      #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings     #-}

module Rakuten.Test.Class
    ( TestData(..)
    ) where

import           Data.Extensible
import           Data.Functor.Identity (Identity (..))
import           Data.Text             (Text)
import           GHC.TypeLits          (KnownSymbol)

class TestData a where
  testData :: a

instance TestData Int where
  testData = 12345

instance TestData Double where
  testData = 123.456

instance TestData Text where
  testData = "abcdefg"

instance TestData Bool where
  testData = False

instance (Applicative m, TestData a) => TestData (m a) where
  testData = pure testData

instance Forall (KeyTargetAre KnownSymbol TestData) xs => TestData (Record xs) where
  testData = runIdentity $ hgenerateFor
    (Proxy :: Proxy (KeyTargetAre KnownSymbol TestData)) (const $ pure (Field testData))
