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
  <$> areq  textField "URL" Nothing
  <*> areq  textField "Name" Nothing

getFeedR :: Handler Html
getFeedR = do
  (feedWidget, enctype) <- generateFormPost addingForm
  defaultLayout $ do
    $(widgetFile "feed")
postFeedR :: Handler Html
postFeedR = error "Not yet implemented: postFeedR"
