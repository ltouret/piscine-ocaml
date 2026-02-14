module type FIXED = sig
  type t
  val of_float : float -> t
  val of_int : int -> t
  val to_float : t -> float
  val to_int : t -> int
  val to_string : t -> string
  val zero : t
  val one : t
  val succ : t -> t
  val pred : t -> t
  val min : t -> t -> t
  val max : t -> t -> t
  val gth : t -> t -> bool
  val lth : t -> t -> bool
  val gte : t -> t -> bool
  val lte : t -> t -> bool
  val eqp : t -> t -> bool (** physical equality *)
  val eqs : t -> t -> bool (** structural equality *)
  val add : t -> t -> t
  val sub : t -> t -> t
  val mul : t -> t -> t
  val div : t -> t -> t
  val foreach : t -> t -> (t -> unit) -> unit
end

module type FRACTIONNAL_BITS = sig
  val bits : int
end

module type MAKE = functor (FB : FRACTIONNAL_BITS) -> FIXED

module Make : MAKE = functor (FB : FRACTIONNAL_BITS) -> struct
  (* private *)
  type t = int
  let scale = 1 lsl FB.bits
  let f_scale = float_of_int scale

  (* public *)
  let of_int x = x lsl FB.bits
  let of_float x = int_of_float (floor (x *. f_scale +. 0.5))
  let to_float x = (float_of_int x) /. f_scale
  let to_int x = x asr FB.bits
  let to_string x = let f = to_float x in if f = floor f then Printf.sprintf "%.0f." f else string_of_float f
  
  let zero = 0
  let one = scale
  
  let succ x = x + 1
  let pred x = x - 1
  
  let min x y = if x < y then x else y
  let max x y = if x > y then x else y
  let gth x y = x > y
  let lth x y = x < y
  let gte x y = x >= y
  let lte x y = x <= y
  let eqp x y = x == y
  let eqs x y = x = y
  
  let add x y = x + y
  let sub x y = x - y
  let mul x y = (x * y) asr FB.bits
  let div x y = (x lsl FB.bits) / y
  
  let foreach x y f = let rec loop c = if c <= y then (f c; loop (c + 1)) in loop x
end

module Fixed4 : FIXED = Make (struct let bits = 4 end)
module Fixed8 : FIXED = Make (struct let bits = 8 end)

let () =
  let x8 = Fixed8.of_float 21.10 in
  let y8 = Fixed8.of_float 21.32 in
  let r8 = Fixed8.add x8 y8 in
  print_endline (Fixed8.to_string r8);
  Fixed4.foreach (Fixed4.zero) (Fixed4.one) (fun f -> print_endline (Fixed4.to_string f))