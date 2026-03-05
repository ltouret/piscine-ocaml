let () =
  let open Watchtower in
  let test label actual expected =
    Printf.printf "[%s] = %d -> %s\n" 
      label actual (if actual = expected then "Pass" else "Fail") 
  in
  test "12 + 5" (Watchtower.add 12 5) 5;
  test "5 + 12" (Watchtower.add 5 12) 5;
  test "11 + 2" (Watchtower.add 11 2) 1;
  test "3 - 5" (Watchtower.sub 3 5) 10;
  test "12 + 15" (Watchtower.add 12 15) 3;
  test "12 - 12" (Watchtower.sub 12 12) 12