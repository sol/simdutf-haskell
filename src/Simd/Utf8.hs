{-# LANGUAGE MagicHash #-}
{-# LANGUAGE UnliftedFFITypes #-}
module Simd.Utf8 where

import Prelude hiding (length)
import Data.Array.Byte
import Foreign.C
import GHC.Exts

isValid :: ByteArray -> Int -> Int -> Bool
isValid (ByteArray arr) off len = result /= 0
  where
    result = c_validate_utf8 arr (fromIntegral off) (fromIntegral len)

length :: ByteArray -> Int -> Int -> Int
length (ByteArray arr) off len = fromIntegral result
  where
    result = c_count_utf8 arr (fromIntegral off) (fromIntegral len)

foreign import ccall unsafe "_hs_simdutf_validate_utf8" c_validate_utf8 :: ByteArray# -> CSize -> CSize -> CBool

foreign import ccall unsafe "_hs_simdutf_count_utf8" c_count_utf8 :: ByteArray# -> CSize -> CSize -> CSize
