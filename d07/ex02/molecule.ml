class virtual molecule (name : string) (atom_list : Atom.atom list) =
  object (self)
    method name: string = name
  
    method formula : string =
      (* count diff elems in assoc list *)
      let count_atoms =
        List.fold_left
          (fun acc atom ->
            let symbol = atom#symbol in
            let current_count =
              try List.assoc symbol acc with Not_found -> 0
            in
            (symbol, current_count + 1) :: List.remove_assoc symbol acc)
          [] atom_list
      in
      (* do hill notation of count_atoms *)
      let hill_sorted =
        let c_atom =
          try [ ("C", List.assoc "C" count_atoms) ] with Not_found -> []
        in
        let h_atom =
          try [ ("H", List.assoc "H" count_atoms) ] with Not_found -> []
        in
        let others =
          List.filter (fun (s, _) -> s <> "C" && s <> "H") count_atoms
        in
        let sort_others =
          List.sort (fun (s1, _) (s2, _) -> compare s1 s2) others
        in
        c_atom @ h_atom @ sort_others
      in
      (* last formatting if more than 1 atom *)
      let string_list =
        List.map
          (fun (sym, count) ->
            if count = 1 then sym else sym ^ string_of_int count)
          hill_sorted
      in
      String.concat "" string_list

    method to_string : string = name ^ " (" ^ self#formula ^ ")"
    method equals (other : molecule) : bool = self#formula = other#formula
  end

class water =
  object
    inherit
      molecule "Water" [ new Atom.hydrogen; new Atom.hydrogen; new Atom.oxygen ]
  end

class carbon_dioxide =
  object
    inherit
      molecule
        "Carbon dioxide"
        [ new Atom.carbon; new Atom.oxygen; new Atom.oxygen ]
  end

class methane =
  object
    inherit
      molecule
        "Methane"
        [
          new Atom.carbon;
          new Atom.hydrogen;
          new Atom.hydrogen;
          new Atom.hydrogen;
          new Atom.hydrogen;
        ]
  end

class sulfuric_acid =
  object
    inherit
      molecule
        "Sulfuric acid"
        [
          new Atom.hydrogen;
          new Atom.hydrogen;
          new Atom.sulfur;
          new Atom.oxygen;
          new Atom.oxygen;
          new Atom.oxygen;
          new Atom.oxygen;
        ]
  end

class ammonia =
  object
    inherit
      molecule
        "Ammonia"
        [
          new Atom.nitrogen;
          new Atom.hydrogen;
          new Atom.hydrogen;
          new Atom.hydrogen;
        ]
  end
