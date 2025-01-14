module PhaserInterop where

import Prelude

import Effect(Effect)
import Effect.Console (log)

myfn :: String -> Effect Unit
myfn a = do
    log a
    

