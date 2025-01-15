module PhaserInterop
  ( Config
  --, Game
  , GameConfig
  , Arcade
  , Physics
  , Gravity
  , SceneXt
  , Sfunc
  , Supd
  , auto
  , createGame
  , createScene
  , loggingThis
  )
  where

import Data.Function.Uncurried
import Prelude

import Effect (Effect)
import Effect.Console (log)


-- just type synonyms (aliases)
type Config = {active :: Boolean, key :: String}
type Sfunc = SceneXt -> Effect Unit
type Supd = SceneXt -> Number -> Number -> Effect Unit

type Gravity = {y :: Int}
type Arcade = {gravity :: Gravity}
type Physics = {default :: String, arcade :: Arcade}
type GameConfig =
  {type :: Number, width :: Int,
  height :: Int, scene :: SceneXt,
  physics :: Physics}

foreign import data SceneXt :: Type

-- foreign import data Game :: Type

foreign import createScene :: Config -> Sfunc -> Sfunc -> Supd -> SceneXt

foreign import loggingThis :: String -> Effect Unit


foreign import createGame :: GameConfig -> Effect Unit

foreign import auto :: Number

