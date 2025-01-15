module PhaserInterop
  ( Arcade
  , Config
  , Game
  , GameConfig
  , GameObj
  , Gravity
  , Particles
  , Physics
  , SceneXt
  , Sfunc
  , Supd
  , addImage
  , addParticles
  , auto
  , createGame
  , createLogo
  , createScene
  , loadImage
  , loggingThis
  , setUrl
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

foreign import data Game :: Type
foreign import data Particles :: Type

foreign import data GameObj :: Type

foreign import createScene :: Config -> Sfunc -> Sfunc -> Supd -> SceneXt

foreign import loggingThis :: String -> Effect Unit


foreign import createGame :: GameConfig -> Effect Game

foreign import auto :: Number


foreign import setUrl :: SceneXt -> String -> Effect Unit

foreign import loadImage :: SceneXt -> String -> String -> Effect Unit

foreign import addImage :: SceneXt -> Int -> Int -> String -> Effect Unit

foreign import addParticles :: SceneXt -> GameObj -> Effect Particles

foreign import createLogo :: SceneXt -> Effect GameObj