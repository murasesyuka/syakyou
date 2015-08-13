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


