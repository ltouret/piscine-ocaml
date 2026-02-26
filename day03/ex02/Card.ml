module Color =
struct
  type t = Spade | Heart | Diamond | Club

  let all = [Spade; Heart; Diamond; Club]

  let toString = function
    | Spade -> "S"
    | Heart -> "H"
    | Diamond -> "D"
    | Club -> "C"

  let toStringVerbose = function
    | Spade -> "Spade"
    | Heart -> "Heart"
    | Diamond -> "Diamond"
    | Club -> "Club"
end

module Value =
struct
  type t = T2 | T3 | T4 | T5 | T6 | T7 | T8 | T9 | T10 | Jack | Queen | King | As

  let all = [T2; T3; T4; T5; T6; T7; T8; T9; T10; Jack; Queen; King; As]

  let toInt = function
    | T2 -> 1
    | T3 -> 2
    | T4 -> 3
    | T5 -> 4
    | T6 -> 5
    | T7 -> 6
    | T8 -> 7
    | T9 -> 8
    | T10 -> 9
    | Jack -> 10
    | Queen -> 11
    | King -> 12
    | As -> 13

  let toString = function
    | T2 -> "2"
    | T3 -> "3"
    | T4 -> "4"
    | T5 -> "5"
    | T6 -> "6"
    | T7 -> "7"
    | T8 -> "8"
    | T9 -> "9"
    | T10 -> "10"
    | Jack -> "J"
    | Queen -> "Q"
    | King -> "K"
    | As -> "A"

  let toStringVerbose = function
    | T2 -> "2"
    | T3 -> "3"
    | T4 -> "4"
    | T5 -> "5"
    | T6 -> "6"
    | T7 -> "7"
    | T8 -> "8"
    | T9 -> "9"
    | T10 -> "10"
    | Jack -> "Jack"
    | Queen -> "Queen"
    | King -> "King"
    | As -> "As"

  let next = function
    | T2 -> T3
    | T3 -> T4
    | T4 -> T5
    | T5 -> T6
    | T6 -> T7
    | T7 -> T8
    | T8 -> T9
    | T9 -> T10
    | T10 -> Jack
    | Jack -> Queen
    | Queen -> King
    | King -> As
    | As -> invalid_arg "No valid succesor after As"

  let previous = function
    | T2 -> invalid_arg "No valid precessor before 2"
    | T3 -> T2
    | T4 -> T3
    | T5 -> T4
    | T6 -> T5
    | T7 -> T6
    | T8 -> T7
    | T9 -> T8
    | T10 -> T9
    | Jack -> T10
    | Queen -> Jack
    | King -> Queen
    | As -> King
end

type t = { value: Value.t; color: Color.t }

let newCard value color = { value; color }

let allSpades =
  List.map (fun v -> newCard v Color.Spade) Value.all

let allHearts =
  List.map (fun v -> newCard v Color.Heart) Value.all

let allDiamonds =
  List.map (fun v -> newCard v Color.Diamond) Value.all

let allClubs =
  List.map (fun v -> newCard v Color.Club) Value.all

let all =
  List.concat[allSpades; allHearts; allDiamonds; allClubs]

let getValue c =
  c.value
  
let getColor c =
  c.color

let toString c =
  (Value.toString c.value) ^ " " ^ (Color.toString c.color)

let toStringVerbose c =
  (Value.toStringVerbose c.value) ^ " of " ^ (Color.toStringVerbose c.color)

let compare c1 c2 =
   (Value.toInt c1.value) - (Value.toInt c2.value)

let min c1 c2 =
  if Value.toInt c2.value < Value.toInt c1.value then
    c2
  else
    c1

let max c1 c2 =
  if Value.toInt c2.value > Value.toInt c1.value then
    c2
  else
    c1

let best cards =
  match cards with
  | [] -> invalid_arg "Empty deck"
  | h :: t -> List.fold_left max h t

let isOf card color =
  card.color = color

let isSpade c =
  c.color = Color.Spade

let isHeart c =
  c.color = Color.Heart

let isDiamond c =
  c.color = Color.Diamond

let isClub c =
  c.color = Color.Club