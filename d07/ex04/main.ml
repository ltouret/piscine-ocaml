let () =
  let alkanes : Alkane.alkane list = [
      new Alkane.methane; new Alkane.ethane;
      new Alkane.propane; new Alkane.butane;
    ] in

  let print_reaction (r : Reaction.reaction) =
    let mol_str lst =
      String.concat " + "
        (List.map (fun ((m : Molecule.molecule), c) ->
          if c = 1 then m#formula
          else string_of_int c ^ " " ^ m#formula) lst)
    in
    Printf.printf "%s -> %s\n" (mol_str r#get_start) (mol_str r#get_result)
  in

  print_endline "=== Alkane Combustion ===";
  List.iter (fun alk ->
    let comb = new Alkane_combustion.alkane_combustion [alk] in
    Printf.printf "%-12s | balanced: %-5b | " alk#name comb#is_balanced;
    let balanced = comb#balance in
    Printf.printf "after balance: %-5b | " balanced#is_balanced;
    print_reaction balanced
  ) alkanes;

  print_endline "\n--- Duplicate removal test (3x methane) ---";
  let comb_dup = new Alkane_combustion.alkane_combustion
    [new Alkane.methane; new Alkane.methane; new Alkane.methane] in
  let bal_dup = comb_dup#balance in
  print_reaction bal_dup;

  print_endline "\n--- Multi-alkane combustion (methane + propane) ---";
  let comb_multi = new Alkane_combustion.alkane_combustion
    [new Alkane.methane; new Alkane.propane] in
  let bal_multi = comb_multi#balance in
  print_reaction bal_multi;

  print_endline "\n--- Unbalanced access test ---";
  let comb_unbal = new Alkane_combustion.alkane_combustion [new Alkane.methane] in
  Printf.printf "is_balanced: %b\n" comb_unbal#is_balanced;
  (try
    ignore (comb_unbal#get_start);
    print_endline "get_start: no exception (unexpected)"
  with Failure msg -> Printf.printf "get_start raised: %s\n" msg);
  (try
    ignore (comb_unbal#get_result);
    print_endline "get_result: no exception (unexpected)"
  with Failure msg -> Printf.printf "get_result raised: %s\n" msg)
