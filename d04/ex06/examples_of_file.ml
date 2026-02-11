let examples_of_file filename =
  let ic = open_in filename in
  let try_read () =
    try Some (input_line ic) with End_of_file -> None in
  let rec loop acc = 
    match try_read () with
    | None -> 
        close_in ic; 
        List.rev acc
    | Some s ->
        let trimmed_line = String.trim s in
        if trimmed_line = "" then loop acc
        else
          let fields = String.split_on_char ',' trimmed_line in
          match List.rev fields with
          | [] -> loop acc
          | class_label :: rev_features ->
              let features = List.rev rev_features in
              let float_features = List.map float_of_string features in
              let feature_array = Array.of_list float_features in
              let final_values = (feature_array, String.trim class_label) in
              loop (final_values :: acc)
  in
  loop []

let print_tuple (features, label) =
  print_string "[| ";
  Array.iter (fun x -> Printf.printf "%f; " x) features;
  Printf.printf "|] -> Label: %s\n" label

let () =
    let my_data = examples_of_file "test.csv" in
    List.iter print_tuple my_data;
    print_char '\n';
