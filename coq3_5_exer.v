
(* problem 6 *)
Require Import List.

Theorem rev_involutive : forall (A : Type)(l : list A), rev (rev l) = l.
Proof.
induction l.
simpl.
reflexivity.
simpl.
rewrite rev_app_distr.
simpl.
f_equal.
apply IHl.
Qed.

(*(* problem 7 *)
Fixpoint fold_right (A B : Type)(f : B -> A -> A)(a0 : A)(l : list B) : A :=
  match l with
  | nil => a0
  | b :: t => f b (fold_right A B f a0 t)
  end.
*)
Theorem fold_right_app : forall (A B : Type)(f : B -> A -> A)(l l' : list B)(i : A),
  fold_right f i (l ++ l') = fold_right f (fold_right f i l') l.
Proof.
intros.
induction l.
simpl.
reflexivity.

simpl.
f_equal.
apply IHl.
Qed.


