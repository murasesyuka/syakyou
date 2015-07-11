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

  (* 
Exhaustiveness 
*)
fun charlst_last(cs: charlst): char =
  case+ cs of
  | charlst_nil () => '0'
  | charlst_cons (x, charlst_nil()) => x
  | charlst_cons (_, xs) => charlst_last(xs)

datatype bstree =
  | E of ()
  | B of (bstree,string,bstree)

fun bstree_inord(t0: bstree, fwork: string -<cloref1> void):void =
(
  case+ t0 of
  | E() => ()
  | B(t1, k, t2) =>
    (
      bstree_inord(t1, fwork);
      fwork(k);
      bstree_inord(t2, fwork);
    )
)

val bst = B(B(E(),"right",E()),
  "root",
  B(E(),"left",E()))

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

    println! (charlst_last(cl1));
    println! (charlst_last(cl2));
    println! (charlst_last(cl3));

    bstree_inord(bst, lam x => println!(x));
  )
