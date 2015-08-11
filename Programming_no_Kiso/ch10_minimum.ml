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


let test5 = gakusei_max [{namae = "foo"; tensuu = 80; seiseki = ""};
			 {namae = "bar"; tensuu = 70; seiseki = ""};
			 {namae = "baz"; tensuu = 60; seiseki = ""};
			 {namae = "hoo"; tensuu = 50; seiseki = ""}] = {namae = "foo"; tensuu = 80; seiseki = ""}
let test6 = gakusei_max [{namae = "foo"; tensuu = 80; seiseki = ""};
			 {namae = "bar"; tensuu = 70; seiseki = ""};
			 {namae = "baz"; tensuu = 60; seiseki = ""};
			 {namae = "hoo"; tensuu = 90; seiseki = ""}] = {namae = "hoo"; tensuu = 90; seiseki = ""}

									 
