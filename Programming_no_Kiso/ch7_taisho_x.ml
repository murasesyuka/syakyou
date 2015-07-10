(* purpose : taisho_x *)
(* taisho_x : int * int -> int *)
let taisho_x point = match point with
    (x, y) -> (-x, y)

(* test *)
let test1 = taisho_x (0, 0) = (0, 0)
let test2 = taisho_x (4, 2) = (-4, 2)
let test3 = taisho_x (4, -2) = (-4, -2)


(* purpose : chuten *)
(* chuten : int * int -> int * int -> int *)
let chuten start_p end_p  = 
  match start_p with
    (x1, y1) -> 
    match end_p with
      (x2, y2) -> ((x1+x2)/2, (y1+y2)/2)

(* test *)
let test1 = chuten (0, 0) (0, 0)  = (0, 0)
let test2 = chuten (4, 2) (2, 4)  = (3, 3)
let test3 = chuten (4, -2) (-4, 2)= (0, 0)
