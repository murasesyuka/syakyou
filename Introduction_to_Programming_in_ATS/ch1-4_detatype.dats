#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

//patscc -DATS_MEMALLOC_LIBC ch4_detatype.dats

datatype intopt =
  | intopt_none of () 
  | intopt_some of (int)

val x = intopt_some(3)
    
implement main0 () = case+ x of
      | intopt_some(x) => println! x
      | intopt_none => println! "none"
