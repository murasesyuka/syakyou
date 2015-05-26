#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

fn square(x: double): double = x * x

typedef int2 = (int, int)

fn sqrsum2 (xy: int2): int = let
  val x = xy.0 and y = xy.1 in x*x+y*y
  end


implement main0 () = (
   println! (square(9.0));
   println! (sqrsum2( @(1,2) ));
)
