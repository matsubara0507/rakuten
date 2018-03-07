{-# LANGUAGE DataKinds        #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE TypeOperators    #-}

module Rakuten.Types.Base
    ( ImageUrl
    ) where

import           Data.Extensible
import           Data.Text       (Text)

type ImageUrl = Record '[ "imageUrl" ':>  Text ]
