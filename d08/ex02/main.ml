let () =
  Random.self_init ();

  print_endline "=== SIMULATION ===";

  let sidekick = new People.people "Worf" in
  let doc = new Doctor.doctor "The Tenth Doctor" 900 sidekick in
  let dalek = new Dalek.dalek in

  print_newline ();
  print_endline "--- Initial Meeting ---";
  print_endline doc#to_string;
  print_endline ("A wild " ^ dalek#to_string ^ " appears!");

  print_newline ();
  print_endline "--- Interaction Test ---";
  doc#talk;
  dalek#talk;
  doc#use_sonic_screwdriver;

  print_newline ();
  print_endline "--- The Exterminate Test ---";
  dalek#exterminate sidekick;
  print_endline ("Dalek state after attack: " ^ dalek#to_string);

  print_newline ();
  print_endline "--- The Time Travel Test ---";
  doc#travel_in_time 2006 2026;
  print_endline ("Doctor's status after jumping 20 years: " ^ doc#to_string);

  print_newline ();
  print_endline "--- The End Test ---";
  dalek#die;
  
  print_endline "=== SIMULATION COMPLETE ==="