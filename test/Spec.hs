module Main where

import           Test.Hspec

import qualified Rakuten.Endpoints.IchibaSpec
import           Rakuten.Test.MockServer      (runMockServer)

main :: IO ()
main = hspec spec

spec :: Spec
spec = around_ runMockServer $
  describe "Rakuten.Endpoints.Ichiba" Rakuten.Endpoints.IchibaSpec.spec
