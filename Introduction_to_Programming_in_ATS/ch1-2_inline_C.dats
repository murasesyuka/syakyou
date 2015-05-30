#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

val x = ~1 + 2 //nagative use tilde

(*
val area = 
  let 
    val PI= 3.14 and radius = 10.0 
  in 
    PI * radius * radius
  end
*)

var area = PI * radius * radius where {
  val PI = 3.14 and radius = 10
}

%{
void print_bool(int b) {
  printf("%d\n", b);
}

#define get_true() 0
%}

extern fun print_bool(bool):void = "mac#"
extern fun get_false():bool = "mac#get_true"

implement main0 () = 
  (
    print_bool(true); 
    print_bool(false);
    println!(get_false());
    
    println! x;
    println! area;
  )
