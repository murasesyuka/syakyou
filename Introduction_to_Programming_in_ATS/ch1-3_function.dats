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

fn abs(x: double): double = if x >= 0.0 then x else ~x

(* Recursive Functions *)
fun sum1 (n: int): int =  if n >= 1 then sum1(n-1) + n  else 0

fun sum2 (m: int, n: int): int = if m <= n then m + sum2(m+1, n) else 0

fun sum3 (m: int, n: int): int = 
  if m <= n then 
  let
    val mn2 = (m+n)/2 
  in
    sum3(m, mn2-1) + mn2 + sum3(mn2+1,n)
  end else 0
    
 
implement main0 () = (
  println! (square(9.0));
  println! (area_of_ring(10.0, 9.0));
  
  println! (sqrsum2( @(1,2) ));
  
  println! (abs(5.0));
  println! (abs(~3.0));
  
  println! (sum1(5));
  println! (sum2(0, 5));
  println! (sum3(0, 5));
)
