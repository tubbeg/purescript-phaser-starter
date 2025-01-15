module Main where

import Data.Function.Uncurried
import Prelude

import Data.Number.Format (toString)
import Effect (Effect)
import Effect.Console (log)
import PhaserInterop (GameConfig, SceneXt, addImage, addParticles, auto, createGame, createLogo, createScene, loadImage, loggingThis, setUrl)


-- remember to build every once in a while, even if your program isn't complete.
-- spago doesn't download certain packages until you build which can cause
-- fake errors to appear


p :: SceneXt -> Effect Unit
p scene = do
  log "i am loading assets!"
  setUrl scene "https://labs.phaser.io"
  loadImage scene "sky" "assets/skies/space3.png"
  loadImage scene "logo" "assets/sprites/phaser3-logo.png"
  loadImage scene "red" "assets/particles/red.png"
  loggingThis "testing loggin again"
  pure unit 

-- return in haskell is just an alias for pure. Purescript uses pure.
-- The value unit and type Unit has replaced ()
-- Personally I actually prefer this

c :: SceneXt -> Effect Unit
c scene = do
  addImage scene 400 300 "sky"
  logo <- createLogo scene
  p <- addParticles scene logo
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
  g <- createGame gameConf -- changed so the function returns an Effect Game
  log "🍝"
  where
    conf = {active:true, key:"myScene"}
    s = createScene conf p c u
    gameConf = phaserConfig s

