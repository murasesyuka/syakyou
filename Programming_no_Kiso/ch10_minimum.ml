(* purpose : min *)
(* minimum : int list -> int *)
let rec minimum lst = match lst with
    [] -> Int.max_value
  | x::xs -> 
     let min_rest = minimum xs in 
     if x < min_rest
     then x
     else min_rest

(* test *)
let test1 = minimum [3] = 3
let test2 = minimum [1;2] = 1
let test3 = minimum [3;2] = 2
let test4 = minimum [3;2;6;4;1;8] = 1


(* datatype : 学生一人の成績データ *)
type gakusei_t = {
    namae : string;
    tensuu : int;
    seiseki : string;
  }

(* purpose : gakusei max *)
(* gakusei_max : gakusei_t list -> gakusei_t *)
let rec gakusei_max lst = match lst with
    [] -> {namae = ""; tensuu = 0; seiseki=""}
  | x::xs -> let rest = gakusei_max xs in
     if x.tensuu > rest.tensuu
     then x
     else rest

(* test *)
let test5 = gakusei_max [{namae = "foo"; tensuu = 80; seiseki = ""};
			 {namae = "bar"; tensuu = 70; seiseki = ""};
			 {namae = "baz"; tensuu = 60; seiseki = ""};
			 {namae = "hoo"; tensuu = 50; seiseki = ""}] = {namae = "foo"; tensuu = 80; seiseki = ""}
let test6 = gakusei_max [{namae = "foo"; tensuu = 80; seiseki = ""};
			 {namae = "bar"; tensuu = 70; seiseki = ""};
			 {namae = "baz"; tensuu = 60; seiseki = ""};
			 {namae = "hoo"; tensuu = 90; seiseki = ""}] = {namae = "hoo"; tensuu = 90; seiseki = ""}

									 
(* purpose :  *)
(* shukei : gakusei_t list -> int * int * int * int *)
let rec shukei lst = match lst with
    [] -> (0, 0, 0, 0)
  | {namae = n; tensuu = t; seiseki=s} :: rest ->
     let (a,b,c,d) = shukei rest in
     if s = "A"      then (a+1, b, c, d)
     else if s = "B" then (a, b+1, c, d)
     else if s = "C" then (a, b, c+1, d)
     else (a, b, c, d+1)

(* test *)
let test7 = shukei [{namae = "foo"; tensuu = 80; seiseki = "A"};
		    {namae = "bar"; tensuu = 70; seiseki = "B"};
		    {namae = "baz"; tensuu = 60; seiseki = "C"};
		    {namae = "hoo"; tensuu = 50; seiseki = "D"}] = (1,1,1,1)
