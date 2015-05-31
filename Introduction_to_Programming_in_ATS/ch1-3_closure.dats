#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

fun sum_cloref(n: int): int = 
  let
    fun loop(i: int, res: int):<cloref1> int =
      if i <= n then loop (i+1, res+i) else res
  in
    loop(1, 0)
  end

fun sum_envless(n: int): int = 
  let
    fun loop(n:int, i: int, res: int): int =
      if i <= n then loop (n, i+1, res+i) else res
  in
    loop(n, 1, 0)
  end
  
(* Higher-Order Functions *)
fun rtfind(f: int -> int): int = 
  let
    fun loop (f: int -> int, n: int) : int =
      if f(n) = 0 then n else loop (f, n+1)
  in
    loop (f, 0)
  end

fun ifold(n: int, f: (int,int) -> int, ini: int): int  = 
  if n > 0 then f(ifold(n-1, f, ini), n) else ini

fun sum(n: int): int  = ifold(n, lam(res, x) => res + x, 0)
fun prod(n: int): int = ifold(n, lam(res, x) => res * x, 1)

fun sqrsum(n: int): int = ifold(n, lam(res, x) => res + x * x, 0)

implement main0 () = (
  println! (sum_cloref(10));
  println! (sum_envless(10));
  
  println! (rtfind(lam(x:int) => x*x - x - 110));
  
  println! (sum(5));
  println! (prod(5));
  
  println! (sqrsum(5));
)