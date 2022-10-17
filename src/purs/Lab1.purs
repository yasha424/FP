module Lab1 where

import Prelude
import Data.List (List(..), (:))

singleton :: forall a. a -> List a
singleton a = a : Nil

null :: forall a. List a -> Boolean
null Nil = true
null _ = false

snoc :: forall a. List a -> a -> List a
snoc Nil b = b : Nil
snoc (a : b) c = a : (snoc b c)

length :: forall a. List a -> Int
length Nil = 0
length (Cons _ a) = 1 + length a
