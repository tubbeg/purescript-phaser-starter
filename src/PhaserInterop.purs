module PhaserInterop where

import Prelude

import Effect(Effect)
import Effect.Console (log)
import Data.Function.Uncurried


foreign import data SceneXt :: Type

foreign import data Game :: Type

foreign import createScene :: Fn4 String String String String Number

foreign import createGame :: String -> Game

myfn :: String -> Effect Unit
myfn a = do
    log a
    

