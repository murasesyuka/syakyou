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

(* exercise 10.7 *)
type date_t = {
    month : int;
    day : int;
  }

type blood_t = A |  B |  O | AB | Non

type person_t = {
    height : int;
    weight : int;
    date : date_t;
    blood_type : blood_t;
  }


(* purpose :  *)
(* ketsueki_shukei : person_t list -> int * int * int * int *)
let rec ketsueki_shukei lst = match lst with
    [] -> (0,0,0,0)
  | { height = h; weight = w; date = d; blood_type = blood } :: rest -> 
     let (a,b,c,d) = ketsueki_shukei rest in
     if blood = A      then (a+1, b, c, d)
     else if blood = B then (a, b+1, c, d)
     else if blood = O then (a, b, c+1, d)
     else (a, b, c, d+1)


(* test *)
let test8 = ketsueki_shukei [{ height = 170; weight = 70;  date = {month = 7; day = 10}; blood_type = A };
			     { height = 190; weight = 100; date = {month = 8; day = 12}; blood_type = O };
			     { height = 150; weight = 40;  date = {month = 1; day = 10}; blood_type = AB }] = (1,0,1,1)

let test8 = ketsueki_shukei [{ height = 170; weight = 70;  date = {month = 7; day = 10}; blood_type = A };
			     { height = 190; weight = 100; date = {month = 8; day = 12}; blood_type = B };
			     { height = 190; weight = 100; date = {month = 8; day = 12}; blood_type = O };
			     { height = 150; weight = 40;  date = {month = 1; day = 10}; blood_type = B }] = (1,2,1,0)


(* exercise 10.8 *)
(* purpose :  *)
(* saita_ketsueki : person_t list -> blood_t *)
let rec saita_ketsueki lst = 
  let (a,b,o,ab) = ketsueki_shukei lst in
  if a>b && a>o && a>ab then A
  else if b>a && b>o && b>ab then B
  else if o>a && o>b && o>ab then O
  else if ab>a && ab>b && ab>o then AB
  else Non
				   
(* test *)
let test9 = saita_ketsueki [{ height = 170; weight = 70;  date = {month = 7; day = 10}; blood_type = A };
			    { height = 190; weight = 100; date = {month = 8; day = 12}; blood_type = B };
			    { height = 190; weight = 100; date = {month = 8; day = 12}; blood_type = O };
			    { height = 150; weight = 40;  date = {month = 1; day = 10}; blood_type = B }] = B
let test10 = saita_ketsueki [{ height = 170; weight = 70;  date = {month = 7; day = 10}; blood_type = A };
			     { height = 190; weight = 100; date = {month = 8; day = 12}; blood_type = B };
			     { height = 190; weight = 100; date = {month = 8; day = 12}; blood_type = O };
			     { height = 150; weight = 40;  date = {month = 1; day = 10}; blood_type = A }] = A

