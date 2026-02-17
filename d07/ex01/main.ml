let () =
  let h2o   = new Molecule.water in
  let co2   = new Molecule.carbon_dioxide in
  let ch4   = new Molecule.methane in
  let h2so4 = new Molecule.sulfuric_acid in
  let nh3   = new Molecule.ammonia in

  let lab_samples = [
    (h2o);
    (co2);
    (ch4);
    (h2so4);
    (nh3);
  ] in

  print_endline "======================================================================";
  print_endline "                     CHEMICAL ANALYSIS REPORT                         ";
  print_endline "======================================================================";

  List.iter (fun m ->
    Printf.printf "Name: %-15s | Full: %-25s | Formula: %s\n" 
      m#name m#to_string m#formula
  ) lab_samples;

  print_endline "----------------------------------------------------------------------";

  let another_water = new Molecule.water in
  Printf.printf "Check: Is %s == %s? %b\n" h2o#name another_water#name (h2o#equals (another_water :> Molecule.molecule));
  Printf.printf "Check: Is %s == %s?   %b\n" h2o#name co2#name (h2o#equals (co2 :> Molecule.molecule));
  Printf.printf "Check: Is %s == %s?   %b\n" ch4#name co2#name (ch4#equals (co2 :> Molecule.molecule));

  print_endline "----------------------------------------------------------------------";