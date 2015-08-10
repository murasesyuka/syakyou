(* purpose : insert to list *)
(* insert : int list -> int -> int list *)
let rec insert lst n = match lst with
    [] -> [n]
  | x::xs -> if x < n
	     then x :: insert xs n
	     else n :: lst


(* purpose : insert sort *)
(* insert : int list -> int -> int list *)
let rec ins_sort lst = match lst with
    [] -> []
  | x::xs -> insert (ins_sort xs) x
	     

(* test *)
let test1 = insert [] 1 = [1]
let test2 = insert [1; 5] 3 = [1; 3; 5]

let test3 = ins_sort [2;1] = [1;2]
let test4 = ins_sort [3;2;1] = [1;2;3]
let test5 = ins_sort [5;3;8;1;7;4] = [1;3;4;5;7;8]










