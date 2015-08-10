(* purpose : add to each *)
(* add_to_each : int -> int list list -> int list list *)
let rec add_to_each n lst = match lst with
    [] -> []
  | x::xs -> (n :: x) :: add_to_each n xs

let rec prefix lst = match lst with
    [] -> []
  | x::xs -> []
				     
(* test *)
let test1 = add_to_each 1 [] = []
let test2 = add_to_each 1 [[2]] = [[1;2]]
let test3 = add_to_each 1 [[2];[2;3]] = [[1;2];[1;2;3]]
let test3 = add_to_each 1 [[2];[2;3];[2;3;4]] = [[1;2];[1;2;3];[1;2;3;4]]

let test5 = prefix [] = []
let test6 = prefix [1] = [[1]]
let test7 = prefix [1;2] = [[1];[1;2]]
let test8 = prefix [1;2;3;4] = [[1];[1;2];[1;2;3];[1;2;3;4]]

