#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

fun fib (n: int): int =
  if n >= 2 then fib(n-1) + fib(n-2) else n
  
fun f91 (n: int): int =
  if n >= 101 then n - 10 else f91 (f91 (n+11))

fun sum_iter (n: int, acc: int): int =
  if n>0 then sum_iter(n-1, acc+n) else acc

implement main0 () = (
  println! (fib(10));
  
  println! (f91(10));
  
  println! (sum_iter(10, 0));
)