## Ord

A way to know whether one value of a type is greater-than or less-than another.

Axioms of equality:

- Reflexivity: a <= a
- Antisymmetry: if a <= b and b <= a then a == b
- Transitivity: if a <= b and b <= c then a <= c

### When to Reach for it

When you need to sort a bunch of values or choose the largest/smallest value of multiple.

### Basic Examples

``` purescript
-- Integers:
> 1 `compare` 2
LT

-- Boolean:
> true `compare` false
GT

-- Arrays:
> ["a"] `compare` ["b"]
LT

-- Records:
-- > {a: 1} `compare` {a: 1} ... Fail
-- Sorry, Record's can't be instances of typeclasses. :(

-- But, you can make a newtype and have PureScript derive an instance of `Ord`:
> newtype MyRec = MyRec { a :: Int }
> derive instance eqMyRec :: Eq MyRec
> derive instance ordMyRec :: Ord MyRec
> MyRec {a: 1} `compare` MyRec {a: 2}
LT

-- OR, use `comparing` to map a non-`Ord` type to an `Ord` type
> comparing _.a {a: 1} {a: 2}
LT
```

### Useful Examples in PureScript Libraries

#### Tuple, Either, Maybe

``` purescript
> Tuple 1 1 `compare` Tuple 1 2
LT
> Right 1 `compare` Left 1 :: Either Int Int
GT
> Nothing `compare` Just 1
LT
```

[purescript/purescript-tuples](https://github.com/purescript/purescript-tuples)
[purescript/purescript-either](https://github.com/purescript/purescript-either)
[purescript/purescript-maybe](https://github.com/purescript/purescript-maybe)

