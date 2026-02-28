let () =
  let companion = new People.people "Worf" in
  
  print_endline "--- Time Lord Materialization ---";
  let the_doc = new Doctor.doctor "The Tenth Doctor" 900 companion in
  
  print_newline ();
  print_endline "--- Testing Interaction ---";
  the_doc#talk;
  print_newline ();
  the_doc#use_sonic_screwdriver;
  
  print_newline ();
  print_endline "--- Testing Time Travel to the future (Going from the year 2026 to the year 3026) ---";
  (* 900 + 1000 = 1900 years old *)
  the_doc#travel_in_time 2026 3026;

  print_newline ();
  print_endline "--- Age should change to 1900 years old ---";
  print_endline the_doc#to_string;

  print_newline ();
  print_endline "--- Testing Time Travel to the past (Going from the year 3026 to the year 2026) ---";
  (* 1900 - 1000 = 900 years old *)
  the_doc#travel_in_time 3026 2026;
  
  print_newline ();
  print_endline "--- Final Status Check ---";
  print_endline the_doc#to_string;

  print_newline ();
  print_endline "--- Testing Encapsulation ---";
  print_endline "Note: the_doc#regenerate cannot be called here because it is private!";
  (* the_doc#regenerate; *)