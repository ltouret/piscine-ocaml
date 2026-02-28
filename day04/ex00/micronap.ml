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
        for i = seconds downto 1 do
          my_sleep ();
        done
      )
    with
    | Failure _ -> 
        print_endline "Error: Argument must be a valid integer."
