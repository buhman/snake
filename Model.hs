module Model where

import Graphics.Gloss.Data.Picture

data Model = Model
  { position :: Point
  }

initialState :: Model
initialState = Model
  { position = (0, 0)
  }
