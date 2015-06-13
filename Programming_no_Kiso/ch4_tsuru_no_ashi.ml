
(** 4.6 *)

(* TOOO *)
(* tsuru_no_ashi : int -> int *)
let tsuru_no_ashi n = n * 2
			
let test1 = tsuru_no_ashi 1 = 2
let test2 = tsuru_no_ashi 2 = 4
let test3 = tsuru_no_ashi 3 = 6

(* TODO *)
(* kame_no_ashi *)
let kame_no_ashi n = n * 4

(** 4.7 *)
(* TODO *)
(* tsurukame_no_ashi : int -> int -> int *)
let tsurukame_no_ashi t k = 
  (tsuru_no_ashi t) + (kame_no_ashi k)

let tk11 = tsurukame_no_ashi 1 1 = 6
let tk12 = tsurukame_no_ashi 1 2 = 10
let tk21 = tsurukame_no_ashi 2 1 = 8

(** 4.8 *)
(* 鶴亀算 *)
(* tsurukame : int -> int -> int * int *)
let tsurukame head_sum leg_sum = 
  let rec tsurukame' t head_sum leg_sum = 
    if (tsuru_no_ashi t + kame_no_ashi (head_sum - t)) = leg_sum 
    then t
    else tsurukame' (t-1) head_sum leg_sum in
  tsurukame' head_sum head_sum leg_sum    
		    
let tks2_6 =  tsurukame 2 6  = 1
let tks3_10 = tsurukame 3 10 = 1
let tks3_8 =  tsurukame 3 8  = 2
