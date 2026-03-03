class dioxygen =
  object
    inherit Molecule.molecule "Dioxygen"
        [(new Atom.oxygen :> Atom.atom); (new Atom.oxygen :> Atom.atom)]
  end

class alkane_combustion (alkanes : Alkane.alkane list) =
  let () =
    if alkanes = [] then failwith "alkane_combustion: empty alkane list"
  in
  let unique =
    let rec dedup seen = function
      | [] -> []
      | (a : Alkane.alkane) :: rest ->
          if List.mem a#formula seen then dedup seen rest
          else a :: dedup (a#formula :: seen) rest
    in
    dedup [] alkanes
  in
  let rec gcd a b = if b = 0 then a else gcd b (a mod b) in
  (* CnH(2n+2): 2 CnH(2n+2) + (3n+1) O2 -> 2n CO2 + 2(n+1) H2O *)
  let coeff_of alk =
    let n = alk#carbon_count in
    let a = 2 and o2 = 3 * n + 1 and co2 = 2 * n and h2o = 2 * (n + 1) in
    let g = gcd (gcd a o2) (gcd co2 h2o) in
    (a / g, o2 / g, co2 / g, h2o / g)
  in
  let data = List.map (fun a -> (a, coeff_of a)) unique in
  let bal_start =
    List.map (fun (a, (ca,_,_,_)) -> ((a :> Molecule.molecule), ca)) data
    @ [((new dioxygen :> Molecule.molecule),
        List.fold_left (fun s (_,(_,co,_,_)) -> s + co) 0 data)]
  in
  let bal_result =
    [((new Molecule.carbon_dioxide :> Molecule.molecule),
      List.fold_left (fun s (_,(_,_,cc,_)) -> s + cc) 0 data);
     ((new Molecule.water :> Molecule.molecule),
      List.fold_left (fun s (_,(_,_,_,ch)) -> s + ch) 0 data)]
  in
  object (self)
    inherit Reaction.reaction
        (new dioxygen :> Molecule.molecule) (new Molecule.water :> Molecule.molecule)

    (* private *)
    val _start = bal_start
    val _result = bal_result
    val _balanced = false

    (* public *)
    method get_start =
      if not _balanced then failwith "reaction is not balanced" else _start
    method get_result =
      if not _balanced then failwith "reaction is not balanced" else _result
    method is_balanced = _balanced
    method balance : Reaction.reaction =
      ({< _balanced = true >} :> Reaction.reaction)
  end