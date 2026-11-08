/-
# Exercises 01

Replace every `sorry` with your answer. A `sorry` makes Lean show a yellow warning,
and a wrong answer makes one of the `example … := rfl` checks show a red error.
You're done when the file has no warnings or errors.

Some questions ask you to *predict* a result. Write your guess in the comment
before you put your cursor on the line.
-/

namespace Exercises01

-- 1. Predict, then check: what do these print?
#eval 10 - 3 * 4          -- my guess:
#eval (10 - 3 * 4 : Int)  -- my guess:
#eval 7 / 2               -- my guess:    (hint: Nat division throws away the remainder)
#eval 7 % 2               -- my guess:

-- 2. Predict the type, then check:
#check (3, "three")                            -- my guess:
#check fun (s : String) => String.length s     -- my guess:
#check fun (x : Nat) (b : Bool) => if b then x else 0   -- my guess:

-- 3. Write `triple`, which multiplies a number by 3.
def triple (n : Nat) : Nat := sorry

example : triple 4 = 12 := rfl
example : triple 0 = 0 := rfl

-- 4. Write `isEven`. Hint: `n % 2 == 0` is a Bool. (`==` compares; a single `=` states a fact.)
def isEven (n : Nat) : Bool := sorry

example : isEven 10 = true := rfl
example : isEven 7 = false := rfl

-- 5. Write `greet`, so that `greet "Ada"` is "Hello, Ada!". Use `s!"..."` or `String.append`.
def greet (name : String) : String := sorry

example : greet "Ada" = "Hello, Ada!" := by decide   -- `by decide` checks it by computing

-- 6. Write `minimum`, the counterpart of `maximum` from the lesson.
def minimum (n k : Nat) : Nat := sorry     -- `(n k : Nat)` is shorthand for `(n : Nat) (k : Nat)`

example : minimum 3 9 = 3 := rfl
example : minimum 9 3 = 3 := rfl

-- 7. Write `compose`, which applies `g` first and then `f`. So `compose f g x = f (g x)`.
def compose (f : Nat → Nat) (g : Nat → Nat) (x : Nat) : Nat := sorry

example : compose (· + 1) (· * 2) 5 = 11 := rfl
example : compose (· * 2) (· + 1) 5 = 12 := rfl

-- 8. Use partial application: define `addFive` with *no* arguments of its own,
--    reusing a function that takes two arguments. (Hint: `Nat.add : Nat → Nat → Nat`.)
def addFive : Nat → Nat := sorry

example : addFive 10 = 15 := rfl

-- 9. Write the same function as an anonymous `fun`, without using `def … (x : Nat)`.
def square : Nat → Nat := sorry

example : square 7 = 49 := rfl

-- 10. Challenge: `applyNTimes f n x` applies `f` to `x` exactly `n` times.
--     You haven't learned recursion yet. Try anyway, or skip it and come back after lesson 09.
--     Hint: a definition can mention itself, and `match n with | 0 => … | k + 1 => …` splits into cases.
def applyNTimes (f : Nat → Nat) (n : Nat) (x : Nat) : Nat := sorry

example : applyNTimes (· + 2) 5 0 = 10 := rfl
example : applyNTimes (· * 2) 10 1 = 1024 := rfl

end Exercises01
