let () =
  let h1 = new Atom.hydrogen in
  let h2 = new Atom.hydrogen in
  let o = new Atom.oxygen in
  let au = new Atom.gold in
  let fe = new Atom.iron in

  print_endline "--- Testing Atoms ---";
  print_endline h1#to_string;
  print_endline h2#to_string;
  print_endline o#to_string;
  print_endline au#to_string;
  print_endline fe#to_string;

  print_newline ();
  print_endline "--- Testing Equality ---";
  Printf.printf "Is H equal to H? %b\n" (h1#equals h2);
  Printf.printf "Is H equal to O? %b\n" (h1#equals o);
  Printf.printf "Is AU equal to O? %b\n" (au#equals o);
  Printf.printf "Is FE equal to AU? %b\n" (fe#equals au);

  print_newline ();
  print_endline "Check complete."