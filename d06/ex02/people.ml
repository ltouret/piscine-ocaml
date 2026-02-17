class people (name : string) =
  object (self)
  val mutable hp: int = 100

  initializer
    print_endline ("From far away someone new is here, his name is: " ^ name ^ " and he has " ^ (string_of_int hp) ^ " HP.")

  method to_string =
    "My name is " ^ name ^ " and I have " ^ (string_of_int hp) ^ " HP."

  method talk =
    print_endline ("I'm " ^ name ^ "! Do you know the Doctor?")

  method die =
    hp <- 0;
    print_endline "Aaaarghh!"

  method get_name =
    name
end