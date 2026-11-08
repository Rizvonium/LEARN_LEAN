/-
# Lesson 01: Expressions, types, definitions, functions

Sources:
  FPIL 1.1–1.3 (Evaluating Expressions, Types, Functions and Definitions)
  TPIL 2.1–2.4 (Simple Type Theory, Types as Objects, Function Abstraction, Definitions)

How to read this file:
  Put your cursor on any line that starts with `#eval` or `#check` and look at the
  infoview on the right. That panel is where Lean talks back to you.

  `--` starts a one-line comment. Block comments go between `/-` and `-/`, like this one.
-/

namespace Lesson01

/-
## 1. Evaluating expressions  (FPIL 1.1)

In most languages you write *statements*: do this, then do that.
In Lean you mostly write *expressions*, and an expression is something that has a value.
`#eval` asks Lean to compute that value.
-/

#eval 1 + 2              -- 3
#eval 1 + 2 * 5          -- 11   (the usual precedence: * before +)
#eval (1 + 2) * 5        -- 15

/-
Calling a function: write the function name, then its arguments separated by spaces.
No parentheses and no commas.  `f x y` in Lean is what `f(x, y)` means in Python or C.
-/

#eval String.append "Hello, " "Lean!"                    -- "Hello, Lean!"
#eval String.append "great " (String.append "oak " "tree")  -- parentheses group a nested call

/-
`if … then … else …` is an expression too, so it always produces a value.
That's why the `else` branch is required.
-/

#eval String.append "it is " (if 1 > 2 then "yes" else "no")   -- "it is no"

/-
## 2. Types  (FPIL 1.2, TPIL 2.1)

Every expression has a **type**, and Lean checks types *before* running anything.
`#check e` shows the type of `e` without evaluating it.

Read `e : T` as "e has type T".
-/

#check 1 + 2             -- 1 + 2 : Nat
#check "hello"           -- "hello" : String
#check true              -- Bool.true : Bool
#check 2.5               -- 2.5 : Float

/-
`Nat` is the natural numbers 0, 1, 2, … with no negatives, so subtraction stops at zero.
To pick a different type, add a *type ascription*: `(e : T)`.
-/

#eval 1 - 2              -- 0  (Nat subtraction can't go below 0)
#eval (1 - 2 : Int)      -- -1 (Int has negatives)
#check (1 - 2 : Int)     -- 1 - 2 : Int

/-
When types don't fit, Lean refuses before running anything. Uncomment the next line to
see the error, then comment it out again:
-/
-- #eval String.append "hello" 5

/-
### Building new types out of old ones  (TPIL 2.1)

* `α → β` is the type of functions that take an `α` and return a `β`.
  Type `→` as `\to` or `\r`. (Plain `->` also works.)
* `α × β` is the type of pairs, where the first part is an `α` and the second a `β`.
  Type `×` as `\times` or `\x`.
-/

#check Nat → Nat                -- functions from Nat to Nat
#check Nat × Bool               -- pairs: a Nat together with a Bool
#check (5, true)                -- (5, true) : Nat × Bool
#eval  (5, true).1              -- 5     (first component)
#eval  (5, true).2              -- true  (second component)

#check Nat → Nat → Nat          -- a function of two Nats

/-
**Important:** `→` groups to the right, so `Nat → Nat → Nat` means `Nat → (Nat → Nat)`.
A "two-argument" function is really a function that takes one Nat and returns *another
function* that waits for the second Nat. This is called **currying**. You'll see it pay
off in section 4.
-/

/-
### Types are values too  (TPIL 2.2)

In Lean, `Nat` is itself an expression, and it has a type: `Type`.
-/

#check Nat              -- Nat : Type
#check Nat → Bool       -- Nat → Bool : Type
#check Type             -- Type : Type 1   (an endless ladder of "universes"; ignore it for now)

/-
## 3. Definitions  (FPIL 1.3, TPIL 2.4)

`def name : Type := value` gives a value a name.
-/

def hello : String := "Hello"
def lean : String := "Lean"

#eval String.append hello (String.append " " lean)    -- "Hello Lean"

/-
Lean can often work out the type on its own, so you may leave it off:
-/
def answer := 42
#check answer           -- answer : Nat

/-
### Defining functions

Put each argument in parentheses with its type, then the return type, then `:=`.
-/

def add1 (n : Nat) : Nat := n + 1

#eval add1 7            -- 8
#check add1             -- add1 (n : Nat) : Nat     (shows the signature)
#check (add1)           -- add1 : Nat → Nat         (shows the plain function type)

def maximum (n : Nat) (k : Nat) : Nat :=
  if n < k then k else n

#eval maximum (5 + 8) (2 * 7)   -- 14

def spaceBetween (before : String) (after : String) : String :=
  String.append before (String.append " " after)

#eval spaceBetween "functional" "programming"

/-
### String interpolation (handy for output)
`s!"..."` evaluates anything inside `{ }` and pastes it into the string.
-/
#eval s!"add1 7 is {add1 7} and the answer is {answer}"

/-
## 4. Functions are values  (TPIL 2.3)

A function doesn't need a name. `fun x => body` is an *anonymous* function
(also called a **lambda**, which is where "lambda calculus" gets its name).
-/

#check fun (x : Nat) => x + 1            -- fun x => x + 1 : Nat → Nat
#eval (fun (x : Nat) => x + 1) 10        -- 11

/-
In fact, `def add1 (n : Nat) : Nat := n + 1` is just shorthand for:
-/
def add1' : Nat → Nat := fun n => n + 1
#eval add1' 7           -- 8, same as add1

/-
Another shorthand: `(· + 1)` means `fun x => x + 1`.
Type the dot `·` as `\.` (it is not a full stop).
-/
#eval (· * 2) 21        -- 42

/-
### Currying pays off: partial application
Since `maximum : Nat → Nat → Nat`, giving it *one* argument returns a function:
-/
#check maximum 10                 -- maximum 10 : Nat → Nat
def atLeastTen := maximum 10
#eval atLeastTen 3                -- 10
#eval atLeastTen 25               -- 25

/-
### Functions that take functions  (higher-order functions)
-/
def applyTwice (f : Nat → Nat) (x : Nat) : Nat := f (f x)

#eval applyTwice add1 0           -- 2
#eval applyTwice (· * 3) 1        -- 9
#check (applyTwice)               -- (Nat → Nat) → Nat → Nat

/-
### `let`: a local name inside an expression  (TPIL 2.4)
-/
def areaOfSquareFromPerimeter (p : Nat) : Nat :=
  let side := p / 4
  side * side

#eval areaOfSquareFromPerimeter 20   -- 25

/-
## 5. First taste of proof: `example` and `rfl`

You can also *state facts* and get Lean to check them. `rfl` (short for "reflexivity")
says "both sides compute to the same thing". If they don't, Lean reports an error.
We'll go much deeper in lessons 04–07. For now, think of these as tests that can't lie.
-/

example : add1 7 = 8 := rfl
example : maximum 3 9 = 9 := rfl
example : applyTwice (· + 5) 0 = 10 := rfl
-- example : add1 7 = 9 := rfl     -- uncomment this: Lean rejects it

/-
## Recap

* `#eval e` computes a value. `#check e` shows a type.
* Every expression has a type. Read `e : T` as "e has type T".
* `Nat` stops at zero, so `1 - 2 = 0`. Use `(… : Int)` if you need negatives.
* `α → β` is a function type and `α × β` is a pair type. `→` groups to the right.
* Types are values too: `Nat : Type`.
* `def f (x : α) : β := body` defines a function; `fun x => body` is the same function without a name.
* Give a function fewer arguments than it takes and you get back a function (partial application).
* `example : a = b := rfl` asks Lean to check that `a` and `b` compute to the same value.

Next: open `Exercises01.lean`.
-/

end Lesson01
