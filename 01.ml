let rec ft_power i n =
        if n = 0 then
                1
        else
                i * ft_power (i) (n - 1)

let _ =
        print_endline (string_of_int (ft_power 3 3));
