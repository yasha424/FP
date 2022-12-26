module Main where

import Lab2

import Prelude
import Data.List (List(Nil), (:))
import Effect (Effect)
import Effect.Console (logShow)

main :: Effect Unit
main = do
  let arr = 1 : 2 : 3 : 3 : Nil
  let arr2 = -1 : -2 : -3 : Nil

  logShow(findIndex (_ == 3) arr)
  logShow(findLastIndex (_ == 3) arr)

  let zipped = zip arr arr2
  logShow(zipped)
  logShow(unzip zipped)

  logShow(filter (_ < -1) arr2)
  logShow(tailFilter (_ < -1) arr2 Nil)

  logShow(take 3 arr)
  logShow(tailTake 3 arr Nil)
