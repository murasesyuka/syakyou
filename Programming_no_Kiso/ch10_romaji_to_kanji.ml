(* purpose :  *)
(* romaji_to_kanji : string -> elimei_t list -> string *)
let rec romaji_to_kanji romaji lst = match lst with
    [] -> ""
  | {kanji=kanj; kana=kana; romaji=roma; shozoku=shoz}::rest -> 
     if roma = romaji
     then kanj
     else romaji_to_kanji romaji rest

(* test *)
let test0 = romaji_to_kanji "hoge" global_ekimei_list = ""
let test1 = romaji_to_kanji "yoyogiuehara" global_ekimei_list = "代々木上原"
let test2 = romaji_to_kanji "yotsuya" global_ekimei_list = "四ツ谷"

(* purpose :  *)
(* get_ekikan_kyori : string -> string -> elimei_t list -> float *)
let rec get_ekikan_kyori eki1 eki2 lst = match lst with
    [] -> 0.0
  | {kiten=kiten; shuten=shuten; keiyu=keiyu; kyori=kyori; jikan=j}::rest -> 
     if kiten = eki1
     then if shuten = eki2 then kyori
	  else 0.0
     else get_ekikan_kyori eki1 eki2 rest

let test3 = get_ekikan_kyori "代々木上原" "代々木公園" global_ekikan_list = 1.0


