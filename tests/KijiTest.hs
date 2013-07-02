{-# LANGUAGE OverloadedStrings #-}
module KijiTest
    ( kijiSpecs
    ) where

import TestImport
import qualified Data.List as L

import Test.Hspec
import Test.Hspec.QuickCheck
import Test.Hspec.HUnit

import Handler.Kiji

kijiSpecs :: [Test.Hspec.Spec]
kijiSpecs = describe "parsing rss"
  it "hoge"
 {-   let actual = Handler.Kiji.parseFeed "http://nippondanji.blogspot.jp/"
    actual `shouldBe` "hoo"
  -}