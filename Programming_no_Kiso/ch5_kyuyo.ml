(* 優遇時給30時間以上の人 *)
let yugu_jikyu = 980

let jikyu = 950

let kihonkyu = 100

(* TODO *)
(* kyuyo : int -> int *)
let kyuyo x =
  if x < 30
  then kihonkyu + jikyu * x
  else kihonkyu + yugu_jikyu * x

(* test *)
let test1 = kyuyo 25 = 23850
let test2 = kyuyo 28 = 26700
let test3 = kyuyo 31 = 30480
			 


  
  


  


		
