
Goal forall (P Q : Prop), (forall P : Prop, (P -> Q) -> Q) -> ((P -> Q) -> P) ->  P.
intros.
apply H0.
intro.
apply (H (P -> Q)).
apply (H P).
Qed.