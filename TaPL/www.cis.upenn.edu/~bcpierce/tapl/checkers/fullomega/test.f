/* Examples for testing */

 "hello";

unit;

lambda x:A. x;

let x=true in x;

timesfloat 2.0 3.14159;

lambda x:Bool. x;
(lambda x:Bool->Bool. if x false then true else false) 
  (lambda x:Bool. if x then false else true); 

lambda x:Nat. succ x;
(lambda x:Nat. succ (succ x)) (succ 0); 

T = Nat->Nat;
lambda f:T. lambda x:Nat. f (f x);


lambda X. lambda x:X. x; 
(lambda X. lambda x:X. x) [All X.X->X]; 

 {*All Y.Y, lambda x:(All Y.Y). x} as {Some X,X->X};


{x=true, y=false}; 
{x=true, y=false}.x;
{true, false}; 
{true, false}.1; 


{*Nat, {c=0, f=lambda x:Nat. succ x}}
  as {Some X, {c:X, f:X->Nat}};
let {X,ops} = {*Nat, {c=0, f=lambda x:Nat. succ x}}
              as {Some X, {c:X, f:X->Nat}}
in (ops.f ops.c);



Pair = lambda X. lambda Y. All R. (X->Y->R) -> R;

pair = lambda X.lambda Y.lambda x:X.lambda y:Y.lambda R.lambda p:X->Y->R.p x y;

f = lambda X.lambda Y.lambda f:Pair X Y. f;

fst = lambda X.lambda Y.lambda p:Pair X Y.p [X] (lambda x:X.lambda y:Y.x);
snd = lambda X.lambda Y.lambda p:Pair X Y.p [Y] (lambda x:X.lambda y:Y.y);

pr = pair [Nat] [Bool] 0 false;
fst [Nat] [Bool] pr;
snd [Nat] [Bool] pr;

List = lambda X. All R. (X->R->R) -> R -> R; 

diverge =
lambda X.
  lambda _:Unit.
  fix (lambda x:X. x);

nil = lambda X.
      (lambda R. lambda c:X->R->R. lambda n:R. n)
      as List X; 

cons = 
lambda X.
  lambda hd:X. lambda tl: List X.
     (lambda R. lambda c:X->R->R. lambda n:R. c hd (tl [R] c n))
     as List X; 

isnil =  
lambda X. 
  lambda l: List X. 
    l [Bool] (lambda hd:X. lambda tl:Bool. false) true; 

head = 
lambda X. 
  lambda l: List X. 
    (l [Unit->X] (lambda hd:X. lambda tl:Unit->X. lambda _:Unit. hd) (diverge [X]))
    unit; 

tail =  
lambda X.  
  lambda l: List X. 
    (fst [List X] [List X] ( 
      l [Pair (List X) (List X)]
        (lambda hd: X. lambda tl: Pair (List X) (List X). 
          pair [List X] [List X] 
            (snd [List X] [List X] tl)  
            (cons [X] hd (snd [List X] [List X] tl))) 
        (pair [List X] [List X] (nil [X]) (nil [X]))))
    as List X; 

/* exer.24.2.1 */
stackADT =
      {*List Nat,
       {new = nil [Nat]}}
       as 
      {Some Stack, {new:Stack}};

stack2ADT =
      {*List Nat,
       {new = nil [Nat],
        isempty = isnil [Nat]}}
       as
      {Some Stack, 
       {new:Stack,
       isempty:Stack->Bool}};

stack3ADT =
      {*List Nat,
       {new = nil [Nat],
        push = lambda n:Nat. lambda l:List Nat. cons [Nat] n l,
        top = lambda l:List Nat. head [Nat] l,
        pop = lambda l:List Nat. tail [Nat] l,
        isempty = isnil [Nat]}}
       as 
      {Some Stack,
       {new:Stack,
        push:Nat->Stack->Stack,
        top:Stack->Nat,
        pop:Stack->Stack,
        isempty:Stack->Bool}};

let {Stack,stack} = stack3ADT in
      stack.top (stack.push 5 (stack.push 3 stack.new));

/* 
let {Stack,stack} = stack3ADT in
      stack.pop (stack.push 7 (stack.push 4 stack.new));
      */

counter1ADT =
      {*Nat,
      {new = 1,
      get = lambda i:Nat. i,
      inc = lambda i:Nat. succ(i)}}
      as { Some Counter,
      {new:Counter,get:Counter->Nat,inc:Counter->Counter}};
      
let {Counter,cnt} = counter1ADT in
      cnt.get (cnt.inc (cnt.inc cnt.new));

/*      
iseven = 
   lambda n:Nat. if iszero n then true else false)
*/  

      
/*
let {Counter,cnt} = counter1ADT in
let {FF,ff} = 
      {*Counter,
       {new = counter.new,
        read = lambda c:Counter. iseven (counter.get c),
        toggle=lambda c:Counter. counter.inc c,
        reset =lambda c:Counter. counter.new}}
       as
       {Some FF,
        {new: FF,
         read: FF->Bool, 
         toggle: FF->FF,
         reset:FF->FF}} in
        ff.toggle (ff.toggle ff.new);
*/
      
/* exer.24.2.2 */


counterADT =
      {*Ref Nat,
       {new = lambda _:Unit. ref 1,
        get = lambda r:Ref Nat. !r,
        inc = lambda r:Ref Nat. r := succ(!r)}}
      as 
       {Some Counter,
        {new: Unit->Counter,
         get: Counter->Nat,
         inc: Counter->Unit}};

