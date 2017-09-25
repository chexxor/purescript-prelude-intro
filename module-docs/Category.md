## Category

The Category typeclass adds the "category" concept to PureScript types, which comes from the study of [category theory](https://en.wikipedia.org/wiki/Category_theory). We will simply summarize the idea here, but there is much literature on this topic to consume to gain a deeper understanding of its theory and applications.

> "Category theory starts with the observation that many properties of mathematical systems can be unified and simplified by a presentation with diagrams of arrows"
> -- Saunders Mac Lane, in his book "Categories for the Working Mathematician"

People find category theory interesting because its axioms allow us to replace connected arrows with a single equivalent arrow, called "composition". For example, if we have arrow from X to Y and an arrow from Y to Z, we can compose them to create a new arrow directly from X to Z.

Category, the concept, can be used to describe many things, as a category doesn't specify *what* the arrows are between. We can use it to talk about arrows between matrices, ordinal numbers, groups, topological spaces, or types in a programming language. If we use it to describe simple PureScript types, for example, each arrow represents a function from type X to type Y, which assigns all values of X to Y.

In addition to arrows, category theory requires an "identity arrow" to exist for each start and end point of an arrow. While it can be easy to intuit that this identity function can be useful, it isn't easy to demonstrate to newcomers its necessity - it's simply an essential part of a category. One explanation of its necessity is that it enables concisely defining some things, such as isomorphism.

#### Laws:

A PureScript type is a Category if it acts as an arrow/morphism from `a` to `b` such that two of them can be composed associatively, and has a unique identity morphism, `id`, that doesn't change a morphism when composed. Formally described:

- Composes Associativity:
  - Given arrows/morphisms `f :: a → b`, `g :: b → c`, and `h :: c → d`
    they compose associatively `h <<< (g <<< f) = (h <<< g) <<< f`
- Identity:
  - Has an identity morphism, `id`, which doesn't change another morphism when composed
    `id <<< p = p <<< id = p`


### When to Reach for it

When your type behaves like a category theory arrow and you want to compose them. It's a convenient way to simplify your code by breaking it into multiple smaller arrows and using them to compose something greater.


### Basic Examples

#### Function / (->)

``` purescript
> :t show
forall a. Show a => a -> String
> :t readFloat
String -> Number
> :t readFloat <<< show
forall a. Show a => a -> Number
> (readFloat <<< show) 5
5.0
```

[purescript/purescript-prelude > Control.Category](https://github.com/purescript/purescript-prelude/blob/2abee52437d4199e2748cd36f7c8a29ec307040b/src/Control/Category.purs)


#### Op

``` purescript
> Op (g :: b -> a) <<< Op (f :: c -> b)
Op (h :: c -> a)
-- to do
```

[purescript/purescript-contravariant > Data.Op](https://github.com/purescript/purescript-contravariant/blob/836e2ca55940dff4cac0e16d93465622712c78e3/src/Data/Op.purs)


#### Leibniz

``` purescript
-- newtype Leibniz a b = Leibniz (forall f. f a -> f b)
-- to do
```

[paf31/purescript-leibniz > Data.Leibniz](https://github.com/paf31/purescript-leibniz/blob/master/src/Data/Leibniz.purs)


#### Star

``` purescript
> Star (g :: b -> f c) <<< Star (f :: a -> f b)
-- to do
```

[purescript/purescript-profunctor > Date.Profunctor.Star](https://github.com/purescript/purescript-profunctor/blob/v3.1.0/src/Data/Profunctor/Star.purs#L24-L24)


#### MealyT

``` purescript
main = do
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
```

[purescript-contrib/purescript-machines > Data.Machine.Mealy](https://github.com/purescript-contrib/purescript-machines/blob/v4.0.0/src/Data/Machine/Mealy.purs

