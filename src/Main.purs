module Main where

import Prelude

import Effect (Effect)
import Effect.Console (log)

import PhaserInterop (myfn)



main :: Effect Unit
main = do
  myfn "test this"
  log "🍝"
