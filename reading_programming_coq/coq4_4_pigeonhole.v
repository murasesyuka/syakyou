
(* Pigeonhole principle *)
Require Import Arith.

Inductive InList (A : Type)(a : A) : list A -> Prop :=
| headIL : forall xs, InList A a (a::xs)
| consIL : forall x xs, InList A a xs -> InList A a (x::xs).

(*
pigeonhole : forall (xs : list nat),
  length xs < fold_right plus 0 xs -> exists x : nat, InList nat (S (S x)) xs
*)


Require Import List.
Require Import Arith.

(*
Fixpoint fold_right (A B : Type)(f : B -> A -> A)(a0 : A)(l : list B) : A :=
  match l with
  | nil => a0
  | b :: t => f b (fold_right A B f a0 t)
  end.
*)

Theorem pigeonhole : forall (xs : list nat),
  length xs < fold_right plus 0 xs -> exists x : nat, InList nat (S (S x)) xs.
  intros.
  induction xs.
  simpl in H.
  apply False_ind.
  apply (lt_n_O 0 H).
  simpl in H.
  destruct a.
  apply lt_Snm_nm in H.

