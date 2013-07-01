module Handler.Kiji where

import Import

import Text.Feed.Import

{-
parseFeed :: String -> Feed
parseFeed url = do
  url
-}
-- feedToWidget :: Feed -> Html
-- strToHtml :: String -> ToHtml
-- strToHtml str = do

getKijiR :: Handler Html
getKijiR = do
  let f = parseFeedString "http://nippondanji.blogspot.jp/"
  let title = [hamlet|<div>"記事"</div>|]
  defaultLayout $ do
    $(widgetFile "kiji")
