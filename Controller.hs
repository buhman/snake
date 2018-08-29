module Controller where

import Graphics.Gloss.Interface.Pure.Game
import Lens.Micro

import Model

input :: Event -> Model -> Model
input (EventKey (SpecialKey key) Down _ _) =
  updatePosition $ update key
input _ = id

updatePosition :: (Point -> Point) -> Model -> Model
updatePosition update model = model { position = newPosition }
  where
    newPosition = update $ position model

_x = _1
_y = _2

update :: SpecialKey -> (Point -> Point)
update KeyLeft = over _x (flip (-) 10)
update KeyRight = over _x (+10)
update KeyUp = over _y (+10)
update KeyDown = over _y (flip (-) 10)
update _ = id

step :: Float -> Model -> Model
step time model = model
