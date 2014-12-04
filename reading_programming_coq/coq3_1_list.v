
Inductive list (A : Type) : Type :=
| nil : list A
| cons : A -> list A -> list A.

(* copy code is error
Fixpoint app (A : Type)(l l' : list A) : list A :=
  match l with
  | nil => l'
  | cons x xs => cons x (app A xs l')
  end.
*)

Fixpoint app (A : Type)(l l' : list A) : list A :=
  match l with
    | nil => l'
    | cons x xs => cons A x ( app A xs l' )(* Add cons *A* x (...) *)
  end.

Open Scope list_scope.

(* app (1 2 3) (4 5 6). *) (* how to do like this *)

Close Scope list_scope.





