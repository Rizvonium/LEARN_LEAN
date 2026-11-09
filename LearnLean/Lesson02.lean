/-
# Lesson 02: Propositions, proofs, `→` and `∧`

Sources:
  TPIL 3.1–3.3 (Propositions as Types, Working with Propositions as Types, Propositional Logic)
  TPIL 5.1–5.2 (Entering Tactic Mode, Basic Tactics)

Goal of this lesson: write your first real theorems, in two styles:
  * term mode: you write the proof directly, like a program
  * tactic mode: you build the proof step by step, watching the goal change
Mathematicians formalizing theorems mostly use tactic mode, so that's where we'll spend
most of our time.
-/

namespace Lesson02

/-
## 1. `Prop`: the type of statements

A *proposition* is a statement that could be true or false. In Lean, statements have
type `Prop`. False statements are still statements, so they are still `Prop`s.
-/

#check 2 + 2 = 4        -- 2 + 2 = 4 : Prop
#check 2 + 2 = 5        -- 2 + 2 = 5 : Prop   (false, but still a statement)
#check 3 < 7            -- 3 < 7 : Prop

/-
## 2. The big idea: propositions are types, proofs are values

In Lesson 01, `7 : Nat` meant "7 is a value of type Nat".
Now, for a statement `P : Prop`, writing

    h : P

means "h is a PROOF of P". A statement is a type, and its proofs are the values of that
type. A true statement has proofs. A false statement has none.

So proving a theorem means constructing a value of the right type, and Lean checks it
exactly the way it checks `7 : Nat`.

`theorem` works like `def`, except that the "type" is a statement and the "value" is a proof.
-/

theorem two_plus_two : 2 + 2 = 4 := rfl
--      ^ name         ^ statement   ^ proof

#check two_plus_two     -- two_plus_two : 2 + 2 = 4

/-
## 3. Variables for statements

To talk about *any* statements p, q, r, we take them as inputs:
`(p q : Prop)` means "let p and q be any propositions".

Hypotheses (things you're allowed to assume) are also inputs:
`(hp : p)` means "assume we have a proof of p, and call it hp".
By convention hypothesis names start with `h`.
-/

-- "If p is true, then p is true." The proof is just the assumption itself.
theorem use_assumption (p : Prop) (hp : p) : p := hp

/-
## 4. Implication `→`: "if … then …"

`p → q` means "if p then q". Under propositions-as-types, a proof of `p → q` is
a FUNCTION that turns any proof of p into a proof of q. It's the same arrow you saw
for functions in Lesson 01.
-/

theorem p_implies_p (p : Prop) : p → p :=
  fun hp => hp          -- "given a proof hp of p, return hp"

-- Arrows group to the right: `p → q → p` means `p → (q → p)`.
-- "If p, then (if q, then p)."
theorem p_q_p (p q : Prop) : p → q → p :=
  fun hp _ => hp        -- `_` means "an input I don't need to name"

-- Using an implication = calling the function.
-- If `hpq : p → q` and `hp : p`, then `hpq hp : q`.  (This is the rule called modus ponens.)
theorem modus_ponens (p q : Prop) (hpq : p → q) (hp : p) : q :=
  hpq hp

/-
## 5. Tactic mode: proving step by step

Writing proofs as functions gets hard quickly. Instead, write `by` and then give
*tactics*: commands that turn the current goal into simpler goals.

Put your cursor at the end of each line below and watch the infoview. It shows:

    p q : Prop        ← things you have (the context)
    hp : p
    ⊢ q               ← the goal: what you still need to prove

`⊢` (called a "turnstile") means "you must prove this".

Three basic tactics:
  * `intro h`  : the goal is `A → B`. Assume A (calling it h). The new goal is B.
  * `exact e`  : `e` is exactly a proof of the goal. Done.
  * `apply f`  : the goal is B and `f : A → B`. Work backwards: the new goal is A.
-/

theorem p_implies_p' (p : Prop) : p → p := by
  intro hp      -- context gains `hp : p`; goal becomes `p`
  exact hp      -- hp proves p. No goals left.

theorem p_q_p' (p q : Prop) : p → q → p := by
  intro hp _    -- you can intro several assumptions at once
  exact hp

-- Chaining implications: if p → q and q → r, then p → r.
theorem imp_trans (p q r : Prop) (hpq : p → q) (hqr : q → r) : p → r := by
  intro hp      -- have hp : p,  goal: r
  apply hqr     -- to get r it's enough to get q.   goal: q
  apply hpq     -- to get q it's enough to get p.   goal: p
  exact hp      -- we have p.

-- The same theorem in term mode, for comparison:
theorem imp_trans_term (p q r : Prop) (hpq : p → q) (hqr : q → r) : p → r :=
  fun hp => hqr (hpq hp)

/-
## 6. And `∧`

`p ∧ q` means "p and q". Type `∧` as `\and`.

To PROVE `p ∧ q`, you need two proofs, one of p and one of q:
  * term mode: `⟨hp, hq⟩`    (angle brackets: type `\<` and `\>`)
  * tactic:    `constructor` splits the goal into two goals, `p` and `q`

To USE `h : p ∧ q`, take it apart:
  * term mode: `h.1 : p` and `h.2 : q`   (also written `h.left`, `h.right`)
  * tactic:    `obtain ⟨hp, hq⟩ := h` replaces h with `hp : p` and `hq : q`
-/

theorem and_intro_example (p q : Prop) (hp : p) (hq : q) : p ∧ q :=
  ⟨hp, hq⟩

theorem and_left (p q : Prop) (h : p ∧ q) : p :=
  h.1

-- Tactic mode. `constructor` leaves two goals; each `·` bullet works on one of them.
-- (This `·` is the same symbol as in Lesson 01, `\.`, but here it means "next goal".)
theorem and_intro_tactic (p q : Prop) (hp : p) (hq : q) : p ∧ q := by
  constructor
  · exact hp    -- first goal:  p
  · exact hq    -- second goal: q

-- The classic first theorem: ∧ is symmetric.
theorem and_swap (p q : Prop) : p ∧ q → q ∧ p := by
  intro h                 -- h : p ∧ q        ⊢ q ∧ p
  obtain ⟨hp, hq⟩ := h    -- hp : p, hq : q   ⊢ q ∧ p
  constructor
  · exact hq
  · exact hp

-- Same theorem, term mode, in one line:
theorem and_swap_term (p q : Prop) : p ∧ q → q ∧ p :=
  fun h => ⟨h.2, h.1⟩

/-
## 7. Using theorems you've already proved

A theorem is just a named proof, so you can use it like a function.
`and_swap p q` has type `p ∧ q → q ∧ p`.
-/

example (a b : Prop) (h : a ∧ b) : b ∧ a :=
  and_swap a b h

/-
## 8. `sorry`: an unfinished proof

`sorry` proves anything, but Lean marks it with a warning. Use it as a placeholder
while you work out a proof, and never leave it in a finished file.
-/

theorem todo (p : Prop) : p → p := by
  sorry

/-
## Recap

* `Prop` is the type of statements. `h : P` means "h is a proof of P".
* `theorem name (inputs) : statement := proof`.
* `p → q` is "if p then q"; a proof of it is a function from proofs of p to proofs of q.
* `by` switches to tactic mode. Watch the goal `⊢` in the infoview.
* `intro` (assume), `exact` (finish), `apply` (work backwards).
* `∧`: build with `⟨_, _⟩` or `constructor`; take apart with `.1 .2` or `obtain ⟨_, _⟩ := h`.

Next: `Exercises02.lean`.
-/

end Lesson02
