#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

val x =1+2

val area = let val PI= 3.14 and radius = 10.0 
  in PI * radius * radius
  end

%{
#define get_true() 0
%}

//extern fun print_bool:void = "mac#"
extern fun get_false():bool = "mac#get_true"

implement main0 () = print(get_false())
