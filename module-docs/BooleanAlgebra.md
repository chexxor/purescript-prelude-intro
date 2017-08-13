## BooleanAlgebra

Boolean algebra was introduced by George Boole in his first book The Mathematical Analysis of Logic (1847), and set forth more fully in his An Investigation of the Laws of Thought (1854).

Where ordinary algebra is describes numeric relations, Boolean algebra formally describes logical relations. Boolean algebra is composed of truth values, "true" and "false", and three operations: conjunction, disjunction, & negation. Built on those three basic operations, three additional operations are also considered to be part of the Boolean algebra: implication, exclusive-or, and equivalence.

Boolean algebra laws:

- Annihilator:
  - `a && ff = ff`
  - `a || tt = tt`
- Associativity:
  - `a || (b || c) = (a || b) || c`
  - `a && (b && c) = (a && b) && c`
- Commutativity:
  - `a && b = b && a`
  - `a || b = b || a`
- Distributivity:
  - `a && (b || c) = (a && b) || (a && c)`
  - `a || (b && c) = (a || b) && (a || c)`
- Idempotent:
  - `a || a = a`
  - `a && a = a`
- Identity:
  - `a || ff = a`
  - `a && tt = a`
- Absorption:
  - `a || (a && b) = a`
  - `a && (a || b) = a`
- Implication:
  - ``a `implies` a = tt``
  - ``a && (a `implies` b) = a && b``
  - ``b && (a `implies` b) = b``
  - ``a `implies` (b && c) = (a `implies` b) && (a `implies` c)``
- Complemented:
  - ``not a = a `implies` ff``
- Complementation (non-monotone):
  - `a && not a = ff`
  - `a || not a = tt`


### When to Reach for it

When your types can be considered as being true or false values and you need to need to perform logical comparisons.

### Basic Examples




### Useful Examples in PureScript Libraries



