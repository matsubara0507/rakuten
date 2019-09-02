module Rakuten.Endpoints.IchibaSpec
    ( spec
    ) where

import           Data.Default.Class       (Default (def))
import           Network.HTTP.Req
import           Rakuten.Endpoints.Ichiba (searchIchibaGenre, searchIchibaItem)
import           Rakuten.Test.Class       (TestData (..))
import           Rakuten.Test.Client      (TestClient (..))
import           Test.Hspec               (Spec, context, describe, it,
                                           shouldBe)

spec :: Spec
spec = do
  describe "searchIchibaItem: endpoint GET /IchibaItem/Search/20170706" $
    context "correct responce" $
      it "should return IchibaItems response body" $ do
        response <- runReq defaultHttpConfig $ searchIchibaItem (TestClient def) def
        responseBody response `shouldBe` testData
  describe "searchIchibaGenre: endpoint GET /IchibaGenre/Search/20140222" $
    context "correct responce" $
      it "should return IchibaGenres response body" $ do
        response <- runReq defaultHttpConfig $ searchIchibaGenre (TestClient def) def
        responseBody response `shouldBe` testData
