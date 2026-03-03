let () =
  let open App in
  let print_proj ((a, b, c): App.project): unit =
    Printf.printf "A : %s | Status : %s | Grade : %d\n" a b c
  in
  let app1: App.project = (("Leo", "succeed", 100): App.project) in 
  let app2: App.project = (("Toad", "failed", 65): App.project) in
  print_proj (App.combine app1 app2); 
  print_proj (App.combine app2 app1); 
  print_proj (App.fail app1);
  print_proj (App.success app2)