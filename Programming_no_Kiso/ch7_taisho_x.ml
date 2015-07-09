(* purpose : taisho_x *)
(* taisho_x : int * int -> int *)
let taisho_x point = match point with
    (x, y) -> (-x, y)

(* test *)
let test1 = taisho_x (0, 0) = (0, 0)
let test2 = taisho_x (4, 2) = (-4, 2)
let test3 = taisho_x (4, -2) = (-4, -2)
