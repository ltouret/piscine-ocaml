let ft_print_comb () =
        let rec uni_rec uni dec cen =
                if uni > 9 then ()
                else (
                        print_int (cen);
                        print_int (dec);
                        print_int (uni);
                        if cen = 7 && dec = 8 && uni = 9 then (
                                print_string ("\n");
                        )
                        else (
                                print_string (", ");
                        );
                        uni_rec (uni + 1) (dec) (cen)
                )
        in
        let rec dec_rec uni dec cen =
                if dec > 8 then ()
                else (
                        uni_rec (uni) (dec) (cen);
                        dec_rec (uni + 1) (dec + 1) (cen);
                )
        in
        let rec cen_rec cen =
                if cen > 7 then ()
                else (
                        dec_rec (cen + 2) (cen + 1) (cen);
                        cen_rec (cen + 1);
                )
        in
        cen_rec 0


let _ =
       ft_print_comb () 
