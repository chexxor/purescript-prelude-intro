
## Order theory

### Algebra of Orders

Operators/functions
  - ≤ = <=
  - ∧ = &&
  - ∨ = ||, dual of ∧
  - → = =>

Equivalences
  - for all x,y in poset S
  - x <= y iff x = x ∧ y.
  - x <= ≡ x -> y

### Orders

Preorder
  - reflexive: a <= a
  - transitive: if a <= b && b <= c, then a <= c

Poset <= Preorder
  - antisymmetry: if a <= b && b <= a, then a = b

Semilattice <= Poset
  - JoinSemilattice: exists least upper bound, called join, or ||
  - MeetSemilattice: exists greatest lower bound, called meet, or &&
  - commutative: a && b = b && a
  - associative: a && (b && c) = (a && b) && c
  - idempotent: a && a = a
  - same for dual, ||

Lattice <= Semilattice
  - absorption: a && (a || b) = a || (a && b) = a

BoundedLattice <= Lattice
  - where 0 is least/bottom element, and 1 is greatest/top element
  - join identity on bottom: a || 0 = a
  - meet identity on top: a && 1 = a

DistributiveLattice <= Lattice
  - distributive: a && (b || c) = (a && b) || (a && c)

HeytingAlgebra <= BoundedLattice, DistributiveLattice
   implication:
  - a => a = top
  - a && (a => b) = a && b
  - b && (a => b) = b
  - a => (b && c) = (a => b) && (a => c)

  Additional Laws:
  - !a = (a => 0)
  - a && !a = 0
  - a || !a == 1

  Relating ≤ to →:
  - a <= b iff a => b = 1
  - c ∧ a ≤ b ≡ c ≤ a → b
  - c && a <= b ≡ c ≤ a => b

  Notable:
  - !!a /= a
  - !(a && b) /= !!(~a || !b)
  - but !(a || b) = !a && !b

BooleanAlgebra <= HeytingAlgebra
  - (!) satisfies classical axioms of logic
  - a → b is defined as usual as ¬a ∨ b
  - a => b ≡ !a || b

  - a || !a = 1
