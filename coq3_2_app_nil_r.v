
Require Import List.
Theorem app_nil_r : forall (A : Type)(l : list A), l ++ nil = l.
Proof.
intros.
induction l.
reflexivity.
simpl.
apply (f_equal (cons a)).
apply IHl.
Qed.

