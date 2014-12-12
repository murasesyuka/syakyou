Inductive day : Type :=
| monday : day
| tuesday : day
| wednesday : day
| thursday : day
| friday : day
| saturday : day
| sunday : day.

Definition next_weekday (d:day) : day :=
  match d with
    | monday => tuesday
    | tuesday => wednesday
    | wednesday => thursday
    | thursday => friday
    | friday => monday
    | saturday => monday
    | sunday => monday
  end.

Eval simpl in (next_weekday friday).
Eval simpl in (next_weekday (next_weekday saturday)).

Example test_next_weekday:
  (next_weekday (next_weekday saturday)) = tuesday.
Proof.
  simpl.
  reflexivity.
Qed.

(* Bool Type *)

Inductive bool : Type :=
| true : bool
| false : bool.

Definition negb (b:bool) : bool :=
  match b with
    | true => false
    | false => true
  end.

Definition andb (b1:bool) (b2:bool) : bool :=
  match b1 with
    | true => b2
    | false => false
  end.

Definition orb (b1:bool) (b2:bool) : bool :=
  match b1 with
    | true => true
    | false => b2
  end.

Example test_orb1: (orb true false) = true.
Proof. simpl. reflexivity. Qed.

Example test_orb2: (orb false false) = false.
Proof. simpl. reflexivity. Qed.

Example test_orb3: (orb false true ) = true.
Proof. simpl. reflexivity. Qed.

Example test_orb4: (orb true true ) = true.
Proof. simpl. reflexivity. Qed.


(* admit *)

Definition admit {T: Type} : T. Admitted.

(* 練習問題: ★ (nandb) *)


Definition nandb (b1:bool) (b2:bool) : bool :=
  (negb (andb b1 b2)).


Example test_nandb1: (nandb true false) = true.
Proof. simpl. simpl. intros. reflexivity. Qed.
Example test_nandb2: (nandb false false) = true.
Proof. simpl. reflexivity. Qed.
Example test_nandb3: (nandb false true) = true.
Proof. simpl. reflexivity. Qed.
Example test_nandb4: (nandb true true) = false.
Proof. simpl. reflexivity. Qed.

(* 練習問題: ★ (andb3) *)


Definition andb3 (b1:bool) (b2:bool) (b3:bool) : bool :=
  match b1 with
    | false => false
    | true => (andb b2 b3)
  end.

Example test_andb31: (andb3 true true true) = true.
Proof. reflexivity. Qed.
Example test_andb32: (andb3 false true true) = false.
Proof. reflexivity. Qed.
Example test_andb33: (andb3 true false true) = false.
Proof. reflexivity. Qed.
Example test_andb34: (andb3 true true false) = false.
Proof. reflexivity. Qed.


(* 関数の型 *)

Check (negb true).

Check negb.


(* Module *)

Module Playground1.
  
Inductive nat : Type :=
| O : nat
| S : nat -> nat. (* typo *)
  
Definition pred (n : nat) : nat :=
  match n with
    | O => O
    | S n' => n'
  end.
  
End Playground1.

Definition minustwo (n : nat) : nat :=
  match n with
    | O => O
    | S O => O
    | S (S n') => n'
  end.


Check O.
Check (S O).
Check (S (S O)).
Check (S (S (S O))).
Check (S (S (S (S O)))).
Eval simpl in (minustwo 4).

Check S.
Check pred.
Check minustwo.

Fixpoint evenb (n:nat) : bool :=
  match n with
    | O => true
    | S O => false
    | S (S n') => evenb n'
  end.

Definition oddb (n:nat) : bool := negb (evenb n).

Example test_oddb1: (oddb (S O)) = true.
Proof. simpl. reflexivity. Qed.
Example test_oddb2: (oddb (S (S (S (S O))))) = false.
Proof. simpl. reflexivity. Qed.


Module Playground2.

Fixpoint plus (n m:nat) : nat :=
  match n with
    | O => m
    | S n' => S (plus n' m)
  end.

Eval simpl in (plus (S (S (S O))) (S (S 0))).
Check plus.

Fixpoint mult (n m:nat) : nat :=
  match n with
    | O => O
    | S n' => plus m (mult n' m)
  end.

Eval simpl in (mult (S (S (S O))) (S (S 0))).
Check mult.

Fixpoint minus (n m:nat): nat:=
  match n, m with
    | O, _ => O
    | S _, O => n
    | S n', S m' => minus n' m'
  end.

Eval simpl in (minus (S (S (S O))) (S (S 0))).

End Playground2.


(* 演習問題: ★ (factorial) *)

Fixpoint factorial (n:nat) : nat :=
  match n with
    | O => S O
    | S n' => mult n (factorial n')
  end.

Example test_factorial1: (factorial 3) = 6.
Proof. simpl. reflexivity. Qed.

Example test_factorial2: (factorial 5) = (mult 10 12).
Proof. simpl. reflexivity. Qed.

(* "notation"（表記法） *)
          
Notation "x + y" := (plus x y) (at level 50, left associativity) : nat_scope.
Notation "x - y" := (minus x y) (at level 50, left associativity) : nat_scope.
Notation "x * y" := (mult x y) (at level 40, left associativity) : nat_scope.

Check ((0 + 1) + 1).

Check O%nat.

Fixpoint beq_nat (n m:nat):bool :=
  match n with
    | O => match m with
             | O => true
             | S m' => false
           end
    | S n' => match m with
                | O => true
                | S m' => beq_nat n' m'
              end
  end.

Fixpoint ble_nat (n m : nat) : bool :=
  match n with
    | O => true
    | S n' =>
      match m with
        | O => false
        | S m' => ble_nat n' m'
      end
  end.

Example test_ble_nat1: (ble_nat 2 2) = true.
Proof. simpl. reflexivity. Qed.
Example test_ble_nat2: (ble_nat 2 4) = true.
Proof. simpl. reflexivity. Qed.
Example test_ble_nat3: (ble_nat 4 2) = false.
Proof. simpl. reflexivity. Qed.



(* 練習問題: ★★ (blt_nat) *)

Fixpoint blt_nat (n m : nat) : bool :=
  andb (ble_nat n m) (negb (beq_nat n m)).
  (*
  match n with
    | O => match m with
             | O => false
             | _ => true
           end
    | S n' => match m with
                | O => false
                | S m' => blt_nat n' m'
              end
  end.
   *)


Example test_blt_nat1: (blt_nat 2 2) = false.
Proof. simpl. reflexivity. Qed.
Example test_blt_nat2: (blt_nat 2 4) = true.
Proof. simpl. reflexivity. Qed.
Example test_blt_nat3: (blt_nat 4 2) = false.
Proof. simpl. reflexivity. Qed.


(* 簡約を用いた証明 *)

Theorem plus_O_n : forall n:nat, O + n = n.
Proof.
  simpl.
  reflexivity.
Qed.  

Theorem plus_O_n' : forall n:nat, O + n = n.
Proof.
  reflexivity.
Qed.  


(* 練習問題: ★, optional (simpl_plus) *)


Eval simpl in (forall n:nat, n + 0 = n).

Eval simpl in (forall n:nat, 0 + n = n).

(* 0+nは無条件で0に簡約されるもよう *)

Theorem plus_O_n'' : forall n:nat, O + n = n.
Proof.
  intros.
  reflexivity.
Qed.

Theorem plus_1_l : forall n:nat, 1 + n = S n.
Proof.
  intros n. reflexivity. Qed.

Theorem mult_0_l : forall n:nat, 0 * n = 0.
Proof.
  intros n.
  simpl.
  reflexivity.
Qed.



