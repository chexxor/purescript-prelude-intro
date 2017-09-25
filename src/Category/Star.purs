module Category.Star where

import Prelude

import Data.Newtype (unwrap)
import Data.Profunctor.Star (Star(..))
import Data.Tuple (Tuple(..))
import Global.Unsafe (unsafeStringify)

-- Some simple functions
addOne :: Int -> Int
addOne i = i + 1

mulFive :: Int -> Int
mulFive i = i * 5

-- Suppose we wanted to log their effects for debugging
logify :: forall a b. String -> (a -> b) -> (a -> Tuple String b)
logify fnName f = \a -> Tuple (msg a) (f a)
  where msg a = "(" <> fnName <> ":" <> unsafeStringify (f a) <> ")"

addOne' :: Int -> Tuple String Int
addOne' = logify "addOne" addOne

mulFive' :: Int -> Tuple String Int
mulFive' = logify "mulFive" mulFive

-- We can compose the simple functions
f :: Int -> Int
f = mulFive <<< addOne

-- But we can't compose the logified ones, because the output isn't the same as the input
--fail = mulFive' <<< addOne'

-- We *can* compose them in Star category.
-- A function can be composed like a Star if it is type `a -> f b`, where `f` is a Monad
-- `Tuple a` is a Monad if `a` is a Semigroup like String
g :: Int -> Tuple String Int
g = unwrap $ (Star mulFive') <<< (Star addOne')
-- > f 4
-- (Tuple "(addOne:5)(mulFive:25)" 25)

-- We can make this less laborious if we want to do this a lot.
starCompose :: forall a b c f. Bind f => (b -> f c) -> (a -> f b) -> (a -> f c)
starCompose g f = unwrap $ (Star g) <<< (Star f)

infixl 4 starCompose as <<<<

g' :: Int -> Tuple String Int
g' = addOne' <<<< mulFive' <<<< addOne'
-- > g 4
-- (Tuple "(addOne:5)(mulFive:25)(addOne:26)" 26)



