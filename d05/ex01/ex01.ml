module StringHashedType = struct
  type t = string
  
  let equal s1 s2 = (s1 = s2)
  
  let hash str =
    let iter func s =
      let len = String.length s in
      let rec inner i =
        if i < len then (
          func (String.get s i);
          inner (i + 1)
        )
      in
      inner 0
    in
    let h = ref 5381 in
    iter (fun c ->
      h := (!h * 33) + Char.code c
    ) str;
    (* abs !h *)
    !h land 0x3FFFFFFF
end

module StringHashtbl = Hashtbl.Make(StringHashedType)

let () =
  let ht = StringHashtbl.create 5 in
  let values = [ "Hello"; "world"; "42"; "Ocaml"; "H" ] in
  let pairs = List.map (fun s -> (s, String.length s)) values in
  List.iter (fun (k,v) -> StringHashtbl.add ht k v) pairs;
  StringHashtbl.iter (fun k v -> Printf.printf "k = \"%s\", v = %d\n" k v) ht