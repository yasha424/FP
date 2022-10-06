module Main where

import Lab1

import Prelude (Unit, discard)
import Effect (Effect)
import Effect.Console (logShow)

main ∷ Effect Unit
main = do
  let l1 = singleton 1
  logShow (l1)
  logShow (null l1)
  let l2 = snoc l1 2
  logShow (l2)
  logShow (length l2)
