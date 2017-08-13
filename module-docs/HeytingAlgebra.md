## HeytingAlgebra

Heyting algebra was introduced to PureScript Prelude to allow three-valued logic, where Boolean algebra does not. More discussion on issue: https://github.com/purescript/purescript-prelude/issues/62.

Arend Heyting was a student of Luitzen Egbertus Jan Brouwer, the founder of the mathematical philosophy of intuitionism, at the University of Amsterdam. Heyting introduced the first formalization of intuitionistic logic to codify Brouwer's way of doing mathematics.

Intuitionistic logic, aka constructive logic, closely mirrors classical logic but does not include two laws: the excluded middle, and double negation elimination, which are fundamental inference rules in classical logic. If

- Excluded middle: For any proposition, either that proposition is true, or its negation is true.
- Double negation: If A is true, then (not (not A)) is true, and it's converse, if (not (not A)) is true, then A is true.

Heyting algebra laws:

- Associativity:
  - `a || (b || c) = (a || b) || c`
  - `a && (b && c) = (a && b) && c`
- Commutativity:
  - `a && b = b && a`
?  - `a || b = b || a`
- Absorption:
  - `a || (a && b) = a`
  - `a && (a || b) = a`
- Idempotent:
  - `a || a = a`
  - `a && a = a`
- Identity:
  - `a || ff = a`
  - `a && tt = a`
- Implication:
  - ``a `implies` a = tt``
  - ``a && (a `implies` b) = a && b``
  - ``b && (a `implies` b) = b``
  - ``a `implies` (b && c) = (a `implies` b) && (a `implies` c)``
- Complemented:
  - ``not a = a `implies` ff``




### When to Reach for it



### Basic Examples



### Useful Examples in PureScript Libraries



