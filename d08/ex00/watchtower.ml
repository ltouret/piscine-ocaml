module type Watchtower = sig
  type hour = int
  val zero : hour
  val add : hour -> hour -> hour
  val sub : hour -> hour -> hour
end

module Watchtower : Watchtower = struct
  type hour = int
  let zero = 12

  let normalize h =
    let r = h mod zero in
    if r = 0 then
      zero
    else if r < 0 then
      r + zero
    else
      r

  let add a b = normalize (a + b)
  let sub a b = normalize (a - b)
end