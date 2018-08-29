module View where

import Graphics.Gloss.Data.Picture
import Graphics.Gloss.Data.Color

import Model
import Coordinate

box :: Point -> Path
box point@(x, y) =
  [ point
  , (x + 10, y)
  , (x + 10, y + 10)
  , (x     , y + 10)
  ]

view :: Model -> Picture
view model = shape
  where
    shape = color green $ polygon path
    path = box $ (fromCoord . position) model
