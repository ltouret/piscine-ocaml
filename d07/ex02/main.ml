let () =
  let alkanes : Alkane.alkane list = [
      new Alkane.methane; new Alkane.ethane;
      new Alkane.propane; new Alkane.butane;
      new Alkane.pentane; new Alkane.hexane;
      new Alkane.heptane; new Alkane.octane;
      new Alkane.nonane; new Alkane.decane;
      new Alkane.undecane; new Alkane.dodecane
    ] in

  (* Header *)
  Printf.printf "%-12s | %-8s | %s\n" "Name" "Formula" "Full String";
  print_endline "----------------------------------------------------------------------";


  List.iter (fun a -> 
    Printf.printf "%-12s | %-8s | %s\n" a#name a#formula a#to_string
  ) alkanes;
  print_endline "----------------------------------------------------------------------";

  let m1 = new Alkane.methane in
  let a1 = new Alkane.alkane 1 in
  Printf.printf "\nIdentity Check (Methane vs Alkane 1): %b\n" (m1#equals (a1));

  let m2 = new Alkane.ethane in
  Printf.printf "Identity Check (Methane vs Alkane 1): %b\n" (m1#equals (m2))
