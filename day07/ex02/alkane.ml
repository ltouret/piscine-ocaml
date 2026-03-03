  (* TODO *)
    (* val name: string;
    val formula: string;
    method to_string : string = name ^ " (" ^ self#formula ^ ")"
    method equals (other : alkane) : bool = self#formula = other#formula *)

class alkane (n : int) =
  let name_str =
    match n with
    | 1 -> "Methane" | 2 -> "Ethane" | 3 -> "Propane"
    | 4 -> "Butane"  | 5 -> "Pentane" | 6 -> "Hexane"
    | 7 -> "Heptane" | 8 -> "Octane"  | 9 -> "Nonane"
    | 10 -> "Decane" | 11 -> "Undecane" | 12 -> "Dodecane"
    | _ -> "Unknown Alkane" 
  in
  let atoms_list =
    let carbons = List.init n (fun _ -> (new Atom.carbon :> Atom.atom)) in
    let hydrogens = List.init (2 * n + 2) (fun _ -> (new Atom.hydrogen :> Atom.atom)) in
    carbons @ hydrogens
  in
  object
    inherit Molecule.molecule name_str atoms_list as super
end

class methane =
object
  inherit alkane 1
end

class ethane =
object
  inherit alkane 2
end

class propane =
object
  inherit alkane 3
end

class butane =
object
  inherit alkane 4
end

class pentane =
object
  inherit alkane 5
end

class hexane =
object
  inherit alkane 6
end

class heptane =
object
  inherit alkane 7
end

class octane =
object
  inherit alkane 8
end

class nonane =
object
  inherit alkane 9
end

class decane =
object
  inherit alkane 10
end

class undecane =
object
  inherit alkane 11
end

class dodecane =
object
  inherit alkane 12
end
