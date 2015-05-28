#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"


//patscc -DATS_MEMALLOC_LIBC ch2_tuple.dats 
val xyz = '("ATS", 42, 3.14)

val _ = $showtype xyz

implement main0 () = 
  (
    println! xyz.0;
    println! xyz.1;
    println! xyz.2;
  )
