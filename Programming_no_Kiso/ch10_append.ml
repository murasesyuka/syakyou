(* purpose : *)
(* append : 'a list -> 'a list -> 'a list *)
let rec append lst1 lst2 = match lst1 with
    [] -> lst2
  | x::xs -> x :: append xs lst2

(* test *)
let test1 = append [] [] = []
let test2 = append [] [1;2] = [1;2]
let test3 = append [1;2] [] = [1;2]
let test4 = append [1;2] [3;4] = [1;2;3;4]
let test5 = append ["a";"b";"c"] ["d";"e"] = ["a";"b";"c";"d";"e"]

(* purpose : *)
(* merge : 'a list -> 'a list -> 'a list *)
let rec merge lst1 lst2 = match (lst1,lst2) with
    ([], []) -> []
  | (_, []) -> lst1
  | ([], _) -> lst2
  | (x::xs, y::ys) -> 
     if x<y 
     then x :: merge xs lst2
     else y :: merge lst1 ys

(* test *)
let test6 = merge [] [] = []
let test7 = merge [] [1;2] = [1;2]
let test8 = merge [1;2] [] = [1;2]
let test9 = merge [1;3] [2;4] = [1;2;3;4]
let test0 = merge [1;4] [2;3] = [1;2;3;4]
let test01 = merge [1;4] [1;3] = [1;1;3;4]
