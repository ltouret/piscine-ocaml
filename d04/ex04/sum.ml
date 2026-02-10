let sum a b =
  a +. b

let () =
  print_float (sum 2.1 2.1);
  print_char '\n';
  print_float (sum (sum 1.05 1.05) (sum 1.05 1.05));
  print_char '\n';
  print_float (sum 1.1 2.0);
  print_char '\n'
