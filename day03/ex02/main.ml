let () =
  print_endline "--- Testing Individual Cards ---";
  let c1 = Card.newCard Card.Value.As Card.Color.Spade in
  let c2 = Card.newCard Card.Value.T2 Card.Color.Heart in
  let c3 = Card.newCard Card.Value.King Card.Color.Spade in

  print_endline ("Card 1: " ^ Card.toStringVerbose c1);
  print_endline ("Card 2: " ^ Card.toString c2);
  
  print_endline "\n--- Testing Comparison ---";
  let winner = Card.max c1 c2 in
  print_endline ("Between Ace and 2, the winner is: " ^ Card.toString winner);

  print_endline "\n--- Testing Suit Filters ---";
  let spade_check = Card.isSpade c1 in
  let heart_check = Card.isSpade c2 in
  Printf.printf "Is %s a Spade? %b\n" (Card.toString c1) spade_check;
  Printf.printf "Is %s a Spade? %b\n" (Card.toString c2) heart_check;

  print_endline "\n--- Testing List Operations ---";
  let hand = [c2; c3; Card.newCard Card.Value.T10 Card.Color.Diamond] in
  print_endline "In the hand [2H, KS, 10D]:";
  let strongest = Card.best hand in
  print_endline ("The best card is: " ^ Card.toStringVerbose strongest);

  print_endline "\n--- Testing The Full Deck ---";
  let deck_size = List.length Card.all in
  print_endline ("Total cards in deck: " ^ string_of_int deck_size)
  