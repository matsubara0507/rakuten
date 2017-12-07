{-# LANGUAGE DataKinds        #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE TypeOperators    #-}

module Rakuten.Types.Error
    ( RakutenError
    ) where

import           Data.Extensible
import           Data.Text       (Text)

-- |
-- when error, Rakuten is response:
-- {
--     "error": "wrong_parameter",
--     "error_description": "specify valid applicationId"
-- }

type RakutenError =
  Record '[
    "error" ':> Text,
    "error_description" ':> Text
  ]
