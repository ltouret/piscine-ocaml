let ft_print_rev str =
        let rec rev_rec str len =
                if (len) <= 0 then (
                ) else (
                        print_char (String.get (str) (len - 1));
                        rev_rec (str) (len - 1)
                )
        in
        rev_rec (str) (String.length(str));
        print_char '\n'

let _ =
        ft_print_rev "Hello!";
        ft_print_rev ""
