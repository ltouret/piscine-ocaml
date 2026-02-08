let () =
  print_endline "--- Testing Individual Cards ---";
  let c1 = newCard Value.As Color.Spade in
  let c2 = newCard Value.T2 Color.Heart in
  let c3 = newCard Value.King Color.Spade in

  print_endline ("Card 1: " ^ toStringVerbose c1);
  print_endline ("Card 2: " ^ toString c2);
  
  print_endline "\n--- Testing Comparison ---";
  let winner = max c1 c2 in
  print_endline ("Between Ace and 2, the winner is: " ^ toString winner);

  print_endline "\n--- Testing Suit Filters ---";
  let spade_check = isSpade c1 in
  let heart_check = isSpade c2 in
  Printf.printf "Is %s a Spade? %b\n" (toString c1) spade_check;
  Printf.printf "Is %s a Spade? %b\n" (toString c2) heart_check;

  print_endline "\n--- Testing List Operations ---";
  let hand = [c2; c3; newCard Value.T10 Color.Diamond] in
  print_endline "In the hand [2H, KS, 10D]:";
  let strongest = best hand in
  print_endline ("The best card is: " ^ toStringVerbose strongest);

  print_endline "\n--- Testing The Full Deck ---";
  let deck_size = List.length all in
  print_endline ("Total cards in deck: " ^ string_of_int deck_size);
  
  (* Print the first 5 cards of the deck as a sample *)
  print_endline "First 5 cards in the generated deck:";
  let rec print_sample count list =
    match count, list with
    | 0, _ | _, [] -> ()
    | n, h::t -> 
        print_endline (" - " ^ toString h); 
        print_sample (n-1) t
  in
  print_sample 5 all;

  print_endline "\nTests completed successfully!"