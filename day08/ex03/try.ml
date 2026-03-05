module Try = struct
  type 'a t = 
    | Success of 'a
    | Failure of exn

  let return v = Success v

  let bind m f =
    match m with
    | Success v -> 
        (try f v
         with e -> Failure e)
    | Failure e ->
      Failure e

  let recover m f =
    match m with
    | Success v ->
      Success v
    | Failure e ->
      f e

  let filter m pred =
    match m with
    | Success v -> 
        if pred v then
          Success v 
        else
          Failure (Failure "Monad m doesn't satisfy predicate pred")
    | Failure e -> 
      Failure e

  let flatten m =
    match m with
    | Success (Success v) ->
      Success v
    | Success (Failure e) ->
      Failure e
    | Failure e ->
      Failure e
end