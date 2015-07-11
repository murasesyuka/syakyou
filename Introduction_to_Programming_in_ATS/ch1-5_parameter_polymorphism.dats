#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

//patscc -DATS_MEMALLOC_LIBC ch2_tuple.dats 

(* val _ = $showtype xyz *)

(* function template **********************************************************)
typedef charint = (char, int)
typedef intchar = (int, char)
fun swap_char_int (xy: charint): intchar = (xy.1, xy.0)
fun swap_int_char (xy: intchar): charint = (xy.1, xy.0)

fun {a,b: t@ype} swap(xy: (a, b)) : (b, a) = (xy.1, xy.0)
fun {a: t@ype}{b: t@ype} swap2(xy: (a, b)) : (b, a) = (xy.1, xy.0)


val a = swap<intchar>((1,'b'))
val b = swap2<int><char>( (1,'b') )

(* polymorphic function *******************************************************)
val _ = $showtype a

implement main0 () = (
  println! ( a );
  println! ( b.0 );
)
