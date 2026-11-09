# LEARN_LEAN

A step-by-step Lean 4 course built from two official books:

- **TPIL**: [Theorem Proving in Lean 4](https://lean-lang.org/theorem_proving_in_lean4/) (logic and proofs)
- **FPIL**: [Functional Programming in Lean](https://lean-lang.org/functional_programming_in_lean/) (programming)

The two run side by side: FPIL teaches you to write programs, TPIL teaches you to
prove things about them. Lean uses the same language for both.

## How to use this repo

Each lesson has three files in `LearnLean/`:

| File | What it's for |
|------|---------------|
| `LessonNN.lean` | The lesson. Read it top to bottom with the infoview open. |
| `ExercisesNN.lean` | Exercises. Replace each `sorry` with your answer. |
| `SolutionsNN.lean` | Answers. Look only after you've tried. |

### Option A: no install (quickest)
Open <https://live.lean-lang.org>, paste in a lesson file, and click any `#eval` or
`#check` line. The result shows in the panel on the right.

### Option B: local install (recommended once you're hooked)
1. Install [VS Code](https://code.visualstudio.com/).
2. Install the **lean4** extension and follow its setup guide. It installs `elan`, the Lean version manager.
3. Clone this repo, open the folder in VS Code, and open a lesson file.
4. Open the infoview with `Ctrl+Shift+Enter` (`Cmd+Shift+Enter` on a Mac).

## Roadmap (aimed at formalizing theorems)

The goal is to formalize mathematics. Theorem Proving in Lean is the main text.
Functional Programming in Lean comes in only where proofs need it. From Lesson 07 on we
add Mathlib, Lean's library of formalized mathematics, and its companion book
[Mathematics in Lean](https://leanprover-community.github.io/mathematics_in_lean/).

| # | Topic | Source |
|---|-------|--------|
| 01 | Expressions, types, definitions, functions | FPIL 1.1–1.3, TPIL 2.1–2.4 |
| 02 | Propositions as types; `theorem`; `→` and `∧`; tactics `intro` `exact` `apply` `constructor` `obtain` | TPIL 3.1–3.3, 5.1–5.2 |
| 03 | `∨`, `¬`, `False`, `↔`; tactics `left` `right` `rcases` `exfalso`; classical logic | TPIL 3.3–3.6, 5 |
| 04 | Quantifiers `∀` `∃` and equality; tactics `rw` `use`; `calc` proofs | TPIL 4, 5 |
| 05 | Natural numbers and proof by induction; `simp`, `omega`, `decide` | TPIL 7–8, 5 |
| 06 | Defining your own mathematical objects: `structure`, `inductive`, classes | TPIL 7, 9–10 |
| 07 | Setting up Mathlib; searching for lemmas (`exact?`, `apply?`, `rw?`); `ring`, `linarith` | MIL 1–2 |
| 08 | Logic and sets in Mathlib: sets, functions, injective/surjective | MIL 3–4 |
| 09 | Number theory: divisibility, primes, √2 is irrational | MIL 5 |
| 10 | Formalizing a theorem of your choice from start to finish | — |

Progress: ✅ Lesson 01 · ✅ Lesson 02
