let my_sleep () = Unix.sleep 1

let () =
  if Array.length Sys.argv <> 2 then (
    print_endline "Error: Please provide exactly one integer argument.";
    exit 1
  )
  else
    try
      let seconds = int_of_string Sys.argv.(1) in
      if seconds < 0 then (
        print_endline "Error: Number of seconds cannot be negative.";
        exit 1
      )
      else (
        let rec loop n =
          if n > 0 then (
            print_endline (string_of_int n);
            my_sleep ();
            loop (n - 1)
          )
        in
        loop seconds
      )
    with
    | Failure _ -> 
        print_endline "Error: Argument must be a valid integer."