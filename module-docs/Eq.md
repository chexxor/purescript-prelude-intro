## Eq

A way to know whether two values of a type are equal.

Axioms of equality:

- Reflexivity: x == x = true
- Symmetry: x == y = y == x
- Transitivity: if x == y and y == z, then x == z

Note: NaN

### When to Reach for it

Whenever you need to know if two values are equal!

### Basic Examples

Integers: 1 == 1

Boolean: true == true

Arrays: ["a"] == ["a"]

Records: {a: 1} == {a: 1} ... Fail

Sorry, Record's can't be instances of typeclasses. :(

But, you can make a newtype and have PureScript derive an instance of `Eq`:

``` purescript
> newtype MyRec = MyRec { a :: Int }
> derive instance eqMyRec :: Eq MyRec
> MyRec {a: 1} == MyRec {a: 1}
true
```

### Useful Examples in PureScript Libraries

#### Tuple, Either, Maybe

``` purescript
> Tuple 1 2 == Tuple 1 2
true
> Right 1 == Right 1
true
> Just 1 == Just 1
true
```

[purescript/purescript-tuples](https://github.com/purescript/purescript-tuples)
[purescript/purescript-either](https://github.com/purescript/purescript-either)
[purescript/purescript-maybe](https://github.com/purescript/purescript-maybe)

#### StrMap

``` purescript
> singleton "key" "value" == singleton "key" "value"
true
```

[purescript/purescript-maps](https://github.com/purescript/purescript-maps)

#### CSS

``` purescript
> import CSS
> -- Compare two CSS rules in PS.
> (render $ color red) == (render $ color red)
true
```

[slamdata/purescript-css](https://github.com/slamdata/purescript-css)
