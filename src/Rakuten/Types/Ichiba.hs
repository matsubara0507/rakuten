{-# LANGUAGE DataKinds         #-}
{-# LANGUAGE FlexibleContexts  #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeOperators     #-}

module Rakuten.Types.Ichiba
    ( -- Response JSON Type
      IchibaItems
    , ItemWrap
    , Item
    , IchibaGenres
      -- Genre JSON Type
    , Genre
    , ParentGenre'
    , ParentGenreWrap
    , BrotherGenreWrap
    , ChiledGenreWrap
    , GenreInformation
    , CurrentItemGenre
    , ChiledItemGenre
      -- Tag JSON Type
    , TagWrap
    , TagGroup
    , TagGroupWrap
    , ItemTag
    , ItemTagWrap
    , ItemTagGroup
    , ItemTagGroupWrap
      -- Request Params Type
    , IchibaItemSearchParam
    , IchibaGenreSearchParam
    ) where

import           Data.Extensible
import           Data.Text           (Text)
import           Rakuten.Types.Base  (ImageUrl)
import           Rakuten.Types.Class ()

type IchibaItems =
  Record '[
    "count" ':> Int,
    "page" ':> Int,
    "first" ':> Int,
    "last" ':> Int,
    "hits" ':> Int,
    "carrier" ':> Int,
    "pageCount" ':> Int,
    "Items" ':> [ItemWrap],
    "GenreInformation" ':> [GenreInformation],
    "TagInformation" ':> [ItemTagGroupWrap]
  ]

type ItemWrap = Record '[ "Item" ':> Item ]

type Item =
  Record '[
    "itemName" ':> Text,
    "catchcopy" ':> Text,
    "itemCode" ':> Text,
    "itemPrice" ':> Int,
    "itemCaption" ':> Text,
    "itemUrl" ':> Text,
    "shopUrl" ':> Text,
    "smallImageUrls" ':> [ImageUrl],
    "mediumImageUrls" ':> [ImageUrl],
    "affiliateUrl" ':> Text,
    "shopAffiliateUrl" ':> Text,
    "imageFlag" ':> Int,
    "availability" ':> Int,
    "taxFlag" ':> Int,
    "postageFlag" ':> Int,
    "creditCardFlag" ':> Int,
    "shopOfTheYearFlag" ':> Int,
    "shipOverseasFlag" ':> Int,
    "shipOverseasArea" ':> Text,
    "asurakuFlag" ':> Int,
    "asurakuClosingTime" ':> Text,
    "asurakuArea" ':> Text,
    "affiliateRate" ':> Double,
    "startTime" ':> Text,
    "endTime" ':> Text,
    "reviewCount" ':> Int,
    "reviewAverage" ':> Double,
    "pointRate" ':> Int,
    "pointRateStartTime" ':> Text,
    "pointRateEndTime" ':> Text,
    "giftFlag" ':> Int,
    "shopName" ':> Text,
    "shopCode" ':> Text,
    "genreId" ':> Text,
    "tagIds" ':> [Int]
  ]

type GenreInformation =
  Record '[
    "parent" ':> [ParentGenre'],
    "current" ':> [CurrentItemGenre],
    "chiled" ':> [ChiledItemGenre]
  ]

type ParentGenre' =
  Record '[
    "genreId" ':> Text,
    "genreName" ':> Text,
    "genreLevel" ':> Int
  ]

type CurrentItemGenre =
  Record '[
    "genreId" ':> Text,
    "genreName" ':> Text,
    "itemCount" ':> Int,
    "genreLevel" ':> Int
  ]

type ChiledItemGenre =
  Record '[
    "genreId" ':> Text,
    "genreName" ':> Text,
    "itemCount" ':> Int,
    "genreLevel" ':> Int
  ]

type ItemTagGroupWrap = Record '[ "tagGroup" ':> ItemTagGroup ]

type ItemTagGroup =
  Record '[
    "tagGroupName" ':> Text,
    "tagGroupId" ':> Int,
    "tags" ':> [ItemTagWrap]
  ]

type ItemTagWrap = Record '[ "tag" ':> ItemTag ]

type ItemTag =
  Record '[
    "tagId" ':> Int,
    "tagName" ':> Text,
    "parentTagId" ':> Int,
    "itemCount" ':> Int
  ]

type IchibaGenres =
  Record '[
    "parents" ':> [ParentGenreWrap],
    "current" ':> Genre,
    "brothers" ':> [BrotherGenreWrap],
    "children" ':> [ChiledGenreWrap],
    "tagGroups" ':> [TagGroupWrap]
  ]

type Genre =
  Record '[
    "genreId" ':> Int,
    "genreName" ':> Text,
    "genreLevel" ':> Int
  ]

type ParentGenreWrap = Record '[ "parent" ':> Genre ]

type BrotherGenreWrap = Record '[ "brother" ':> Genre ]

type ChiledGenreWrap = Record '[ "child" ':> Genre ]

type TagGroupWrap = Record '[ "tagGroup" ':> TagGroup ]

type TagGroup =
  Record '[
    "tagGroupName" ':> Text,
    "tagGroupId" ':> Int,
    "tags" ':> [TagWrap]
  ]

type TagWrap = Record '[ "tag" ':> Tag ]

type Tag =
  Record '[
    "tagId" ':> Int,
    "tagName" ':> Text,
    "parentTagId" ':> Int
  ]

type IchibaItemSearchParam =
  Record '[
    "keyword" ':> Text,
    "shopCode" ':> Maybe Text,
    "itemCode" ':> Maybe Text,
    "genreId" ':> Maybe Int,
    "tagId" ':> Maybe Int,
    "hits" ':> Maybe Int,
    "page" ':> Maybe Int,
    "sort" ':> Maybe Text,
    "minPrice" ':> Maybe Int,
    "maxPrice" ':> Maybe Int,
    "availability" ':> Maybe Bool,
    "field" ':> Maybe Bool,
    "carrier" ':> Maybe Bool,
    "imageFlag" ':> Maybe Bool,
    "orFlag" ':> Maybe Bool,
    "NGKeyword" ':> Maybe Text,
    "purchaseType" ':> Maybe Int,
    "shipOverseasFlag" ':> Maybe Bool,
    "shipOverseasArea" ':> Maybe Text,
    "asurakuFlag" ':> Maybe Bool,
    "asurakuArea" ':> Maybe Int,
    "pointRateFlag" ':> Maybe Bool,
    "pointRate" ':> Maybe Int,
    "postageFlag" ':> Maybe Bool,
    "creditCardFlag" ':> Maybe Bool,
    "giftFlag" ':> Maybe Bool,
    "hasReviewFlag" ':> Maybe Bool,
    "maxAffiliateRate" ':> Maybe Double,
    "minAffiliateRate" ':> Maybe Double,
    "hasMovieFlag" ':> Maybe Bool,
    "pamphletFlag" ':> Maybe Bool,
    "appointDeliveryDateFlag" ':> Maybe Bool,
    "genreInformationFlag" ':> Maybe Bool,
    "tagInformationFlag" ':> Maybe Bool
  ]

type IchibaGenreSearchParam =
  Record '[
    "genreId" ':> Int,
    "genrePath" ':> Maybe Bool
  ]
