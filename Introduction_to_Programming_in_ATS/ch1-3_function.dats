#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

(*
  fnキーワードは"再帰をしない関数を定義"
 なのだけど、みな普通に"再帰をする関数を定義"のfunキーワードを使用しているとの事
*)  
//fn square(x: double): double = x * x
val square = lam (x:double): double => x * x

fn area_of_ring (R: double, r: double): double = 
  let
    val PI = 3.1416
  in
    PI * (square(R) - square(r))
  end


typedef int2 = (int, int)

fn sqrsum2 (xy: int2): int = let
  val x = xy.0 and y = xy.1 in x*x+y*y
  end


implement main0 () = (
  println! (square(9.0));
  println! (area_of_ring(10.0, 9.0));
  
  println! (sqrsum2( @(1,2) ));
)
