module Controller where

import Graphics.Gloss.Interface.Pure.Game
import Lens.Micro

import Model

type Velocity = Float

input :: Event -> Model -> Model
input (EventKey key Down _ _) model = model { direction = updateDirection key $ direction model }
input _ model = model

updateDirection :: Key -> Direction -> Direction
updateDirection (SpecialKey KeyLeft) _ = DLeft
updateDirection (SpecialKey KeyRight) _ = DRight
updateDirection (SpecialKey KeyUp) _ = DUp
updateDirection (SpecialKey KeyDown) _ = DDown
updateDirection _ d = d

updatePosition :: (Point -> Point) -> Model -> Model
updatePosition update model = model {position = newPosition}
  where
    newPosition = update $ position model

_x = _1

_y = _2

update :: Velocity -> Float -> Direction -> (Point -> Point)
update velocity time DLeft = over _x (flip (-) (velocity * time))
update velocity time DRight = over _x (+ (velocity * time))
update velocity time DUp = over _y (+ (velocity * time))
update velocity time DDown = over _y (flip (-) (velocity * time))

step :: Float -> Model -> Model
step time model = updatePosition (update 100 time $ direction model) model
