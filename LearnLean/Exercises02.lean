/-
# Exercises 02

Replace every `sorry` with a proof. Prove each one in TACTIC mode (`by …`), and watch
the goal in the infoview after every line. If you finish early, try term mode as well.

Tactics you have: `intro`, `exact`, `apply`, `constructor`, `obtain ⟨a, b⟩ := h`.
Typing: `→` is `\to`, `∧` is `\and`, `⟨ ⟩` is `\<` `\>`, `·` is `\.`
-/

namespace Exercises02

-- 1. Prove "if p, then p" without looking back at the lesson.
theorem ex1 (p : Prop) : p → p := by
  sorry

-- 2. Modus ponens in tactic mode.
theorem ex2 (p q : Prop) (hp : p) (hpq : p → q) : q := by
  sorry

-- 3. Hint: `intro` all three assumptions, then work backwards with `apply`.
theorem ex3 (p q r : Prop) : (p → q) → (q → r) → p → r := by
  sorry

-- 4. Get the right-hand part out of an "and".
theorem ex4 (p q : Prop) : p ∧ q → q := by
  sorry

-- 5. Build an "and".
theorem ex5 (p q : Prop) : p → q → p ∧ q := by
  sorry

-- 6. "And" is associative. Hint: you can take apart nested pairs with
--    `obtain ⟨⟨hp, hq⟩, hr⟩ := h`.
theorem ex6 (p q r : Prop) : (p ∧ q) ∧ r → p ∧ (q ∧ r) := by
  sorry

-- 7. If p implies both q and r, then p implies q.
theorem ex7 (p q r : Prop) : (p → q ∧ r) → (p → q) := by
  sorry

-- 8. Implications can be combined with ∧.
theorem ex8 (p q r : Prop) : (p → q) ∧ (p → r) → (p → q ∧ r) := by
  sorry

-- 9. Use a theorem you already proved: finish this with one `exact`, using ex6.
theorem ex9 (a b c : Prop) (h : (a ∧ b) ∧ c) : a ∧ (b ∧ c) := by
  sorry

-- 10. Challenge ("currying" for logic): both directions.
theorem ex10a (p q r : Prop) : (p ∧ q → r) → (p → q → r) := by
  sorry

theorem ex10b (p q r : Prop) : (p → q → r) → (p ∧ q → r) := by
  sorry

end Exercises02
