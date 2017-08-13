
# Structure

1. Define module/concept
2. Explain feeling of when to reach for it in real projects
3. Show simple example of data structure or library which embodies the module/concept
4. Show example of more advanced library which uses this module/concept
5. Questions and comments from listeners

# Order of Study

## Prelude @ 3.0.0

1.
  - Data.Eq
  - Data.Ord
  - Data.Bounded
  - Data.Semigroup

1.
  - Data.HeytingAlgebra
  - Data.Boolean
  - Data.BooleanAlgebra
  - Data.Show (purescript-formatters)

1.
  - Control.Semigroupoid
  - Control.Category
  - Data.Function
  - Data.Functor
  - Data.NaturalTransformation
  - Data.Void
  - Data.Unit

1.
  - Data.Semiring
  - Data.Ring
  - Data.CommutativeRing
  - Data.EuclideanRing
  - Data.Field

1.
  - Control.Apply
  - Control.Applicative
  - Control.Bind
  - Control.Monad


## Beyond Prelude - Type-level

1.
  - Type.Row
  - Type.Proxy
  - Type.Equality
  - Type.Data.Boolean
  - Type.Data.Ordering
  - Type.Data.Symbol
  - Type.Equality
  - Type.Row.Effect.Equality

1. Prim
  - Function, (->)
  - Array, []
  - Record, # (Type -> Type), {}
  - Number
  - Int
  - String, ", """
  - Char, '
  - Boolean
  - Partial class
  - Fail class
  - Warn class
  - Union class
  - RowCons class
  - TypeConcat
  - TypeString
  - Type kind
  - Symbol kind

## Beyond Prelude - Nice To Know About

1.
  - Data.Newtype
  - Data.Const
  - Data.NonEmpty
  - Data.Function.Uncurried
  - Data.Ord
    - Down
    - Max
    - Min


## Core Libraries

1.
  - Control.Monad.Eff
    - Console
    - Exception
    - Random
    - Now
    - Ref
    - Timer
    - Uncurried
    - Var
    - Unsafe

1.
  - Data.Monoid
  - Data.Enum
  - Data.BoundedEnum

1.
  - Data.Functor.Compose
  - Data.Functor.App
  - Data.Functor.Product
  - Data.Functor.Product.Nested
  - Data.Functor.Coproduct
  - Data.Functor.Coproduct.Nested
  - Data.Functor.Invariant

1.
  - Control.Extend
  - Control.Alt
  - Control.Plus
  - Control.Alternative
  - Control.MonadZero
  - Control.MonadPlus

1.
  - Data.Bifunctor
  - Data.Bifunctor
    - Clown
    - Joker
    - Wrap
    - Flip
    - Join
    - Product
  - Control.Biapplicative
  - Control.Biapply

1.
  - Data.Profunctor
  - Data.Foldable
  - Data.Unfoldable
  - Data.Traversable
  - Data.Bitraversable

1.
  - Data.Contravariant
  - Data.Comparison
  - Data.Decidable
  - Data.Decide
  - Data.Divide
  - Data.Divisible
  - Data.Equivalence
  - Data.Op
  - Data.Predicate

1.
  - Data.Parallel
  - Data.Inject

1. Transformers
  - Control.Monad
    - Cont
    - Error
    - Except
    - List
    - Maybe
    - Reader
    - Writer
    - State
    - RWS
  - Control.Comonad
    - Env
    - Store
    - Traced
    - Trans

## Beyond Core Libraries - Nice to Know About

1.
  - Data.Exists
  - Data.Lazy
  - Data.MonadRec (Control.Monad.Trampoline)

1.
  - Control.Monad.ST
  - Control.Monad.Eff.Ref

1. Contrib
  - Lens
  - Profunctor-lens
  - Foreign-lens
  - FreeT
  - HugeNum
  - These
  - Options

1.
  - Aff
  - Aff-Coroutines
  - Coroutines
  - Pair
  - Nullable

## Beyond Core Libraries - Data Structures

1.
  - Data.Maybe
  - Data.Either
  - Data.Either.Nested
  - Data.Tuple
  - Data.Tuple.Nested

1.
  - Data.Array
  - Data.Array.Partial
  - Data.Array.ST
  - Data.Array.ST.Partial
  - Data.Array.ST.Iterator
  - Data.List
  - Data.List.NonEmpty
  - Data.List.Lazy
  - Data.List.ZipList
  - Data.CatList
  - Data.CatQueue
  - Data.Set
  - Data.Map
  - Data.StrMap

1.
  - Control.Monad.Free
  - Control.Monad.Trampoline
  - Control.Comonad.Cofree
  - Data.Semiring.Free

1.
  - Data.Graph
