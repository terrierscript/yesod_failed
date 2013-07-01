module Handler.Feed
  ( getFeedR
  , postFeedR
  )
where

import Import

-- form使う
--import Yesod.Form.Nic (YesodNic, nicHtmlField)
-- instance YesodNic App
addingForm :: Form Feed

addingForm = renderDivs $ Feed
  -- areq type label default_value
  <$> areq  textField "URL" Nothing
  <*> areq  textField "Name" Nothing

-- feed（一覧）取得
getFeedR :: Handler Html
getFeedR = do
  feeds <- runDB $ selectList [] [Desc FeedUrl]
  (feedWidget, enctype) <- generateFormPost addingForm
  defaultLayout $ do
    $(widgetFile "feed")

-- feed登録
postFeedR :: Handler Html
postFeedR = do
  feeds <- runDB $ selectList [] [Desc FeedUrl]
  ((res,feedWidget),enctype) <- runFormPost addingForm
  $(logInfo) "aa"
  case res of
    FormSuccess feed -> do
      feedId <- runDB $ insert feed
      redirect FeedR
    _ -> defaultLayout $ do
      setTitle "failed"
      $(widgetFile "feed")