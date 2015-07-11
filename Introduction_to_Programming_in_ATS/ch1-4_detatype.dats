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
    
implement main0 () = 
  (
    println! (foo(x));
    println! (foo(y));
  )
