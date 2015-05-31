#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

fun fib (n: int): int =
  if n >= 2 then fib(n-1) + fib(n-2) else n
  
implement main0 () = (
  println! (fib(10));
)