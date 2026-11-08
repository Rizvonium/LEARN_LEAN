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

## Roadmap

| # | Topic | FPIL | TPIL |
|---|-------|------|------|
| 01 | Expressions, types, definitions, functions | 1.1–1.3 | 2.1–2.4 |
| 02 | Structures and pattern matching | 1.4–1.5 | — |
| 03 | Polymorphism, `variable`, sections, namespaces | 1.6 | 2.5–2.8 |
| 04 | Dependent types, Prop, propositions as types | — | 2.9, 3.1–3.2 |
| 05 | Propositional logic proofs (∧ ∨ → ¬ ↔) | — | 3.3–3.6 |
| 06 | Quantifiers and equality (∀ ∃ =) | — | 4 |
| 07 | Tactics | — | 5 |
| 08 | Hello, World! I/O and programs | 2 | — |
| 09 | Inductive types and recursion | 1.5, 3 | 7–8 |
| 10 | Type classes | 4 | 10 |
| … | Monads, structures, induction proofs | 5+ | 6, 9+ |

Progress: ✅ Lesson 01
