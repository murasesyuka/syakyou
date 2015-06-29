(* TODO 5.2 *)
(* jikan : int -> string *)
let jikan time =
  if time < 12 then "午前" else "午後"

(* test *)
let test0 = jikan 0 = "午前"
let test11 = jikan 11 = "午前"
let test12 = jikan 12 = "午後"



(* TODO 5.3 *)
(* seiza : int -> int -> string *)

(* test *)


(* TODO 5.4 *)
(* hanbetsuhiki : int -> int -> int -> int *)
let hanbetsuhiki a b c = b*b - 4 * a * c
(* test *)
let test_h121 = hanbetsuhiki 1 2 1  = 0



(* TODO 5.5 *)
(* kai_no_kosuu : int -> int -> int -> int *)
let kai_no_kosuu a b c = 
  let ret = (hanbetsuhiki a b c) in
  if ret = 0 then 1 else 
    if ret < 0 
    then 0
    else 2


(* test *)
let test_k121 = kai_no_kosuu 1 2 1 = 1

(* TODO 5.6 *)
(* kyosuukai : int -> int -> int -> bool *)
let kyosuukai a b c = 
  if hanbetsuhiki a b c < 0 then true else false

(* test *)
let test_kyo121 = kyosuukai 1 2 1 = false
let test_kyo122 = kyosuukai 1 2 2 = true

			  

