{-# LANGUAGE MagicHash #-}
{-# LANGUAGE UnliftedFFITypes #-}
module Simd.Utf8 where

import Prelude hiding (length)
import Data.Array.Byte
import Foreign.C
import GHC.Exts

isValid :: ByteArray -> Int -> Int -> Bool
isValid (ByteArray payload) offset length = result /= 0
  where
    result = c_simdutf_validate_utf8 payload (fromIntegral offset) (fromIntegral length)

foreign import ccall unsafe "_hs_simdutf_validate_utf8" c_simdutf_validate_utf8 :: ByteArray# -> CSize -> CSize -> CBool
