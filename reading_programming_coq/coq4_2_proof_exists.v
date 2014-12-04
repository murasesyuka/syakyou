
(* natural number induction *)
Goal forall (n : nat), n = n + 0.
  intros.
  induction n.
  (* 0 = 0 + 0 *)
  simpl.
  reflexivity.
  (*S n = S n = 0*)
  simpl.
  f_equal.
  apply IHn.
Qed.

  
(* proof exists *)
Require Import Arith.

Goal forall (n : nat), (exists m : nat, n = m * 4) -> exists k : nat, n = k * 2.
  intros.
  destruct H.
  exists (x * 2).
  rewrite mult_assoc_reverse.
  simpl.
  apply H.
Qed.





