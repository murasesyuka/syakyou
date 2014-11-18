
Require Import List.

(*
Fixpoint rev (A : Type)(l : list A) : list A :=
  match l with
  | nil => nil
  | x :: xs => rev A xs ++ (x :: nil)
  end.
*)

Theorem rev_app_distr : forall (A : Type)(l1 l2 : list A), rev (l1 ++ l2) = rev l2 ++ rev l1.
intros.
induction l1.
simpl.
rewrite app_nil_r.
reflexivity.
simpl.
rewrite app_assoc.
f_equal.
apply IHl1.
Qed.





