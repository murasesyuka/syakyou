(* TODO *)
(* seiseki : string * int -> string *)
let seiseki (name, score) =
  if score > 90 then name ^ "優"
  else if score > 75 then name ^ "良"
  else if score > 60 then name ^ "可"
  else name ^ "不可"

  
(* test *)
let test1 = seiseki ("foo",91) = "foo優"
let test2 = seiseki ("bar",76) = "bar良"
let test3 = seiseki ("baz",61) = "baz可"
let test4 = seiseki ("hoge",60) = "hoge不可"
				   
(* purpose : add *)
(* add : int * int -> int *)
let add pair = 0

(* test *)
let test_add1 = add (0, 0) = 0
let test_add2 = add (3, 5) = 8
let test_add3 = add (3, -5) = -2

