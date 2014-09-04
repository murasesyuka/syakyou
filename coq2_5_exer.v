
(* problem3 *)
Goal forall (P : Prop), ~(P /\ ~P).
Proof.
intros.
intro.
apply H.
destruct H.
apply H.
Qed.

(* problem4 *)
Goal forall (P Q : Prop), ~P \/ ~Q -> ~(P /\ Q).
Proof.
intros.
intro.
destruct H0.
destruct H.
apply H.
apply H0.
apply H.
apply H1.
Qed.

(* problem5 not Qed *)
Goal forall(P : Prop), (forall (P : Prop), ~~P -> P) -> P \/ ~P.
Proof.
intros.
left.
apply H.
intro.
apply H0.
apply H.
intro.
apply H1.








