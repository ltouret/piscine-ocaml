let gray n =
    if n < 1 then (
        print_endline ("Error must be bigger than 0")
    )
    else (
  let rec generate n =
    if n <= 1 then ["0"; "1"]
    else
      let previous = generate (n - 1) in
      
      let rec add_zero l =
        match l with
        | [] -> []
        | h :: t ->
            ("0" ^ h) :: add_zero t in
      
      let rec add_one_and_rev l acc =
        match l with
        | [] -> acc
        | h :: t ->
            add_one_and_rev t (("1" ^ h) :: acc) in

      let rec join l1 l2 =
        match l1 with
        | [] -> l2
        | h :: t ->
            h :: join t l2 in

      join (add_zero previous) (add_one_and_rev previous [])
    in
    print_endline(String.concat " " (generate n))
    ) 


let _ =
        gray (-1);
        gray 1;
        gray 2;
        gray 3;
        gray 4;