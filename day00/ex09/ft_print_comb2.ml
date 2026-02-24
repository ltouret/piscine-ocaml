let ft_print_comb2 () =
        let rec sec_int n1 n2 =
                if (n2 < 100) then (
                        if (n1 < 10) then print_int 0;
                        print_int n1;
                        print_char ' ';
                        if (n2 < 10) then print_int 0;
                        print_int n2;
                        if (n1 = 98 && n2 = 99) then (
                                print_char('\n')
                        ) else (
                                print_char ',';
                                print_char ' '
                        );
                        sec_int (n1) (n2 + 1)
                ) else (
                );
        in
        let rec first_int n1 n2 =
                if (n2 < 100) then (
                        sec_int (n1) (n2 + 1);
                        first_int (n1 + 1) (n2 + 1)
                ) else (
                );
        in
        first_int 0 0

let _ = 
        ft_print_comb2()
