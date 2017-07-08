## Bounded

A way to define the maximum and minimum values for a type.
Presumes the type is totally ordered (can be plotted on a line).

Axioms of bounded:

- Bounded: bottom <= a <= top

### When to Reach for it

When a type can have a minimum/starting and maximum/ending value.

### Basic Examples

``` purescript
-- Integers:
> (top :: Int)
2147483647

-- Boolean:
> (top :: Boolean)
true

-- Arrays:
> (top :: Array Int)
-- Sorry, Array is not Bounded. :(

-- Records:
-- > (top :: {a :: Int})
-- Sorry, Record's can't be instances of typeclasses. :(
-- Can't derive it, but you can derive Generic.Rep.

-- But, you can make a newtype and have PureScript derive an instance of `Ord`:
> newtype MyRec = MyRec { a :: Int }
> derive instance genericRepMyRec :: Generic MyRec _
> (genericTop :: MyRec)
MyRec { a: 2147483647 }
```

### Useful Examples in PureScript Libraries

#### Tuple, Either, Maybe

``` purescript
> (top :: Tuple Int Int)
(Tuple 2147483647 2147483647)
> (bottom :: Tuple Int Int)
(Tuple -2147483648 -2147483648)

> (top :: Either Int Int)
(Right 2147483647)
> (bottom :: Either Int Int)
(Left -2147483648)

> (top :: Maybe Int)
(Just 2147483647)
> (bottom :: Maybe Int)
Nothing
```

[purescript/purescript-tuples](https://github.com/purescript/purescript-tuples)
[purescript/purescript-either](https://github.com/purescript/purescript-either)
[purescript/purescript-maybe](https://github.com/purescript/purescript-maybe)

#### DateTime

``` purescript
> (top :: Year)
(Year 275759)
> (top :: Date)
(Date (Year 275759) December (Day 31))
```

[purescript/purescript-datetime](https://github.com/purescript/purescript-datetime)
