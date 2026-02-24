let ft_is_palindrome str =
        let rec pali_rec str i ri =
                if  1 < ri - i then (
                        (String.get (str) (i)) = (String.get (str) (ri))
                        && pali_rec (str) (i + 1) (ri - 1)
                ) else (
                        true
                )
        in
        pali_rec (str) (0) ((String.length str) - 1)

let _ =
        print_endline (Bool.to_string(ft_is_palindrome "deadea"));
        print_endline (Bool.to_string(ft_is_palindrome "radar"));
        print_endline (Bool.to_string(ft_is_palindrome "madam"));
        print_endline (Bool.to_string(ft_is_palindrome ""));
