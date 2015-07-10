(* datatype : 学生一人の成績データ *)
type gakusei_t = { 
    namae : string;
    tensuu : int;
    seiseki : string;
  }

(* purpose : 点数を受け取り、評価を付与して返す *)
(* todo : gakusei_t -> gakusei_t *)
let hyouka gakusei = match gakusei with
    {namae = n; tensuu = t; seiseki = s} -> 
    if t >= 80 then       {namae = n; tensuu = t; seiseki = "A"}
    else if t >= 70 then  {namae = n; tensuu = t; seiseki = "B"}
    else if t >= 60 then  {namae = n; tensuu = t; seiseki = "C"}
    else                  {namae = n; tensuu = t; seiseki = "D"}

(* test *)
let test1 = hyouka {namae = "foo"; tensuu = 80; seiseki = ""} = {namae = "foo"; tensuu = 80; seiseki = "A"}
let test1 = hyouka {namae = "bar"; tensuu = 70; seiseki = ""} = {namae = "bar"; tensuu = 70; seiseki = "B"}
let test1 = hyouka {namae = "baz"; tensuu = 60; seiseki = ""} = {namae = "baz"; tensuu = 60; seiseki = "C"}
let test1 = hyouka {namae = "hoo"; tensuu = 50; seiseki = ""} = {namae = "hoo"; tensuu = 50; seiseki = "D"}
								  
								  

