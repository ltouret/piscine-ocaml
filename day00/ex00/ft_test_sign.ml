let ft_test_sign i =
        if i >= 0 then
                print_endline "positive"
        else
                print_endline "negative"

let _ =
        print_string "Test with [42]: ";
        ft_test_sign (42);
        print_string "Test with [0]: ";
        ft_test_sign (0);
        print_string "Test with [-42]: ";
        ft_test_sign (-42)
