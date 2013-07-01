module Handler.Echo where

import Import

getEchoR :: String -> Handler Html
getEchoR theText = do
  $(logInfo) "This is a debug log message 1"
  defaultLayout $ do
    $(logInfo) "This is a debug log message 2"
    [whamlet|<div>#{theText}|]