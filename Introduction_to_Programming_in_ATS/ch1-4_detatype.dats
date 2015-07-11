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
  case x of
  | Monday() => true
  | Tuesday() => true
  | Wednesday() => true
  | Thursday() => true
  | Friday() => true
  | Saturday() => false
  | Sunday() => false
// end of [isWeekday]
    
implement main0 () = 
  (
    println! (foo(x));
    println! (foo(y));
    
    println! (isWeekday(Monday));
    println! (isWeekday(Monday()));
  )
