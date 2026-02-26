type 'a ft_ref = { mutable contents: 'a }

let return value = { contents = value }

let get ft_ref = ft_ref.contents

let set ft_ref value = ft_ref.contents <- value

let bind ft_ref func : 'b ft_ref = func (get ft_ref)

let () =
  let r = return 666 in
  print_endline ("Initial value: " ^ (string_of_int (get r)));
  set r 21;
  print_endline ("After set: " ^ (string_of_int (get r)));
  let r2 = bind r (fun x -> return (x * 2)) in
  print_endline ("After bind: " ^ (string_of_int (get r2)))
