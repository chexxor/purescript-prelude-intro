## Semigroup

A algebraic structure consisting of a set (Type) and an associative binary operation.

- Algebraic structure: A set (Type) with one or more operations and satisfies axioms/laws (Type class)
- Associativity: (x·y)·z = x·(y·z)
- Semigroup binary operation: (·) in mathematics, named (<>) in Prelude

The name "Semigroup" originates in that it generalizes a Group by preserving a subset of its axioms.

Group's axioms:

- Closure: Operations produce values inside the Group, never outside
- Associativity: Defined above as part of Semigroup
- Identity element: Doesn't change value of Group when combined with it
- Invertibility: 5 + 10 == 15, 15 + (-10) == 5

### When to Reach for it

When you have multiple values of a type and you want to combine them.

You aren't _required_ to ensure your instance satisfies the Semigroup axioms. (But there's only ONE, so why not?)
If you don't, your instance might be more inconvenient to use,
and you might be limited in other operations you can add, but it's not a big deal.

### Basic Examples

Integers are a Semigroup, having the addition or multiplication operation being the binary operation.

a + b = c, where a, b, and c are elements of Integer
a * b = c, where a, b, and c are elements of Integer

Functions are a Semigroup if the domain is Semigroup.

``` purescript
(f <> g) x == f x <> g x
where
  f :: Semigroup b => a -> b
  g :: Semigroup b => a -> b
```

Set of Functions on one type are a Semigroup, having the compose operation being the binary operation. That is, endomorphisms are a semigroup under the compose operation.

``` purescript
Endo (a -> a) <> Endo (a -> a) == (a -> a) <<< (a -> a)
```

``` purescript
data FruitState = Seed | Tree | Apple

time :: FruitState -> FruitState
time Seed = Tree
time Tree = Apple
time Apple = Seed

magic :: FruitState -> FruitState
magic Seed = Apple
magic Apple = Tree
magic Tree = Seed

c :: FruitState -> FruitState
c = Endo magic <> Endo time
```

### Useful Examples in PureScript Libraries

#### Tuple, Either, Maybe

``` purescript
> Tuple "a" "x" <> Tuple "b" "y" <> Tuple "c" "z"
(Tuple "abc" "xyz")
> Right "a" <> Left "b" <> Right "c"
(Left "b")
> Just "a" <> Nothing <> Just "c"
(Just "ac")
```

[purescript/purescript-tuples](https://github.com/purescript/purescript-tuples)
[purescript/purescript-either](https://github.com/purescript/purescript-either)
[purescript/purescript-maybe](https://github.com/purescript/purescript-maybe)

#### Options

``` purescript
newtype Options opt = Options (Array (Tuple String Foreign))

> stringify $ unsafeCoerce $ options
    $ (Options [ Tuple "flag" (toForeign 123) ])
    <> (Options [ Tuple "opt" (toForeign "abc") ])

"{\"flag\":123,\"opt\":\"abc\"}"
```

[purescript-contrib/purescript-options](https://github.com/purescript-contrib/purescript-options/blob/b47cf7488d81073483c552082e4683b5576df51c/src/Data/Options.purs)

#### StrMap

``` purescript
> singleton "key" "value" <> singleton "key2" "value2"
(fromFoldable [(Tuple "key2" "value2"),(Tuple "key" "value")])
```

[purescript/purescript-maps](https://github.com/purescript/purescript-maps)
