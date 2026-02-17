class dalek =
  object (self)
    val name : string = 
      let random_char () = 
        let chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" in
        String.make 1 (chars.[Random.int (String.length chars)]) 
      in
      "Dalek" ^ (random_char ()) ^ (random_char ()) ^ (random_char ())

    val mutable hp : int = 100
    val mutable shield : bool = true

    method to_string =
      "Name: " ^ name ^
      " | HP: " ^ string_of_int hp ^
      " | Shield: " ^ string_of_bool shield ^
      ". I must Exterminate, Exterminate!"

    method talk =
      let phrases = [|
        "Explain! Explain!";
        "Exterminate! Exterminate!";
        "I obey!";
        "You are the Doctor! You are the enemy of the Daleks!"
      |] in
      print_endline phrases.(Random.int (Array.length phrases))

    method exterminate (target : People.people) =
      shield <- not shield;
      print_endline (name ^ " is aiming at " ^ target#get_name ^ "!");
      target#die

    method die =
      print_endline "Emergency Temporal Shift!"
  end