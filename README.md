# rakuten
The Rakuten API for Haskell

## example

```Haskell
$ stack ghci
>> :set -XOverloadedStrings
>> :set -XOverloadedLabels
>> :module Rakuten Network.HTTP.Req Data.Function Control.Lens Data.Default.Class
>> c = defaultRaktenClient "XXXXX"
>> response <- runReq def $ searchIchibaItem c (def & #keyword .~ "Rakuten")
>> print $ responseBody response
```

## Implemented Endpoints

- [ ] [Rakuten Ichiba API](https://webservice.rakuten.co.jp/document/#ichibaApi)
    - [x] [Rakuten Ichiba Item Search](https://webservice.rakuten.co.jp/api/ichibaitemsearch)
    - [x] [Rakuten Ichiba Genre Search](https://webservice.rakuten.co.jp/api/ichibagenresearch)
    - [ ] [Rakuten Ichiba Tag Search](https://webservice.rakuten.co.jp/api/ichibatagsearch)
    - [ ] [Rakuten Ichiba Item Ranking](https://webservice.rakuten.co.jp/api/ichibaitemranking)
    - [ ] [Rakuten Item Code Search](https://webservice.rakuten.co.jp/api/itemcodesearch)
    - [ ] [Rakuten Product Search](https://webservice.rakuten.co.jp/api/productsearch)
- [ ] [Rakuten Books API](https://webservice.rakuten.co.jp/document/#bookApi)
    - [ ] [Rakuten Books Total Search](https://webservice.rakuten.co.jp/api/bookstotalsearch)
    - [ ] [Rakuten Books Book Search](https://webservice.rakuten.co.jp/api/booksbooksearch)
    - [ ] [Rakuten Books CD Search](https://webservice.rakuten.co.jp/api/bookscdsearch)
    - [ ] [Rakuten Books DVD Search](https://webservice.rakuten.co.jp/api/booksdvdsearch)
    - [ ] [Rakuten Books Foreign Book Search](https://webservice.rakuten.co.jp/api/booksforeignbooksearch)
    - [ ] [Rakuten Books Magazine Search](https://webservice.rakuten.co.jp/api/booksmagazinesearch)
    - [ ] [Rakuten Books Game Search](https://webservice.rakuten.co.jp/api/booksgamesearch)
    - [ ] [Rakuten Books Software Search](https://webservice.rakuten.co.jp/api/bookssoftwaresearch)
    - [ ] [Rakuten Books Genre Search](https://webservice.rakuten.co.jp/api/booksgenresearch)
- [ ] [Rakuten Travel API](https://webservice.rakuten.co.jp/document/#travelApi)
    - [ ] [Rakuten Travel Simple Hotel Search](https://webservice.rakuten.co.jp/api/simplehotelsearch)
    - [ ] [Rakuten Travel Hotel Detail Search](https://webservice.rakuten.co.jp/api/hoteldetailsearch)
    - [ ] [Rakuten Travel Vacant Hotel Search](https://webservice.rakuten.co.jp/api/vacanthotelsearch)
    - [ ] [Rakuten Travel Get Area Class](https://webservice.rakuten.co.jp/api/getareaclass)
    - [ ] [Rakuten Travel Keyword Hotel Search](https://webservice.rakuten.co.jp/api/keywordhotelsearch)
    - [ ] [Rakuten Travel Get Hotel Chain List](https://webservice.rakuten.co.jp/api/gethotelchainlist)
    - [ ] [Rakuten Travel Hotel Ranking](https://webservice.rakuten.co.jp/api/hotelranking)
- [ ] [Rakuten Favorite Bookmark API](https://webservice.rakuten.co.jp/document/#favoriteBookmarkApi)
    - [ ] [Rakuten Favorite Bookmark List](https://webservice.rakuten.co.jp/api/favoritebookmarklist)
    - [ ] [Rakuten Favorite Bookmark Add](https://webservice.rakuten.co.jp/api/favoritebookmarkadd)
    - [ ] [Rakuten Favorite Bookmark Delete](https://webservice.rakuten.co.jp/api/favoritebookmarkdelete)
- [ ] [Rakuten Recipe API](https://webservice.rakuten.co.jp/document/#recipeApi)
    - [ ] [Rakuten Recipe Category List](https://webservice.rakuten.co.jp/api/recipecategorylist)
    - [ ] [Rakuten Recipe Category Ranking](https://webservice.rakuten.co.jp/api/recipecategoryranking)
- [ ] [Rakuten Kobo API](https://webservice.rakuten.co.jp/document/#koboApi)
    - [ ] [Rakuten Kobo eBook Search](https://webservice.rakuten.co.jp/api/koboebooksearch)
    - [ ] [Rakuten Kobo Genre Search](https://webservice.rakuten.co.jp/api/kobogenresearch)
- [ ] [Rakuten GORA API](https://webservice.rakuten.co.jp/document/#goraApi)
    - [ ] [Rakuten GORA Golf Course Search](https://webservice.rakuten.co.jp/api/goragolfcoursesearch)
    - [ ] [Rakuten GORA Golf Course Detail](https://webservice.rakuten.co.jp/api/goragolfcoursedetail)
    - [ ] [Rakuten GORA Plan Search](https://webservice.rakuten.co.jp/api/goraplansearch)
- [ ] [Other API](https://webservice.rakuten.co.jp/document/#otherApi)
    - [ ] [Rakuten Dynamic Advertisement](https://webservice.rakuten.co.jp/api/dynamicad)
    - [ ] [Rakuten Dynamic Advertisement Travel](https://webservice.rakuten.co.jp/api/dynamicad_travel)
    - [ ] [Rakuten Affiliate High Commission Shop](https://webservice.rakuten.co.jp/api/highcommissionshop)
