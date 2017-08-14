module Rakuten.Endpoints.IchibaSpec
    ( main
    , spec
    ) where

import           Data.Default.Class       (Default (def))
import           Network.HTTP.Req         (responseBody, runReq)
import           Rakuten.Endpoints.Ichiba (searchIchibaGenre, searchIchibaItem)
import           Rakuten.Test.Class       (TestData (..))
import           Rakuten.Test.Client      (TestClient (..))
import           Rakuten.Test.MockServer  (runMockServer)
import           Test.Hspec               (Spec, around_, context, describe,
                                           hspec, it, shouldBe)

main :: IO ()
main = hspec spec

spec :: Spec
spec = around_ runMockServer $ do
  describe "searchIchibaItem: endpoint GET /IchibaItem/Search/20170706" $ do
    context "correct responce" $ do
      it "should return IchibaItems response body" $ do
        response <- runReq def $ searchIchibaItem (TestClient def) def
        (responseBody response) `shouldBe` testData
  describe "searchIchibaGenre: endpoint GET /IchibaGenre/Search/20140222" $ do
    context "correct responce" $ do
      it "should return IchibaGenres response body" $ do
        response <- runReq def $ searchIchibaGenre (TestClient def) def
        (responseBody response) `shouldBe` testData
