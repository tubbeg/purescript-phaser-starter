module Main
  where

import Data.Function.Uncurried -- you can also use uncurried Fn2 Fn3 etc. for uncurried imports
import Prelude

-- use Effect.Aff monad to run functions async

import Data.Number.Format (toString)
import Effect (Effect)
import Effect.Console (log)
import PhaserInterop (Config, GameConfig, SceneXt, auto, createGame, createScene, loggingThis)


-- remember to build every once in a while, even if your program isn't complete.
-- spago doesn't download certain packages until you build which can cause
-- fake errors to appear

p :: SceneXt -> Effect Unit
p scene = do
  log "i am loading assets!"
  loggingThis "testing loggin again"
  pure unit 

-- return in haskell is just an alias for pure. Purescript uses pure.
-- The value unit and type Unit has replaced ()
-- Personally I actually prefer this

c :: SceneXt -> Effect Unit
c scene = do
  pure unit

u :: SceneXt -> Number -> Number -> Effect Unit
u scene time delta = do
  log $ "time is: " <> t
  pure unit
  where
    t = toString time

phaserConfig :: SceneXt -> GameConfig
phaserConfig s =
  {type:auto, width:800,
  height:600, scene:s,
  physics:{default:"arcade", arcade:{gravity:{y:200}}}}


main :: Effect Unit
main = do
  loggingThis "test"
  g <- createGame gameConf
  log "🍝"
  where
    conf = {active:true, key:"myScene"}
    s = createScene conf p c u
    gameConf = phaserConfig s

