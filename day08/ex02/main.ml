let () =
  let open Monoid in
  Printf.printf "Power Int: %d\n" (Calc_int.power 3 3);
  Printf.printf "Power Float: %f\n" (Calc_float.power 3.0 3);
  Printf.printf "Complex Int: %d\n" (Calc_int.mul (Calc_int.add 20 1) 2);
  Printf.printf "Complex Float: %f\n" (Calc_float.mul (Calc_float.add 20.0 1.0) 2.0);

  Printf.printf "Sub Int (10-4): %d\n" (Calc_int.sub 10 4);
  Printf.printf "Sub Float (5.5-1.2): %f\n" (Calc_float.sub 5.5 1.2);
  Printf.printf "Self Sub (10-10): %d\n" (Calc_int.sub 10 10);
  Printf.printf "Neg Sub (3-5): %d\n" (Calc_int.sub 3 5);

  Printf.printf "Fact 5: %d\n" (Calc_int.fact 5);
  Printf.printf "Fact 0: %d\n" (Calc_int.fact 0);
  Printf.printf "Ident: %d\n" (Calc_int.add 42 INT.zero1);
  
  try Printf.printf "Div zero: %d\n" (Calc_int.div 10 0) 
  with Failure e -> print_endline ("Error: " ^ e)