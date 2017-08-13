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
