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

let rec flatten_pairs pairs =
  match pairs with
  | [] -> []
  | (count, value) :: t -> count :: value :: flatten_pairs t

let rec list_to_string l =
  match l with
  | [] -> ""
  | h :: t -> string_of_int h ^ list_to_string t

let sequence n =
  if n < 1 then
    ""
  else
    let rec build_nth current_list step =
      if step = n then
        list_to_string current_list
      else
        let encoded = encode current_list in
        let next_list = flatten_pairs encoded in
        build_nth next_list (step + 1)
    in
    build_nth [1] 1

let () =
  print_endline (sequence (-1));
  print_endline (sequence 1);
  print_endline (sequence 2);
  print_endline (sequence 3);
  print_endline (sequence 4);
  print_endline (sequence 5);
  print_endline (sequence 6);
  print_endline (sequence 7)