#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

fun sum(n: int): int = 
  let
    fun loop(i: int, res: int):<cloref1> int =
      if i <= qn then loop (i+1, res+i) else res
  in
    loop(1, 0)
  end

implement main0 () = (
  println! (sum(10));
)