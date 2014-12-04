
(* list *)
Inductive list (A : Type) :=
| nil : list A
| cons : A -> list A -> list A.


(* not *)
Inductive False : Prop :=.

Definition not (A : Prop) := A -> False.


(*** practive with not ***)
Goal forall (P : Prop), P -> ~~P.
Proof.
  intros.
  intro.
  apply H0.
  apply H.
Qed.

(* or *)
(*
Inductive or (A B : Prop) : Prop :=
  | or_introl : A -> or A B
  | or_intror : B -> or A B.
*)
Inductive or (A B : Prop) : Prop :=
  | or_introl : A -> or A B
  | or_intror : B -> or A B.

(*** practise with or ***)
Goal forall (P Q : Prop), P \/ Q -> Q \/ P.
Proof.
  intros.
  (*
  case H.
  apply or_introl.
   (* Error: Impossible to unify "or ?197 ?198" with "Q \/ P". *)
   *)
  destruct H.
  right.
  apply H.
  left.
  apply H.
Qed.

(* and *)
Inductive and (A B : Prop) : Prop :=
  conj : A -> B -> and A B.

(*** practise with and ***)
Goal forall (P Q : Prop), P /\ Q -> Q /\ P.
Proof.
  intros.
  destruct H.
  split.
  apply H0.
  apply H.
Qed.




