let rec ft_countdown i =
        if i > 0 then (
                print_int i;
                print_char '\n';
                ft_countdown(i - 1)
        )
        else (
                print_int 0;
                print_char '\n';
        )

let _ =
        ft_countdown (3);
        ft_countdown (-5);
        ft_countdown (0)
