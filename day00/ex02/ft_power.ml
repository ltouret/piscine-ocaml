let rec ft_power i n =
        if n = 0 then
                1
        else
                i * ft_power (i) (n - 1)

let _ =
        print_endline (string_of_int (ft_power 3 3));
        print_endline (string_of_int (ft_power 2 8));
        print_endline (string_of_int (ft_power 3 1));
        print_endline (string_of_int (ft_power 0 5));
