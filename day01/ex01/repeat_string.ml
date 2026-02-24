let rec repeat_string ?(str="x") n = 
        if n < 0 then
                "Error"
        else (
                if n == 0 then
                        ""
                else 
                        str ^ repeat_string ~str:(str) (n - 1)
                )


let _ = 
        print_endline(repeat_string ~str:("hello") 2);
        print_endline(repeat_string 10);
        print_endline(repeat_string ~str:("bye") 3);
        print_endline(repeat_string ~str:("yay") 0);
        print_endline(repeat_string ~str:("nay") (-1));
