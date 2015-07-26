#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

//patscc -DATS_MEMALLOC_LIBC ch2_tuple.dats 

(* function template **********************************************************)
typedef charint = (char, int)
typedef intchar = (int, char)
fun swap_char_int (xy: charint): intchar = (xy.1, xy.0)
fun swap_int_char (xy: intchar): charint = (xy.1, xy.0)

fun {a,b: t@ype} swap(xy: (a, b)) : (b, a) = (xy.1, xy.0)
fun {a: t@ype}{b: t@ype} swap2(xy: (a, b)) : (b, a) = (xy.1, xy.0)


(* val a = swap<intchar>((1,'b')) *)
val b = swap2<int><char>( (1,'b') )


typedef cfun (t1:t@ype, t2:t@ype) = t1 -<cloref1> t2

fun { 
a,b,c: t@ype 
} compose ( f: cfun(a,b), g: cfun(b,c)):<cloref1> cfun(a,c) = lam x => g(f(x))

val plus1 = lam (x:int): int =<cloref> x+1
val times2 = lam (x:int): int =<cloref> x*2

val f_2x_1 = compose<int,int,int> (times2, plus1)
val f_2x_2 = compose<int,int,int> (plus1, times2)

(* polymorphic function *******************************************************)
fun swap_boxed{a,b:type} (xy: (a, b)): (b, a) = (xy.1, xy.0)

val AB = ( box("A"), box("B") )
val BA1 = swap_boxed (AB)

  (* polymorphic datatype *)  
datatype list0 (a:t@ype) =
  | list0_nil  (a) of ()
  | list0_cons (a) of (a, list0 a)

fun{a:t@ype}
list0_length (xs: list0 a):int =
  (
    case+ xs of
    | list0_nil() => 0
    | list0_cons(_,xs) => 1 + list0_length(xs)
  )

val lst0 = list0_nil()
val lst1 = list0_cons('a', list0_nil())

(* val _ = $showtype a *)

implement main0 () = (
  (* println! ( a ); *)
  println! ( b.0 );

  println! ( f_2x_1(2) );
  println! ( f_2x_2(2) );

  println! (list0_length<char>(lst0));
  println! (list0_length(lst1));
)
