
Definition prop0 : forall (A : Prop), A -> A := 
  fun A x => x.

Definition prop1 : forall (A B C : Prop), (B -> C) -> (A -> B) -> (A -> C) :=
  fun A B C f g x => f ( g (x)).

(*
Definition prop2 : foall (A : Type)(l1 l2 l3 : list A), 
  app l1 l3 = app l2 l3 => l1 = l2 := 
*)

