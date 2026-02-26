type phosphate = string
type deoxyribose = string
type nucleobase = A | T | C | G | None

type nucleotide = {
	phosphate : phosphate ;
	deoxyribose : deoxyribose ;
	nucleobase : nucleobase
}

let get_nucleobase base =
    match base with
    | 'A' -> print_char base; A
	| 'T' -> print_char base; T
	| 'C' -> print_char base; C
	| 'G' -> print_char base; G
	| _ -> None

let generate_nucleotide base = {
    phosphate = "phosphate";
    deoxyribose = "deoxyribose";
    nucleobase = (get_nucleobase base)
}

let nucleobase_to_str base =
    match base with
    | A -> "A";
	| T -> "T";
	| C -> "C";
	| G -> "G";
	| _ -> "None"

let print_nucleotide nucleo =
    print_endline ("phosphate = " ^ nucleo.phosphate);
    print_endline ("deoxyribose = " ^ nucleo.deoxyribose);
    print_endline ("nucleobase = " ^ (nucleobase_to_str nucleo.nucleobase));
    print_char '\n'

let () =
    print_nucleotide (generate_nucleotide 'A');
    print_nucleotide (generate_nucleotide 'T');
    print_nucleotide (generate_nucleotide 'C');
    print_nucleotide (generate_nucleotide 'G');
    print_nucleotide (generate_nucleotide 'Z');
