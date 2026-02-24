let ft_print_alphabet () =
        let rec alpha_rec ch =
                print_char (char_of_int(ch));
                if ch = 122 then (
                ) else (
                        alpha_rec (ch + 1)
                )
        in
        alpha_rec (int_of_char('a'));
        print_char '\n'

let _ =
        ft_print_alphabet ()
