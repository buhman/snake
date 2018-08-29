module Model where

import Graphics.Gloss.Data.Picture

data Direction
  = DUp
  | DRight
  | DDown
  | DLeft

data Model = Model
  { position :: Point
  , direction :: Direction
  }

initialState :: Model
initialState = Model {position = (0, 0), direction = DUp}
