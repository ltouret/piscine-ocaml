let fibonacci n =
    if n < 0 then
        -1
    else (
        let rec aux n curr next =
            if n = 0 then
                curr
            else 
                aux (n - 1) (next) (curr + next)
        in
        aux n 0 1
    )


let _ =
        print_int(fibonacci (-1));
        print_char '\n';
        print_int(fibonacci 0);
        print_char '\n';
        print_int(fibonacci 1);
        print_char '\n';
        print_int(fibonacci 2);
        print_char '\n';
        print_int(fibonacci 3);
        print_char '\n';
        print_int(fibonacci 4);
        print_char '\n';
        print_int(fibonacci 5);
        print_char '\n';
        print_int(fibonacci 6);
        print_char '\n';
        print_int(fibonacci 11);
