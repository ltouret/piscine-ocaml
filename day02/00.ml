let rec encode l =
  let rec count_streak current_char tail accumulator =
    match tail with
    | [] -> (accumulator, [])
    | h :: t ->
        if h = current_char then
            count_streak current_char t (accumulator + 1)
        else
          (accumulator, h :: t)
  in

  match l with
  | [] -> []
  | h :: t -> 
      let (count, remainder) = count_streak h t 1 in
      (count, h) :: encode remainder

let rec print_encode_string l =
    match l with
    | [] -> print_char '\n'
    | h :: t ->
        let (count, remainder) = h in
        print_int count;
        print_string remainder;
        print_char ' ';
        print_encode_string t

let rec print_encode_int l =
    match l with
    | [] -> print_char '\n'
    | h :: t ->
        let (count, remainder) = h in
        print_int count;
        print_char '-';
        print_int remainder;
        print_char ' ';
        print_encode_int t

let _ =
        print_encode_string(encode ["Mark"; "Dylan"; "Andrew"; "Yi"; "Yi"]);
        print_encode_string(encode ["a"; "a"; "a"; "b"; "b"; "b"; "a"; "a"; "a"]);
        print_encode_int(encode [1; 1; 1; 2; 2; 2;]);
        print_encode_int(encode [9; 9; 9; 9; 77; 77;]);
        print_encode_int(encode []);