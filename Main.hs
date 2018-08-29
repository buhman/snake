module Main where

import Graphics.Gloss.Interface.Pure.Game
import Graphics.Gloss.Data.Color

import Model
import Controller
import View

display :: Display
display = InWindow "snake" (400, 400) (0, 0)

main :: IO ()
main = play
  display
  black
  10
  initialState
  view
  input
  step
