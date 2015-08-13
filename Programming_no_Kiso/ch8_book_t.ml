type book_t = {
    title : string;
    author: string;
    publisher : string;
    price : int;
    isbn  : int;
  }

let book1 = {title = "foo"; author = "i"; publisher = "you"; price = 42; isbn = 1234567890 }
let book2 = {title = "bar"; author = "my"; publisher = "your"; price = 72; isbn = 1234567890 }
let book3 = {title = "baz"; author = "me"; publisher = "you"; price = 108; isbn = 1234567890 }


type okozukai_t = {
    name : string;
    price : int;
    shop : string;
    date  : string;
  }

let kozukai1 = { name = "hoge"; price = 42; shop = "kyouto"; date = "2015-07-10" }
let kozukai2 = { name = "homu"; price = 72; shop = "oosaka"; date = "2015-07-11" }
let kozukai3 = { name = "fuga"; price = 21; shop = "hyougo"; date = "2015-07-12" }		 

type date_t = {
    month : int;
    day : int;
  }

type blood_t = A |  B |  O | AB

type person_t = {
    height : int;
    weight : int;
    date : date_t;
    blood_type : blood_t;
  }

let person1 = { height = 170; weight = 70;  date = {month = 7; day = 10}; blood_type = A }
let person2 = { height = 190; weight = 100; date = {month = 8; day = 12}; blood_type = O }
let person3 = { height = 150; weight = 40;  date = {month = 1; day = 10}; blood_type = AB }
		
	      
(* purpose : todo *)
(* todo : *)

(* test *)




