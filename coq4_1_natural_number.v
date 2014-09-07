
Inductive nat : Set := 
  | O : nat              (* 0(ゼロ) ではなく O(オー)です *)
  | S : nat -> nat.      (* succ *)

Fixpoint plus (n m : nat) : nat :=
  match n with
  | O => m
  | S p => S (plus p m)
  end.

Fixpoint mult (n m : nat) : nat :=
  match n with
  | O => O
(*  | S p => m + mult p m*)
  | S p => plus m (mult p m)
  end.


(* natural number induction *)
Goal forall (n : nat), n = plus n O. (* n + 0.*)
intros.