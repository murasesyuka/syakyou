(*
Definition plus (n : nat)(m : nat) : nat := n + m.

Definition plus (n m : nat) : nat := n + m.
*)
Definition plus n m := n + m.

Definition plus' : nat -> nat -> nat := fun n m => n + m.

Definition id (A : Type)(x : A) : A := x.

Definition id' : forall (A : Type), A -> A := fun A x => x.
  
Print plus.

Eval compute in plus 1 2.

