let () =
  print_endline "=== STARFLEET PERSONNEL INITIALIZATION ===";
  
  let p1 = new People.people "Jean-Luc Picard" in
  let p2 = new People.people "Data" in
  let p3 = new People.people "Worf" in
  
  print_endline "\n=== TESTING: talk ===";
  p1#talk;
  p2#talk;
  p3#talk;
  
  print_endline "\n=== TESTING: to_string ===";
  print_endline (p1#to_string);
  print_endline (p2#to_string);
  print_endline (p3#to_string);
  
  print_endline "\n=== TESTING: die ===";
  p1#die;
  p2#die;
  p3#die;
  
  print_endline "\n=== MISSION LOG ENDED ==="