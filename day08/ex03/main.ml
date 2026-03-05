let () =
  let open Try.Try in
  let divide x y =
    if y = 0 then failwith "Div by zero" else x / y
  in

  let result = 
    return 10
    |> (fun m -> bind m (fun v -> return (divide 100 v)))
    |> (fun m -> filter m (fun v -> v > 5))
  in

  begin match result with
  | Success v -> Printf.printf "Result: %d\n" v
  | Failure _ -> print_endline "Something went wrong"
  end;

  let fail_res = 
    return 0
    |> (fun m -> bind m (fun v -> return (divide 100 v)))
  in
  
  begin match fail_res with
  | Failure (Failure msg) -> Printf.printf "Caught expected error: %s\n" msg
  | _ -> ()
  end;

  let recovered =
    return 0
    |> (fun m -> bind m (fun v -> return (divide 100 v)))
    |> (fun m -> recover m (fun _ -> return (-1)))
  in

  begin match recovered with
  | Success v -> Printf.printf "Recovered with default: %d\n" v
  | Failure _ -> print_endline "Recovery failed"
  end;

  let filtered =
    return 3
    |> (fun m -> filter m (fun v -> v > 5))
  in

  begin match filtered with
  | Failure (Failure msg) -> Printf.printf "Filter rejected: %s\n" msg
  | Success v -> Printf.printf "Filter passed: %d\n" v
  | _ -> ()
  end;

  let nested = Success (return 42) in
  begin match flatten nested with
  | Success v -> Printf.printf "Flattened: %d\n" v
  | Failure _ -> print_endline "Flatten failed"
  end