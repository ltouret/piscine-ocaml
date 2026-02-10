let eu_dist arr1 arr2 =
  let rec loop x acc =
    if x < Array.length arr1 then (
      let diff = arr1.(x) -. arr2.(x) in
      let square = diff *. diff in
      loop (x + 1) (acc +. square)
    ) else
      acc
in
let sum = loop 0 0.0 in
(sqrt sum)

let () =
    print_float (eu_dist [| 1.0; 3.0; 9.0 |] [| 4.0; 7.0; -3.0 |]);
    print_char '\n';
    print_float (eu_dist [||] [||]);
    print_char '\n';
    print_float (eu_dist [| 1.0; 2.0 |] [| 4.0; 6.0 |]);
    print_char '\n';
    print_float (eu_dist [| 1.0; 2.0 |] [| 2.0; 6.0 |]);
    print_char '\n';
