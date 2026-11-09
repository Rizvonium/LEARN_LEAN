/-
# Solutions 02  (try the exercises first!)
Each one is given in tactic mode, followed by a term-mode version.
-/

namespace Solutions02

theorem ex1 (p : Prop) : p → p := by
  intro hp
  exact hp
example (p : Prop) : p → p := fun hp => hp

theorem ex2 (p q : Prop) (hp : p) (hpq : p → q) : q := by
  apply hpq
  exact hp
example (p q : Prop) (hp : p) (hpq : p → q) : q := hpq hp

theorem ex3 (p q r : Prop) : (p → q) → (q → r) → p → r := by
  intro hpq hqr hp
  apply hqr
  apply hpq
  exact hp
example (p q r : Prop) : (p → q) → (q → r) → p → r :=
  fun hpq hqr hp => hqr (hpq hp)

theorem ex4 (p q : Prop) : p ∧ q → q := by
  intro h
  obtain ⟨_, hq⟩ := h
  exact hq
example (p q : Prop) : p ∧ q → q := fun h => h.2

theorem ex5 (p q : Prop) : p → q → p ∧ q := by
  intro hp hq
  constructor
  · exact hp
  · exact hq
example (p q : Prop) : p → q → p ∧ q := fun hp hq => ⟨hp, hq⟩

theorem ex6 (p q r : Prop) : (p ∧ q) ∧ r → p ∧ (q ∧ r) := by
  intro h
  obtain ⟨⟨hp, hq⟩, hr⟩ := h
  constructor
  · exact hp
  · constructor
    · exact hq
    · exact hr
example (p q r : Prop) : (p ∧ q) ∧ r → p ∧ (q ∧ r) :=
  fun h => ⟨h.1.1, h.1.2, h.2⟩   -- ⟨a, b, c⟩ is short for ⟨a, ⟨b, c⟩⟩

theorem ex7 (p q r : Prop) : (p → q ∧ r) → (p → q) := by
  intro h hp
  obtain ⟨hq, _⟩ := h hp
  exact hq
example (p q r : Prop) : (p → q ∧ r) → (p → q) := fun h hp => (h hp).1

theorem ex8 (p q r : Prop) : (p → q) ∧ (p → r) → (p → q ∧ r) := by
  intro h hp
  obtain ⟨hpq, hpr⟩ := h
  constructor
  · exact hpq hp
  · exact hpr hp
example (p q r : Prop) : (p → q) ∧ (p → r) → (p → q ∧ r) :=
  fun h hp => ⟨h.1 hp, h.2 hp⟩

theorem ex9 (a b c : Prop) (h : (a ∧ b) ∧ c) : a ∧ (b ∧ c) := by
  exact ex6 a b c h

theorem ex10a (p q r : Prop) : (p ∧ q → r) → (p → q → r) := by
  intro h hp hq
  apply h
  exact ⟨hp, hq⟩
example (p q r : Prop) : (p ∧ q → r) → (p → q → r) := fun h hp hq => h ⟨hp, hq⟩

theorem ex10b (p q r : Prop) : (p → q → r) → (p ∧ q → r) := by
  intro h hpq
  obtain ⟨hp, hq⟩ := hpq
  exact h hp hq
example (p q r : Prop) : (p → q → r) → (p ∧ q → r) := fun h hpq => h hpq.1 hpq.2

end Solutions02
