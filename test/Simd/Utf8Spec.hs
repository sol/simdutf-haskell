{-# LANGUAGE OverloadedLists #-}
module Simd.Utf8Spec (spec) where

import           Test.Hspec

import           Data.Array.Byte

import qualified Simd.Utf8 as Utf8

input :: ByteArray
input = [23, 42, 0xF0, 0x9F, 0x91, 0x8B]

spec :: Spec
spec = do
  describe "isValid" $ do
    context "with a valid UTF-8 sequence" $ do
      it "returns True" $ do
        Utf8.isValid input 0 6 `shouldBe` True

    context "with an invalid UTF-8 sequence" $ do
      it "returns False" $ do
        Utf8.isValid input 0 5 `shouldBe` False

  describe "length" $ do
    it "returns the length in code points of a given UTF-8 sequence" $ do
      Utf8.length input 0 6 `shouldBe` 3
