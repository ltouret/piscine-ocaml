let () =
    print_endline ("toInt T2: " ^ string_of_int (Value.toInt T2));
    print_endline ("toInt As: " ^ string_of_int (Value.toInt As));

    print_endline ("toString T2: " ^ Value.toString T2);
    print_endline ("toString As: " ^ Value.toString As);

    print_endline ("toStringVerbose T2: " ^ Value.toStringVerbose T2);
    print_endline ("toStringVerbose As: " ^ Value.toStringVerbose As);

    print_endline ("next T2: " ^ Value.toString (Value.next T2));
    (try print_endline ("next As: " ^ Value.toString (Value.next As)) with Invalid_argument _ -> print_endline "next As: Invalid_argument");

    print_endline ("previous T3: " ^ Value.toString (Value.previous T3));
    (try print_endline ("previous T2: " ^ Value.toString (Value.previous T2)) with Invalid_argument _ -> print_endline "previous T2: Invalid_argument");
    print_endline ("previous As: " ^ Value.toString (Value.previous As))