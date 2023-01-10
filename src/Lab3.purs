module Lab3 where

import Prelude (Unit, show, discard, (==), ($), (<), (>), (<=), (>=), (<>))

import Data.Eq (class Eq)
import Data.Ord (class Ord, Ordering(EQ, GT, LT), compare)
import Data.Show (class Show)

import Effect (Effect)
import Effect.Console (log)

data Maybe a = Nothing | Just a

test :: Effect Unit
test = do
  log $ show $ Just 5 == Just 5
  log $ show $ Just 5 == Just 2
  log $ show $ Just 5 == Nothing
  log $ show $ Nothing == Just 5
  log $ show $ Nothing == (Nothing :: Maybe Unit)
  log "------------------"
  log $ show $ Just 1 < Just 5
  log $ show $ Just 5 <= Just 5
  log $ show $ Just 5 > Just 10
  log $ show $ Just 10 >= Just 10
  log $ show $ Just 99 > Nothing
  log $ show $ Just 99 < Nothing
  log $ show $ Just 99 > Nothing
  log "------------------"
  log $ show $ Just "abc"
  log $ show $ (Nothing :: Maybe Unit)

instance eqMaybe :: Eq a => Eq (Maybe a) where
  eq Nothing Nothing = true
  eq (Just x) (Just y) = x == y
  eq _ _ = false

instance ordMaybe :: Ord a => Ord (Maybe a) where
  compare Nothing Nothing = EQ
  compare (Just x) (Just y) = compare x y
  compare _ Nothing = GT
  compare Nothing _ = LT

less :: forall a. Ord a => Maybe a -> Maybe a -> Boolean
less Nothing Nothing = false
less (Just x) (Just y) = x < y
less Nothing _ = true
less _ Nothing = false

greater :: forall a. Ord a => Maybe a -> Maybe a -> Boolean
greater Nothing Nothing = false
greater (Just x) (Just y) = x > y
greater Nothing _ = false
greater _ Nothing = true

lessThanOrEq :: forall a. Ord a => Maybe a -> Maybe a -> Boolean
lessThanOrEq Nothing Nothing = true
lessThanOrEq (Just x) (Just y) = x <= y
lessThanOrEq Nothing _ = true
lessThanOrEq _ Nothing = false

greaterThanOrEq :: forall a. Ord a => Maybe a -> Maybe a -> Boolean
greaterThanOrEq Nothing Nothing = true
greaterThanOrEq (Just x) (Just y) = x >= y
greaterThanOrEq Nothing _ = false
greaterThanOrEq _ Nothing = true

instance showMaybe :: Show a => Show (Maybe a) where
  show (Just a) = "Just " <> show a
  show _ = "Nothing"
