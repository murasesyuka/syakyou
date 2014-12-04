
Definition exer0 : forall(A B : Prop), A -> (A -> B) -> B := 
  fun A B x f => f(x).

Definition exer1 : forall(A B C : Prop), (A -> B -> C) -> (B -> A -> C) := 
  fun A B C f x y => f y x.