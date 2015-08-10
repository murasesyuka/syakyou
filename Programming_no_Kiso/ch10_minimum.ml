(* purpose : min *)
(* minimum : int list -> int *)
let rec minimum lst = match lst with
    [] -> max_int
  | x::xs -> 
     if x < minimum xs
     then x
     else minimum xs
				     
(* test *)
let test1 = minimum [3] = 3
let test2 = minimum [1;2] = 1
let test3 = minimum [3;2] = 2
let test4 = minimum [3;2;6;4;1;8] = 1


