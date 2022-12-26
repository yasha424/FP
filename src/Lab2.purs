module Lab2 where

import Data.List (List(..), length, reverse, (:))
import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..))
import Prelude ((+), (-), (>))

findIndex :: forall a. (a -> Boolean) -> List a -> Maybe Int
findIndex fn = go 0
  where
    go :: Int -> List a -> Maybe Int
    go i (x : xs) =
      if fn x
      then Just i
      else go (i + 1) xs
    go _ Nil = Nothing

findLastIndex :: forall a. (a -> Boolean) -> List a -> Maybe Int
findLastIndex fn xs =
  case findIndex fn (reverse xs) of
    Nothing -> Nothing
    Just index -> Just (length xs - 1 - index)

zip :: forall a b. List a -> List b -> List (Tuple a b)
zip (x : xs) (y : ys) = (Tuple x y) : zip xs ys
zip Nil _ = Nil
zip _ Nil = Nil

unzip :: forall a b. List (Tuple a b) -> Tuple (List a) (List b)
unzip Nil = Tuple Nil Nil
unzip (Tuple a b : xs) = Tuple (a : as) (b : bs)
  where
    Tuple as bs = unzip xs

filter :: forall a. (a -> Boolean) -> List a -> List a
filter fn (x : xs) =
  if fn x
  then x : filter fn xs
  else filter fn xs
filter _ Nil = Nil

tailFilter :: forall a. (a -> Boolean) -> List a -> List a -> List a
tailFilter fn (x : xs) ys =
  if fn x
  then tailFilter fn xs (x : ys)
  else tailFilter fn xs ys
tailFilter _ Nil ys = reverse ys

take :: forall a. Int -> List a -> List a
take n (x : xs) =
  if n > 0
  then x : take (n - 1) xs
  else Nil
take _ Nil = Nil

tailTake :: forall a. Int -> List a -> List a -> List a
tailTake n (x : xs) ys =
  if n > 0
  then tailTake (n - 1) xs (x : ys)
  else reverse ys
tailTake _ Nil ys = reverse ys
