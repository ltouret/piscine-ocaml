let ft_rot_n n str =
        let add_n ch =
                if ((ch >= 'a' && ch <= 'z')) then (
                        if ((char_of_int ((int_of_char (ch)) + n)) > 'z') then
                                char_of_int ((int_of_char ('a')) + (n - (int_of_char ('z') - int_of_char (ch)) - 1))
                        else
                                char_of_int ((int_of_char (ch)) + n)
                )
                else if ((ch >= 'A' && ch <= 'Z')) then (
                        if ((char_of_int ((int_of_char (ch)) + n)) > 'Z') then
                                char_of_int ((int_of_char ('A')) + (n - (int_of_char ('Z') - int_of_char (ch)) - 1))
                        else
                                char_of_int ((int_of_char (ch)) + n)
                )
                else
                        ch
        in
        String.map (add_n) (str)

let _ =
        print_endline (ft_rot_n (1) ("abcdefghijklmnopqrstuvwxyz"));
        print_endline (ft_rot_n (2) ("abcdefghijklmnopqrstuvwxyz"));
        print_endline (ft_rot_n (3) ("abcdefghijklmnopqrstuvwxyz"));
        print_endline (ft_rot_n (13) ("abcdefghijklmnopqrstuvwxyz"));
        print_endline (ft_rot_n (1) ("XYZ"));
        print_endline (ft_rot_n (2) ("XYZ"));
        print_endline (ft_rot_n (3) ("XYZ"));
        print_endline (ft_rot_n (1) ("G3kk hr???"));
        print_endline (ft_rot_n (0) ("Damned!!"))
