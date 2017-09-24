
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

## Notes

Classical logic:

- Excluded middle: For any proposition, either that proposition is true, or its negation is true.
- Double negation: If A is true, then (not (not A)) is true, and it's converse, if (not (not A)) is true, then A is true.
- Non-contradiction: Contradictory statements cannot both be true in the same sense at the same time.
- Explosion: Once a contradiction has been asserted, *any* proposition, including their negations, can be inferred from it. Proves a contradiction to be disastrous in logic.
- Monotonicity of entailment: The hypotheses of any derived fact may be freely extended with additional assumptions/premises. "All men are mortal. Socrates is a man. Cows produce milk. Therefore Socrates is mortal."
- Idempotency of entailment: One may derive the same consequences from many instances of a hypothesis as from just one.
- Commutativity of conjunction: The conjuncts of a logical conjunction may switch places with each other, while preserving the truth-value of the resulting proposition. "It is raining and Socrates is mortal and 2+2=4" is equivalent to "Socrates is mortal and 2+2=4 and it is raining".
- De Morgan duality: The negation of a conjunction is the disjunction of the negations; and the negation of a disjunction is the conjunction of the negations. "not (A and B) == (not A) or (not B)" and "not (A or B) == (not A) and (not B)"




There's no `Lattice` as it didn't seem common enough to warrant it in the Prelude, as it'd also require `Poset`, and impose more instance requirements on things like `HeytingAlgebra`... also you can keep going with that indefinitely - why is there no meet/join semilattices? etc. The Prelude classes were supposed to be a pragmatic-ish set of things that are somewhat commonly useful. There's definitely room for poset, lattice, and other fancy orders libraries though.

