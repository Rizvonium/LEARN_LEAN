/-
# Solutions 01  (try the exercises first!)
-/

namespace Solutions01

-- 1.
#eval 10 - 3 * 4          -- 0    (10 - 12 stops at 0 for Nat)
#eval (10 - 3 * 4 : Int)  -- -2
#eval 7 / 2               -- 3
#eval 7 % 2               -- 1

-- 2.
#check (3, "three")                            -- Nat × String
#check fun (s : String) => String.length s     -- String → Nat
#check fun (x : Nat) (b : Bool) => if b then x else 0   -- Nat → Bool → Nat

-- 3.
def triple (n : Nat) : Nat := 3 * n
example : triple 4 = 12 := rfl
example : triple 0 = 0 := rfl

-- 4.
def isEven (n : Nat) : Bool := n % 2 == 0
example : isEven 10 = true := rfl
example : isEven 7 = false := rfl

-- 5.
def greet (name : String) : String := s!"Hello, {name}!"
example : greet "Ada" = "Hello, Ada!" := by decide
-- Note: for strings, `by decide` is a more reliable checker than `rfl`, because of how
-- strings are stored internally. If `rfl` gives you trouble, use `by decide`.

-- 6.
def minimum (n k : Nat) : Nat := if n < k then n else k
example : minimum 3 9 = 3 := rfl
example : minimum 9 3 = 3 := rfl

-- 7.
def compose (f : Nat → Nat) (g : Nat → Nat) (x : Nat) : Nat := f (g x)
example : compose (· + 1) (· * 2) 5 = 11 := rfl
example : compose (· * 2) (· + 1) 5 = 12 := rfl

-- 8.
def addFive : Nat → Nat := Nat.add 5
example : addFive 10 = 15 := rfl

-- 9.
def square : Nat → Nat := fun x => x * x
example : square 7 = 49 := rfl

-- 10.
def applyNTimes (f : Nat → Nat) (n : Nat) (x : Nat) : Nat :=
  match n with
  | 0     => x
  | k + 1 => f (applyNTimes f k x)
example : applyNTimes (· + 2) 5 0 = 10 := rfl
example : applyNTimes (· * 2) 10 1 = 1024 := rfl

end Solutions01
