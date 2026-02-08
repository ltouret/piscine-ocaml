let rec crossover l1 l2 =
  let rec exists target list =
    match list with
    | [] -> false
    | h :: t ->
        if h = target then
            true
        else
            exists target t
  in

  match l1 with
  | [] -> []
  | h1 :: t1 ->
      if exists h1 l2 then
        h1 :: crossover t1 l2
      else
        crossover t1 l2

let rec print_crossover_int l =
    match l with
    | [] -> print_char '\n'
    | h :: t ->
        print_int h;
        print_char ' ';
        print_crossover_int t

let rec print_crossover_string l =
    match l with
    | [] -> print_char '\n'
    | h :: t ->
        print_string h;
        print_char ' ';
        print_crossover_string t

let _ =
        print_crossover_int (crossover [1; 2; 3; 4] [1; 2]);
        print_crossover_int (crossover [1] [1; 2]);
        print_crossover_int (crossover [1; 2; 3; 4] [4; 3; 2; 1]);
        print_crossover_string (crossover ["Mark"; "Dylan"; "Andrew"; "Leo"] ["Mark"; "Dylan"; "Andrew"; "Yi"; "Franco"]);