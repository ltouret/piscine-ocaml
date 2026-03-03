module type App = sig
  type project = string * string * int
  val zero : project
  val combine : project -> project -> project
  val fail : project -> project
  val success : project -> project
end

module App : App = struct
  type project = string * string * int
  let zero: project = ("", "", 0)

  let combine (a1, _, c1) (a2, _, c2) =
    let avg = ((c1 + c2) / 2) in
    let status = if avg >= 80 then "succeed" else "failed" in
    (a1 ^ a2, status, avg)

  let fail (a, _, _): project =
      (a, "fail", 0)

  let success (a, _, _): project =
      (a, "succeed", 80)
end