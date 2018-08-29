module Coordinate where

import Graphics.Gloss.Data.Picture
import Lens.Micro

type Coord = (Float, Float)

windowSize = (400, 400) :: (Int, Int)
coordSize = 10 :: Float

fromCoord :: Coord -> Point
fromCoord = lens
  where
    (wx, wy) = windowSize
    lens = (over _1 $ transform wx) . (over _2 $ transform wy)

transform :: Int -> (Float -> Float)
transform scale = ((*) ((fromIntegral scale * 0.5) / coordSize)) . fromIntegral . round
