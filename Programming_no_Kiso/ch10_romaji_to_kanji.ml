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
    [] -> Float.infinity
  | {kiten=kiten; shuten=shuten; keiyu=keiyu; kyori=kyori; jikan=j}::rest -> 
     if kiten = eki1 
     then if shuten = eki2 
	  then kyori
	  else Float.infinity
     else if kiten = eki2 
     then if shuten = eki1 
	  then kyori
	  else Float.infinity
     else get_ekikan_kyori eki1 eki2 rest

let test3 = get_ekikan_kyori "代々木上原" "代々木公園" global_ekikan_list = 1.0
let test4 = get_ekikan_kyori "代々木上原" "明治神宮前" global_ekikan_list = Float.infinity
let test5 = get_ekikan_kyori "営団成増" "和光市" global_ekikan_list = 2.1
									      
(* purpose :  *)
(* kyori_wo_hyouji : string -> string -> string *)
let kyori_wo_hyouji eki1_romaji eki2_romaji = 
  let eki1 = romaji_to_kanji eki1_romaji global_ekimei_list in
  let eki2 = romaji_to_kanji eki2_romaji global_ekimei_list in
  if eki1 = ""
  then Printf.sprintf "%s駅は存在しません" eki1_romaji
  else if eki2 = ""
  then Printf.sprintf "%s駅は存在しません" eki2_romaji
  else let kyori = get_ekikan_kyori eki1 eki2 global_ekikan_list in
       if kyori = Float.infinity
       then Printf.sprintf "%s駅と%s駅は繋がっていません" eki1 eki2
       else Printf.sprintf "%s駅から%s駅までは%2.1fkmです" eki1 eki2 kyori

let test6 = kyori_wo_hyouji "foo" "yoyogiuehara" = "foo駅は存在しません"
let test7 = kyori_wo_hyouji "yoyogiuehara" "bar"  = "bar駅は存在しません"
let test8 = kyori_wo_hyouji "eidannarimasu" "wakousi" = "営団成増駅から和光市駅までは2.1kmです"
let test9 = kyori_wo_hyouji "eidanakakuka" "wakousi" = "営団赤塚駅と和光市駅は繋がっていません"
