let read_lines filename =
  try
    let contents = In_channel.with_open_bin filename In_channel.input_all in
    let list_of_bad_jokes = String.split_on_char '\n' (String.trim contents) in
    Array.of_list list_of_bad_jokes
  with Sys_error msg ->
    Printf.printf "Could not open file: %s\n" msg;
    exit 1

let () =
  if Array.length Sys.argv <> 2 then
    print_endline "Usage: ./program <filename>"
  else
    let filename = Sys.argv.(1) in
    let array_of_bad_jokes = read_lines filename in
    
    if Array.length array_of_bad_jokes > 0 then (
      Random.self_init ();
      Array.shuffle ~rand:Random.int array_of_bad_jokes;
      print_endline array_of_bad_jokes.(0)
    ) else
      print_endline "Error: The file is empty."
