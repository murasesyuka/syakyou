#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

//patscc -DATS_MEMALLOC_LIBC ch2_tuple.dats 

(* unbox tuple *)

val xyz = ("ATS", 42, 3.14)
val (x,y,z) = xyz


(* record *)

typedef point2D = @{x=double, y=double}

val origin = @{x=0.0, y=0.0} : point2D


val _ = $showtype xyz

implement main0 () = 
  (
    println! xyz.0;
    println! xyz.1;
    println! xyz.2;
    
    println! x;
    println! y;
    println! z;
    
    println! origin.x;
    println! origin.y;
  )
