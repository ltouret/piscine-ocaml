let ft_string_all pred str =
        let rec get_char n str pred = 
                if n < String.length str then (
                        (pred (String.get (str) (n))) = true && get_char (n + 1) (str) (pred)
                ) else (
                        true
                )
        in
        get_char (0) (str) (pred)


let _ =
        let is_digit c = c >= '0' && c <= '9'
        in
        print_endline ("res: " ^ Bool.to_string (ft_string_all is_digit "0123456789"));
        print_endline ("res: " ^ Bool.to_string (ft_string_all is_digit "O12EAS67B9"));
