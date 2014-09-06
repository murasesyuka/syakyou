
Require Import List.
Theorem app_assoc : forall (A : Type)(l1 l2 l3 : list A), l1 ++ (l2 ++ l3) = (l1 ++ l2) ++ l3.
Proof.
intros.
induction l1.
reflexivity.
simpl.
f_equal.
apply IHl1.
Qed.
