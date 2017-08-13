
## Group theory

Why joining two elements of a set, there are many properties of concrete sets we can discover.
We give special names to sets having these properties. Following are names of common types of sets.

Magma
  - a . a

Semigroup <= Magma
  - a . (b . c) = (a . b) . c

Monoid <= Semigroup
  - exists identity element, e, such that
  - a . e = e . a = a

Group <= Semigroup
  - exists inverse element, b, such that
  - a . (b . a) = a and b = a . (b . a), where b is the inverse element to a

Quasigroup <= Magma
  - exists unique pair of inverse elements, x and y, such that
  - a . x = b, or x = a-1 . b, or x = a \ b (left-division)
  - y . a = b, or y = b . a-1, or y = b / a (right-division)

Loop <= Quasigroup
  - exists one identity element, e, such that
  - x . e = e . x = x

Group <= Magma
  - exists one identity element, e, such that
  - x . e = e . x = x
  - for each a, exists b, such that
  - a . b = b . a = e
  - maybe also can say same as quasigroup definition:
  - exists unique pair of inverse elements, x and y, such that
  - a . x = b, or x = a-1 . b, or x = a \ b (left-division)
  - y . a = b, or y = b . a-1, or y = b / a (right-division)


