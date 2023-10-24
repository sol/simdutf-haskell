# A Haskell interface to [simdutf](https://github.com/simdutf/simdutf)

Why do you want to use this?

 - The `text` library optionally uses `simdutf`, but it is disabled for GHC binary
   releases (see [GHC issue #20724](https://gitlab.haskell.org/ghc/ghc/-/issues/20724)).
 - Fallback implementations in both `text` and `bytestring` are broken (see
https://github.com/haskell/text/issues/540 and https://github.com/haskell/bytestring/issues/620).
