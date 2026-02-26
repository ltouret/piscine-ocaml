let bad_jokes = [|
  "Why do OCaml programmers prefer the woods? Because they love tree recursion.";
  "What do you call a fake noodle? An Impasta.";
  "Why did the scarecrow win an award? Because he was outstanding in his field.";
  "Why don't skeletons fight each other? They don't have the guts.";
  "I'm reading a book on anti-gravity. It's impossible to put down."
|]

let () =
  Random.self_init ();
  Array.shuffle ~rand:Random.int bad_jokes;
  print_endline (bad_jokes.(0))
