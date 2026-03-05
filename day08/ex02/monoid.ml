module type MONOID =
sig
type element
val zero1 : element
val zero2 : element
val mul : element -> element -> element
val add : element -> element -> element
val div : element -> element -> element
val sub : element -> element -> element
end

module INT: (MONOID with type element = int) = struct
  type element = int
  let zero1: element = 0
  let zero2: element = 1
  let add (a: element) (b: element) = a + b
  let sub (a: element) (b: element) = a - b
  let mul (a: element) (b: element) = a * b
  let div (a: element) (b: element) = a / b
end

module FLOAT: (MONOID with type element = float) = struct
  type element = float
  let zero1: element = 0.0
  let zero2: element = 1.0
  let add (a: element) (b: element) = a +. b
  let sub (a: element) (b: element) = a -. b
  let mul (a: element) (b: element) = a *. b
  let div (a: element) (b: element) = a /. b
end

module type Calc =
functor (M : MONOID) ->
sig
val add : M.element -> M.element -> M.element
val sub : M.element -> M.element -> M.element
val mul : M.element -> M.element -> M.element
val div : M.element -> M.element -> M.element
val power : M.element -> int -> M.element
val fact : M.element -> M.element
end

module Calc: Calc =
functor (M : MONOID) ->
struct
  let add (a: M.element) (b: M.element) = M.add a b
  let sub (a: M.element) (b: M.element) = M.sub a b
  let mul (a: M.element) (b: M.element) = M.mul a b
  let div (a: M.element) (b: M.element) =
    if b = M.zero1 then 
      failwith "Cant divide by zero"
    else
      M.div a b

  let rec power (a: M.element) (b: int) =
        if b = 0 then M.zero2
        else M.mul a (power a (b - 1))

  let rec fact (a: M.element) =
      if a <= M.zero1 then M.zero2
      else M.mul a (fact (sub a M.zero2))
end

module Calc_int = Calc(INT)
module Calc_float = Calc(FLOAT)