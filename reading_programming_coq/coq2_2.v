
Goal forall (P Q : Prop), (forall L : Prop, (L -> Q) -> Q) -> ((P -> Q) -> P) ->  P.
  intros.
  apply H0.
  intro.
  apply (H (P -> Q)).
  apply (H P).
Qed.