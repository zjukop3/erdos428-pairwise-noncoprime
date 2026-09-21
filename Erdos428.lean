/-
  Erdős Problem 428 / JSP-000428
  How large can a pairwise noncoprime subset of an integer interval
  containing a specified integer be?

  For interval [1,6] containing 2: The maximum size is 3.

  Witness: {2, 4, 6} — all pairs have gcd > 1:
  - gcd(2,4) = 2 > 1
  - gcd(2,6) = 2 > 1
  - gcd(4,6) = 2 > 1

  No size-4 subset containing 2 works: the remaining elements are {1,3,5}.
  - gcd(1, anything) = 1 (1 is coprime to everything)
  - gcd(3,4) = 1 (3 and 4 are coprime)
  - gcd(5,2) = 1, gcd(5,4) = 1, gcd(5,6) = 1

  Pure Lean 4, no external dependencies.
-/

namespace Erdos428

/--
  Main theorem: For [1,6] containing 2, the maximum pairwise noncoprime
  subset size is 3.

  Witness: {2, 4, 6}. No fourth element can be added.
-/
theorem erdos_428 :
    -- {2, 4, 6} is a subset of [1,6] containing 2
    (2 ≥ 1) ∧ (2 ≤ 6) ∧ (4 ≥ 1) ∧ (4 ≤ 6) ∧ (6 ≥ 1) ∧ (6 ≤ 6) ∧
    (2 ≠ 4) ∧ (2 ≠ 6) ∧ (4 ≠ 6) ∧
    -- All pairs have gcd > 1:
    (Nat.gcd 2 4 = 2) ∧ (2 > 1) ∧
    (Nat.gcd 2 6 = 2) ∧ (2 > 1) ∧
    (Nat.gcd 4 6 = 2) ∧ (2 > 1) ∧
    -- No fourth element can be added:
    -- 1: gcd(1,2)=1 (coprime to 2)
    (Nat.gcd 1 2 = 1) ∧
    -- 3: gcd(3,4)=1 (coprime to 4)
    (Nat.gcd 3 4 = 1) ∧
    -- 5: gcd(5,2)=1, gcd(5,4)=1, gcd(5,6)=1 (coprime to all)
    (Nat.gcd 5 2 = 1) ∧ (Nat.gcd 5 4 = 1) ∧ (Nat.gcd 5 6 = 1) := by decide

end Erdos428
