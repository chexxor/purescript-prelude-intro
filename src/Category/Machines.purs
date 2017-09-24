module Test where

import Prelude

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)
import Control.Monad.State.Class (gets, put)
import Control.Monad.State.Trans (StateT, evalStateT)
import Data.Identity (Identity)
import Data.Machine.Mealy (MealyT, Step(..), halt, mealy, runMealy, singleton, stepMealy)
import Data.Monoid (mempty)
import Data.Newtype (unwrap)
import Data.Profunctor (dimap)
import Data.Set (Set, insert, member)
import Debug.Trace (trace, traceAny)

data Person = MrA | MrsB
derive instance eqPerson :: Eq Person
derive instance ordPerson :: Ord Person
personName :: Person -> String
personName MrA = "MrA"
personName MrsB = "MrsB"

data MyAction =
    NoOp
  | Meet Person
  | Greet Person

type MyState = String
type MyMemory = {
    acquaintances :: Set Person
  }
initialMemory :: MyMemory
initialMemory =
  { acquaintances: mempty
  }

--type MachineMonad eff = Eff (console :: CONSOLE | eff)
--type MachineMonad eff = StateT MyMemory (Eff (console :: CONSOLE | eff))
type MachineMonad eff = StateT MyMemory Identity
type MyStep eff = Step (MachineMonad eff) MyAction MyState
type MyMachine eff = MealyT (MachineMonad eff) MyAction MyState

stepFn :: forall eff. MyAction -> (MachineMonad eff) (MyStep eff)
stepFn = case _ of
  Meet p -> do
    acquaintances <- gets _.acquaintances
    let
      hasMet p = member p acquaintances
      rememberAcquaintance p = put $ { acquaintances: insert p acquaintances }
      msg = "Met " <> personName p
        <> if hasMet p then " before." else " for the first time!"
    rememberAcquaintance p
    pure $ Emit msg $ mealy stepFn
  Greet p -> do
    acquaintances <- gets _.acquaintances
    let
      hasMet p = member p acquaintances
      msg = "Hello " <> personName p
        <> if hasMet p then ". Nice to see you again!" else ". Nice to meet you!"
    pure $ Emit msg $ mealy stepFn
  NoOp -> pure Halt

traceStepOutput :: forall f s a. (Monad f) => Step f s a -> MealyT f s a
traceStepOutput = case _ of
  Emit a m -> traceAny a \_ -> m
  Halt -> traceAny "halted" \_ -> halt

main :: forall eff. Eff (console :: CONSOLE | eff) Unit
main = runIdentity $ flip evalStateT initialMemory
      $ runMealy $ dimap f g (mealy stepFn)
  where
    f :: Unit -> MyAction
    f = const NoOp
    g :: String -> Unit
    g state = traceAny "Emitted state" \_ -> traceAny state \_ -> unit

main2 :: forall e eff. Eff (console :: CONSOLE | eff) Unit
main2 = do
  let
    myMachine :: MyMachine e
    myMachine = mealy stepFn
    machineOut :: MachineMonad e (MyMachine e)
    machineOut = do
      r :: MyMachine e
        <- traceStepOutput <$> stepMealy (Meet MrA) myMachine
      -- 'Met MrA for the first time!'
      s :: MyMachine e
        <- traceStepOutput <$> stepMealy (Meet MrA) r
      -- 'Met MrA before.
      t :: MyMachine e
        <- traceStepOutput <$> stepMealy (Meet MrA) s
      -- 'Met MrA before.
      u :: MyMachine e
        <- traceStepOutput <$> stepMealy (Greet MrA) t
      -- 'Hello MrA. Nice to see you again!'
      v :: MyMachine e
        <- traceStepOutput <$> stepMealy (Greet MrsB) u
      -- 'Hello MrsB. Nice to meet you!'
      pure v
  myMachineAfterAFewCommands :: MyMachine e
    <- runIdentity $ evalStateT machineOut initialMemory
  pure unit

main3 :: forall eff. Eff eff Unit
main3 = do
  let
    -- A machine which returns "a" for any input.
    aMealy :: MealyT (Eff eff) String String
    aMealy = singleton "a"
    -- A machine which returns 1 for any input.
    bMealy :: MealyT (Eff eff) String Int
    bMealy = singleton 1
    -- A machine which returns 1 for any input.
    -- Compose them, which passes "a" for any input to `bMealy`,
    --   which returns 1 for any input.
    cMealy :: MealyT (Eff eff) String Int
    cMealy = bMealy <<< aMealy
  step :: MealyT (Eff eff) String String
    <- traceStepOutput <$> stepMealy "aMessage" aMealy
  -- 'a'
  step :: MealyT (Eff eff) String String
    <- traceStepOutput <$> stepMealy "aMessage2" aMealy
  -- 'a'
  step :: MealyT (Eff eff) String Int
    <- traceStepOutput <$> stepMealy "bMessage" bMealy
  -- 1
  step :: MealyT (Eff eff) String Int
    <- traceStepOutput <$> stepMealy "cMessage" cMealy
  -- 1
  pure unit

runIdentity :: forall a eff. Identity a -> Eff eff a
runIdentity = pure <<< unwrap
