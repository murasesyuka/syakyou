#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

//patscc -DATS_MEMALLOC_LIBC ch4_detatype.dats

datatype intopt =
  | intopt_none of () 
  | intopt_some of (int)

val x = intopt_none()
val y = intopt_some(42)

(* val _ = $showtype x *)
(* val _ = $showtype y *)

fun foo (i: intopt): int = 
  case+ i of
  | intopt_some(x) => x
  | intopt_none => 0

  (* 
Enumrative datatype 
*)  
datatype wday =
  | Monday of ()
  | Tuesday of ()
  | Wednesday of ()
  | Thursday of ()
  | Friday of ()
  | Saturday of ()
  | Sunday of ()
// end of [wday]

fun isWeekday (x: wday) : bool =
  case+ x of
  | Saturday() => false
  | Sunday() => false
  | _ => true
// end of [isWeekday]
    
  (* 
Recursive datatype 
*)  
datatype charlst = 
  | charlst_nil of ()
  | charlst_cons of (char, charlst)

fun charlst_length
  (cs: charlst):int = let 
  fun loop (cs: charlst, n: int):int = case cs of
  | charlst_nil() => n
  | charlst_cons(_, xs) => loop(xs, n+1)
  in
    loop(cs, 0)
  end
  
val cl1 = charlst_nil()
val cl2 = charlst_cons('a', charlst_nil())
val cl3 = charlst_cons('b',charlst_cons('a', charlst_nil()))

implement main0 () = 
  (
    println! (foo(x));
    println! (foo(y));
    
    println! (isWeekday(Monday));
    println! (isWeekday(Monday()));
    println! (isWeekday(Sunday()));

    println! (charlst_length(cl1));
    println! (charlst_length(cl2));
    println! (charlst_length(cl3));

  )
